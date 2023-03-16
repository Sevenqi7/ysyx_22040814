#include <am.h>
#include <nemu.h>
#include <stdio.h>
#include <string.h>

#define SYNC_ADDR (VGACTL_ADDR + 4)

static int width, height;

void __am_gpu_init() {
  uint32_t screen_size = inl(VGACTL_ADDR);
  width = screen_size >> 16;
  height = screen_size & 0xffff;
}

void __am_gpu_config(AM_GPU_CONFIG_T *cfg) {
  // *cfg = (AM_GPU_CONFIG_T) {
  //   .present = true, .has_accel = false,
  //   .width = 0, .height = 0,
  //   .vmemsz = 0
  // };
      
      uint32_t screen_size = inl(VGACTL_ADDR);
      cfg->width = screen_size >> 16;
      cfg->height = screen_size & 0xffff;
}

void __am_gpu_fbdraw(AM_GPU_FBDRAW_T *ctl) {
  // while(1);

  uint32_t *draw_addr = (uint32_t *)(uintptr_t)(FB_ADDR )+ ctl->y * 400 + ctl->x;
  uint32_t *pixel = (uint32_t *)ctl->pixels;
  if(ctl->x)
  // printf("\nx:%d, y:%d\n", ctl->x, ctl->y);
  // printf("draw start:%d", (uint64_t)draw_addr);
  for(int i=ctl->y;i<ctl->y+ctl->h;i++)
  {
      if(i >= height) break;
      int k;
      for(k=ctl->x;k<ctl->x+ctl->w;k++)
      {
          if(k >= width) break;
          *draw_addr++ = *pixel++;
      }
      draw_addr = (uint32_t *)(uintptr_t)(FB_ADDR) + i * 400 + ctl->x;
  }
  // for(int i=ctl->x;i<ctl->x+ctl->w;i++)
  // {
  //     if(i >= width) break;
  //     int k;
  //     for(k=ctl->y;k<ctl->y+ctl->h;k++)
  //     {
  //         if(k >= height) break;
  //         *draw_addr++ = *pixel++;
  //     }
  //     draw_addr = (uint32_t *)(uintptr_t)(FB_ADDR + k * 400 + ctl->x);
  // }
  
  if (ctl->sync) {
    outl(SYNC_ADDR, 1);
  }
}

void __am_gpu_status(AM_GPU_STATUS_T *status) {
  status->ready = true;
}
