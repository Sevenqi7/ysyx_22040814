#include <am.h>
#include <nemu.h>

#define KEYDOWN_MASK 0x8000

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  int scan_code = inl(KBD_ADDR);
  kbd->keydown = scan_code & KEYDOWN_MASK;
  if(kbd->keydown)
      kbd->keycode = scan_code;
  else
      kbd->keycode = AM_KEY_NONE;
}
