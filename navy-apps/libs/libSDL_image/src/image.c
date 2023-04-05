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
  int fd = open(filename, 0, 0);
  printf("IMG_LOAD\n");
  uint32_t size = lseek(fd, 0, SEEK_END);
  char *img_buf = (char *)malloc(size);
  lseek(fd, 0, SEEK_SET);
  read(fd, img_buf, size);
  SDL_Surface *s = STBIMG_LoadFromMemory(img_buf, size);
  assert(s);
  close(fd);
  free(img_buf);
  assert(0);
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
