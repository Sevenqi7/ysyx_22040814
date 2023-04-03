#include <common.h>

#if defined(MULTIPROGRAM) && !defined(TIME_SHARING)
# define MULTIPROGRAM_YIELD() yield()
#else
# define MULTIPROGRAM_YIELD()
#endif

#define KEYDOWN_MASK 0x8000

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
  uint32_t scancode;
  ioe_read(AM_INPUT_KEYBRD, &scancode);
  uint32_t keydown = scancode & KEYDOWN_MASK;
  uint32_t keycode = scancode & (~KEYDOWN_MASK);
  if(keycode == AM_KEY_NONE) return 0;
  return snprintf(buf, len, "%s %s\n", keydown ? "kd" : "ku", keyname[keycode]);
}

size_t dispinfo_read(void *buf, size_t offset, size_t len) {
  return 0;
}

size_t fb_write(const void *buf, size_t offset, size_t len) {
  return 0;
}

void init_device() {
  Log("Initializing devices...");
  ioe_init();
}
