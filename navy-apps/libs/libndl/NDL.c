#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <unistd.h>
#include <assert.h>
#include <sys/time.h>

static int evtdev = -1;
static int fbdev = -1;
static int screen_w = 0, screen_h = 0;
static int canva_w, canva_h;

uint32_t NDL_GetTicks() {
  struct timeval tv;
  assert(!gettimeofday(&tv, NULL));
  return tv.tv_sec * 1000 + tv.tv_usec / 1000;
}

int NDL_PollEvent(char *buf, int len) {
  int fd = open("/dev/events", 0, 0);
  if(read(fd, buf, len))
      return 1;
  return 0;
}

void NDL_GetScreenSize(int *w, int *h)
{
    char buf[64];
    int fd = open("/proc/dispinfo", 0, 0);
    if(fd == -1) {
    printf("Failed to read dispinfo\n");
      return ;
    }
    read(fd, buf, 64);
    char *p = buf;
    if(!strncmp(p, "WIDTH", 5))
    {
        p += 5;
        while(*p == ' ') p++;
        if(*p++ != ':'){
          printf("Invalid dispinfo format: missing \":\"\n");
          return ;
        }
        while(*p == ' ') p++;
        *w = atoi(p);
        while(*p++ != '\n');
        if(!strncmp(p, "HEIGHT", 6))
        {
          p += 6;
          while(*p == ' ') p++;
          if(*p++ != ':'){
            printf("Invalid dispinfo format. missing \":\"\n");
            return ;
          }
          while(*p == ' ') p++;
          *h = atoi(p);
        }
    }
    close(fd);
}

void NDL_OpenCanvas(int *w, int *h) {
  NDL_GetScreenSize(&screen_w, &screen_h);
  if(!(*w) && !(*h))
    *w = screen_w, *h = screen_h;
  if(getenv("NWM_APP")) {
    int fbctl = 4;
    fbdev = 5;
    screen_w = *w; screen_h = *h;
    char buf[64];
    int len = sprintf(buf, "%d %d", screen_w, screen_h);
    // let NWM resize the window and create the frame buffer
    write(fbctl, buf, len);
    while (1) {
      // 3 = evtdev
      int nread = read(3, buf, sizeof(buf) - 1);
      if (nread <= 0) continue;
      buf[nread] = '\0';
      if (strcmp(buf, "mmap ok") == 0) break;
    }
    close(fbctl);
  }
  canva_w = *w, canva_h = *h;
  printf("screen_width:%d   screen_height:%d\n", screen_w, screen_h);
  printf("canva height:%d   canva height: %d\n", canva_h, canva_w);
}

void NDL_DrawRect(uint32_t *pixels, int x, int y, int w, int h) {
  int fd = open("/dev/fb", 0, 0);
  if(fd == -1) {printf("Failed to open /dev/fb!\n"); assert(0);}
  uint64_t draw_offset = (((screen_h - canva_h) / 2 + y) * screen_w + ((screen_w - canva_w) / 2 + x)) * sizeof(uint32_t);
  for(int i=y;i<y+h;i++)
  {
    lseek(fd, draw_offset, SEEK_SET);
    write(fd, pixels, w * sizeof(uint32_t));
    draw_offset += screen_w * sizeof(uint32_t);
    pixels += w;
  }

  close(fd);
}

void NDL_OpenAudio(int freq, int channels, int samples) {
}

void NDL_CloseAudio() {
}

int NDL_PlayAudio(void *buf, int len) {
  return 0;
}

int NDL_QueryAudio() {
  return 0;
}

int NDL_Init(uint32_t flags) {
  if (getenv("NWM_APP")) {
    evtdev = 3;
  }
  return 0;
}

void NDL_Quit() {
}
