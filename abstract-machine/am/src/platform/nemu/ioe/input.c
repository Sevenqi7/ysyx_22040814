#include <am.h>
#include <nemu.h>
#include <stdio.h>

#define KEYDOWN_MASK 0x8000

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  // int scan_code = inl(KBD_ADDR);
  // kbd->keydown = scan_code & KEYDOWN_MASK;
  // kbd->keycode = scan_code & (~KEYDOWN_MASK);
}
