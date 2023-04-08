#include <NDL.h>
#include <SDL.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>

#define keyname(k) #k,
#define NR_KEY (SDLK_PAGEDOWN + 1)

static const char *keyname[] = {
  "NONE",
  _KEYS(keyname)
};

static uint8_t keystate [NR_KEY];

int SDL_PushEvent(SDL_Event *ev) {
  assert(0);
  return 0;
}

int SDL_PollEvent(SDL_Event *ev) {
  // printf("Poll\n");
  char event_buf[32];
  if(!NDL_PollEvent(event_buf, 32))
      {
        // printf("Poll end\n");
        return 0;}
  if(!strncmp("kd", event_buf, 2))
      ev->type = SDL_KEYDOWN;
  else if(!strncmp("ku", event_buf, 2))
      ev->type = SDL_KEYUP;   
  switch(ev->type)
  {
    case SDL_KEYDOWN: 
    case SDL_KEYUP  :
          ev->key.type = ev->type;
          int i;
          for(i=0;i<sizeof(keyname)/sizeof(char *);i++){
              if(!strcmp(&event_buf[3], keyname[i]))
              {
                ev->key.keysym.sym = i;
                keystate[i] = ev->type;
                break;
              }
          }
          assert(i != sizeof(keyname) / sizeof(char *));
          break;
    default: printf("unsupported event type!\n"); assert(0);
  }
  // printf("Poll end\n");
  return 1;
}

int SDL_WaitEvent(SDL_Event *event) {
  printf("wait\n");
  char event_buf[32];
  while(1)
  {
    if(NDL_PollEvent(event_buf, 32))
    {
      if(!strncmp("kd", event_buf, 2))
          event->type = SDL_KEYDOWN;
      else if(!strncmp("ku", event_buf, 2))
          event->type = SDL_KEYUP;
      break;
    }
  }
  switch(event->type)
  {
    case SDL_KEYDOWN: 
    case SDL_KEYUP  :
          event->key.type = event->type;
          int i;
          for(i=0;i<sizeof(keyname)/sizeof(char *);i++){
              if(!strcmp(&event_buf[3], keyname[i]))
              {
                event->key.keysym.sym = i;
                keystate[i] = event->type;
                break;
              }
          }
          assert(i != sizeof(keyname) / sizeof(char *));
          break;
    default: printf("unsupported event type!\n"); assert(0);
  }
  printf("wait end\n");
  return 1;
}

int SDL_PeepEvents(SDL_Event *ev, int numevents, int action, uint32_t mask) {
  assert(0);
  return 0;
}

uint8_t* SDL_GetKeyState(int *numkeys) {
  return keystate;
}
