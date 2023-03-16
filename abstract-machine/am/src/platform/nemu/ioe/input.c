#include <am.h>
#include <nemu.h>
#include <stdio.h>

#define KEYDOWN_MASK 0x8000

void __am_input_keybrd(AM_INPUT_KEYBRD_T *kbd) {
  int scan_code = inl(KBD_ADDR);
  printf("Gotaaa key :%d\n", scan_code);

  kbd->keydown = scan_code & KEYDOWN_MASK;
  if(!kbd->keydown)
      kbd->keycode = scan_code;
}
