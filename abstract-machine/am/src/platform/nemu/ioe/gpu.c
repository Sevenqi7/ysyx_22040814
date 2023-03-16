#include <am.h>
#include <nemu.h>
#include <stdio.h>

#define SYNC_ADDR (VGACTL_ADDR + 4)

void __am_gpu_init() {
  int i;
  uint32_t screen_size = inl(VGACTL_ADDR);
  printf("%d\n", screen_size);
  int w = screen_size >> 16;  // TODO: get the correct width
  int h = screen_size & 0xffff;  // TODO: get the correct height
  printf("\nw:%d, h:%d\n", w, h);
  uint32_t *fb = (uint32_t *)(uintptr_t)FB_ADDR;
  for (i = 0; i < w * h; i ++) fb[i] = i;
  outl(SYNC_ADDR, 1);
}

void __am_gpu_config(AM_GPU_CONFIG_T *cfg) {
  // *cfg = (AM_GPU_CONFIG_T) {
  //   .present = true, .has_accel = false,
  //   .width = 0, .height = 0,
  //   .vmemsz = 0
  // };
      uint32_t screen_size = (cfg->width << 16) | cfg->height;
      outl(VGACTL_ADDR, screen_size);
}

void __am_gpu_fbdraw(AM_GPU_FBDRAW_T *ctl) {
  int width, height;
  int screen_size = inl(VGACTL_ADDR);
  width = screen_size >> 16;
  height = screen_size & 0xffff;
  uint32_t draw_addr = FB_ADDR + ctl->x * width;
  uint32_t *pixel = (uint32_t *)ctl->pixels;
  if(ctl->x)
  printf("\nx:%d, y:%d\n", ctl->x, ctl->y);

  for(int i=ctl->y;i<ctl->y+ctl->h;i++)
  {
      if(i > height) break;
      for(int k=ctl->x;k<ctl->x+ctl->w;k++)
      {
          if(k > width) break;
          *((uint32_t *)(uintptr_t)(draw_addr)) = *pixel++;
          draw_addr++;
      }
      draw_addr = FB_ADDR + i * width;
  }
  if (ctl->sync) {
    outl(SYNC_ADDR, 1);
  }
}

void __am_gpu_status(AM_GPU_STATUS_T *status) {
  status->ready = true;
}
