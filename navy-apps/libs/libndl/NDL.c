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

void NDL_GetCanvasSize(int *w, int *h)
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
}

void NDL_OpenCanvas(int *w, int *h) {
  if(!(*w) && !(*h))
      NDL_GetCanvasSize(w, h);
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
  printf("width:%d   height:%d\n", screen_w, screen_h);
}

void NDL_DrawRect(uint32_t *pixels, int x, int y, int w, int h) {
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
