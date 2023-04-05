#include <NDL.h>
#include <SDL.h>
#include <string.h>

#define keyname(k) #k,

static const char *keyname[] = {
  "NONE",
  _KEYS(keyname)
};

int SDL_PushEvent(SDL_Event *ev) {
  return 0;
}

int SDL_PollEvent(SDL_Event *ev) {
}

int SDL_WaitEvent(SDL_Event *event) {
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
                break;
              }
          }
          assert(i != sizeof(keyname) / sizeof(char *));
          break;
    default: printf("unsupported event type!\n"); assert(0);
  }
  return 1;
}

int SDL_PeepEvents(SDL_Event *ev, int numevents, int action, uint32_t mask) {
  return 0;
}

uint8_t* SDL_GetKeyState(int *numkeys) {
  return NULL;
}
