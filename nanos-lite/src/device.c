#include <common.h>

#if defined(MULTIPROGRAM) && !defined(TIME_SHARING)
# define MULTIPROGRAM_YIELD() yield()
#else
# define MULTIPROGRAM_YIELD()
#endif

#define NAME(key) \
  [AM_KEY_##key] = #key,

static const char *keyname[256] __attribute__((used)) = {
  [AM_KEY_NONE] = "NONE",
  AM_KEYS(NAME)
};

size_t serial_write(const void *buf, size_t offset, size_t len) {
  for(int i=0;i<len;i++) putch(((char *)buf)[i]);
  return len;
}

size_t events_read(void *buf, size_t offset, size_t len) {
  AM_INPUT_KEYBRD_T kbd;
  ioe_read(AM_INPUT_KEYBRD, &kbd);
  if(kbd.keycode == AM_KEY_NONE) return 0;
  printf("receive key:%s\n", keyname[kbd.keycode]);
  return snprintf(buf, len, "%s %s", kbd.keydown ? "kd" : "ku", keyname[kbd.keycode]);
}

static int width = -1, height = -1;

size_t dispinfo_read(void *buf, size_t offset, size_t len) {
  AM_GPU_CONFIG_T cfg;
  ioe_read(AM_GPU_CONFIG, &cfg);
  return snprintf(buf, len, "WIDTH  :%d\nHEIGHT:  %d\n", cfg.width, cfg.height);
}

size_t fb_write(const void *buf, size_t offset, size_t len) {
  if(width == -1 || height == -1)
  {
    AM_GPU_CONFIG_T cfg;
    ioe_read(AM_GPU_CONFIG, &cfg);
    width = cfg.width;
    height = cfg.height;
  }
  offset /= sizeof(uint32_t);
  int y = offset / width, x = offset % width;
  AM_GPU_FBDRAW_T ctl;
  ctl.x = x, ctl.y = y;
  ctl.w = len / sizeof(uint32_t), ctl.h = 1;
  ctl.pixels = (uint32_t *)buf;
  ctl.sync = 1;
  ioe_write(AM_GPU_FBDRAW, &ctl);
  return 0;
}

void init_device() {
  Log("Initializing devices...");
  ioe_init();
}
