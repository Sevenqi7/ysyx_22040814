#define SDL_malloc malloc
#define SDL_free free
#define SDL_realloc realloc

#define SDL_STBIMAGE_IMPLEMENTATION
#include "SDL_stbimage.h"
#include <unistd.h>
#include <fcntl.h>

SDL_Surface *IMG_Load_RW(SDL_RWops *src, int freesrc)
{
  assert(src->type == RW_TYPE_MEM);
  assert(freesrc == 0);
  return NULL;
}

SDL_Surface *IMG_Load(const char *filename)
{
  static SDL_Surface *s;
  int fd = open(filename, 0, 0);
  uint32_t size = lseek(fd, 0, SEEK_END);
  char *img_buf = (char *)malloc(size);
  assert(img_buf);
  s = STBIMG_LoadFromMemory(img_buf, size);
  assert(s);
  close(fd);
  free(img_buf);
  return s;
}

int IMG_isPNG(SDL_RWops *src)
{
  return 0;
}

SDL_Surface *IMG_LoadJPG_RW(SDL_RWops *src)
{
  return IMG_Load_RW(src, 0);
}

char *IMG_GetError()
{
  return "Navy does not support IMG_GetError()";
}
