#include <NDL.h>
#include <assert.h>
#include <sdl-timer.h>
#include <stdio.h>

SDL_TimerID SDL_AddTimer(uint32_t interval, SDL_NewTimerCallback callback, void *param) {
  assert(0);
  return NULL;
}

int SDL_RemoveTimer(SDL_TimerID id) {
  assert(0);
  return 1;
}

uint32_t SDL_GetTicks() {
  return NDL_GetTicks();
}

void SDL_Delay(uint32_t ms) {
  uint32_t now = SDL_GetTicks(), then;
  do
  {
      then = SDL_GetTicks();
  } while (then - now <= ms);
}
