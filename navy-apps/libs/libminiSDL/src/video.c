#include <NDL.h>
#include <sdl-video.h>
#include <assert.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

void SDL_BlitSurface(SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect) {
  assert(dst && src);
  assert(dst->format->BitsPerPixel == src->format->BitsPerPixel);
  uint32_t dst_x = dstrect ? dstrect->x : 0, dst_y = dstrect ? dstrect->y : 0;
  uint32_t src_x = srcrect ? srcrect->x : 0, src_y = srcrect ? srcrect->y : 0;
  uint32_t src_w = srcrect ? srcrect->w :src->w, src_h = srcrect ? srcrect->h : src->h;
  if(!src->format->palette){
      for(int i=0;i<src_h && i+dst_y<dst->h;i++)
      {
        uint32_t *psrc = (uint32_t *)src->pixels + (src_y + i) * src->w + src_x;
        uint32_t *pdst = (uint32_t *)dst->pixels + (dst_y + i) * dst->w + dst_x;
        for(int j=dst_x;j<dst->w && j<(dst_x + src_w);j++) *pdst++ = *psrc++;
      }
  }
  else
  { 
      for(int i=0;i<src_h && i+dst_y<dst->h;i++)
      {
          uint8_t *psrc = src->pixels + (src_y + i) * src->w + src_x;
          uint8_t *pdst = dst->pixels + (dst_y + i) * dst->w + dst_x;
          for(int j=dst_x;j<dst->w && j<(dst_x + src_w);j++) *pdst++ = *psrc++;
      }
  }
}

void SDL_FillRect(SDL_Surface *dst, SDL_Rect *dstrect, uint32_t color) {
  assert(dst);
  if(!dst->format->palette)
  {
      if(!dstrect)
          for(int i=0;i<dst->w * dst->h;i++) ((uint32_t *)dst->pixels)[i] = color;
      else
      {
        uint32_t *p = (uint32_t *)dst->pixels + (dstrect->y * dst->w) + dstrect->x;
        for(int i=dstrect->y;i<dstrect->y+dstrect->h;i++)
        {
          for(int j=0;j<dstrect->w;j++) p[j] = color;
          p += dst->w;
        }
      }
  }
  else
  {
      SDL_Color *palette = dst->format->palette->colors;
      if(!dstrect)
          for(int i=0;i<dst->w * dst->h;i++) palette[dst->pixels[i]].val = color << 8;
      else
      {
        uint8_t *p = (uint8_t *)dst->pixels + (dstrect->y * dst->w) + dstrect->x;
        for(int i=dstrect->y;i<dstrect->y+dstrect->h;i++)
        {
          for(int j=0;j<dstrect->w;j++) palette[p[j]].val = color << 8;
          p +=  dst->w;
        }
      }
  }
}

static inline uint32_t translate_color(SDL_Color *color){
  return (color->a << 24) | (color->r << 16) | (color->g << 8) | color->b;
}

//NOTE:写的有点臃肿， 懒得管了
void SDL_UpdateRect(SDL_Surface *s, int x, int y, int w, int h) {
  if(!s->format->palette){  
      if(!x && !y && !w && !h)
          NDL_DrawRect((uint32_t *)s->pixels, 0, 0, s->w, s->h);
      else{
          printf("untest code 1\n");
          NDL_DrawRect((uint32_t *)s->pixels + y * s->w + x, x, y, w, h);
      }
      return ;
  }
  SDL_Color *palette = s->format->palette->colors;
  uint32_t *pixels;
  if(!x && !y && !w && !h)
  {
    pixels = (uint32_t *)malloc(s->w * s->h * sizeof(uint32_t));
    for(int i=0;i<s->h;i++){
      for(int j=0;j<s->w;j++)
        pixels[i*s->w + j] = translate_color(&palette[s->pixels[i * s->w + j]]);
    }
    NDL_DrawRect(pixels, 0, 0, s->w, s->h);
  }
  else{
    pixels = (uint32_t *)malloc(w * h * sizeof(uint32_t));
    for(int i=0;i<h;i++){
      for(int j=0;j<w;j++)
        pixels[i*w + j] = translate_color(&palette[s->pixels[(y+i)*s->w + x + j]]);
    }
    NDL_DrawRect(pixels, x, y, w, h);
  }
  if(pixels) free(pixels);
}

// APIs below are already implemented.

static inline int maskToShift(uint32_t mask) {
  switch (mask) {
    case 0x000000ff: return 0;
    case 0x0000ff00: return 8;
    case 0x00ff0000: return 16;
    case 0xff000000: return 24;
    case 0x00000000: return 24; // hack
    default: assert(0);
  }
}

SDL_Surface* SDL_CreateRGBSurface(uint32_t flags, int width, int height, int depth,
    uint32_t Rmask, uint32_t Gmask, uint32_t Bmask, uint32_t Amask) {
  assert(depth == 8 || depth == 32);
  SDL_Surface *s = malloc(sizeof(SDL_Surface));
  assert(s);
  s->flags = flags;
  s->format = malloc(sizeof(SDL_PixelFormat));
  assert(s->format);
  if (depth == 8) {
    s->format->palette = malloc(sizeof(SDL_Palette));
    assert(s->format->palette);
    s->format->palette->colors = malloc(sizeof(SDL_Color) * 256);
    assert(s->format->palette->colors);
    memset(s->format->palette->colors, 0, sizeof(SDL_Color) * 256);
    s->format->palette->ncolors = 256;
  } else {
    s->format->palette = NULL;
    s->format->Rmask = Rmask; s->format->Rshift = maskToShift(Rmask); s->format->Rloss = 0;
    s->format->Gmask = Gmask; s->format->Gshift = maskToShift(Gmask); s->format->Gloss = 0;
    s->format->Bmask = Bmask; s->format->Bshift = maskToShift(Bmask); s->format->Bloss = 0;
    s->format->Amask = Amask; s->format->Ashift = maskToShift(Amask); s->format->Aloss = 0;
  }

  s->format->BitsPerPixel = depth;
  s->format->BytesPerPixel = depth / 8;

  s->w = width;
  s->h = height;
  s->pitch = width * depth / 8;
  assert(s->pitch == width * s->format->BytesPerPixel);

  if (!(flags & SDL_PREALLOC)) {
    s->pixels = malloc(s->pitch * height);
    assert(s->pixels);
  }

  return s;
}

SDL_Surface* SDL_CreateRGBSurfaceFrom(void *pixels, int width, int height, int depth,
    int pitch, uint32_t Rmask, uint32_t Gmask, uint32_t Bmask, uint32_t Amask) {
  SDL_Surface *s = SDL_CreateRGBSurface(SDL_PREALLOC, width, height, depth,
      Rmask, Gmask, Bmask, Amask);
  assert(pitch == s->pitch);
  s->pixels = pixels;
  return s;
}

void SDL_FreeSurface(SDL_Surface *s) {
  if (s != NULL) {
    if (s->format != NULL) {
      if (s->format->palette != NULL) {
        if (s->format->palette->colors != NULL) free(s->format->palette->colors);
        free(s->format->palette);
      }
      free(s->format);
    }
    if (s->pixels != NULL && !(s->flags & SDL_PREALLOC)) free(s->pixels);
    free(s);
  }
}

SDL_Surface* SDL_SetVideoMode(int width, int height, int bpp, uint32_t flags) {
  if (flags & SDL_HWSURFACE) NDL_OpenCanvas(&width, &height);
  return SDL_CreateRGBSurface(flags, width, height, bpp,
      DEFAULT_RMASK, DEFAULT_GMASK, DEFAULT_BMASK, DEFAULT_AMASK);
}

void SDL_SoftStretch(SDL_Surface *src, SDL_Rect *srcrect, SDL_Surface *dst, SDL_Rect *dstrect) {
  assert(src && dst);
  assert(dst->format->BitsPerPixel == src->format->BitsPerPixel);
  assert(dst->format->BitsPerPixel == 8);

  int x = (srcrect == NULL ? 0 : srcrect->x);
  int y = (srcrect == NULL ? 0 : srcrect->y);
  int w = (srcrect == NULL ? src->w : srcrect->w);
  int h = (srcrect == NULL ? src->h : srcrect->h);

  assert(dstrect);
  if(w == dstrect->w && h == dstrect->h) {
    /* The source rectangle and the destination rectangle
     * are of the same size. If that is the case, there
     * is no need to stretch, just copy. */
    SDL_Rect rect;
    rect.x = x;
    rect.y = y;
    rect.w = w;
    rect.h = h;
    SDL_BlitSurface(src, &rect, dst, dstrect);
  }
  else {
    assert(0);
  }
}

void SDL_SetPalette(SDL_Surface *s, int flags, SDL_Color *colors, int firstcolor, int ncolors) {
  assert(s);
  assert(s->format);
  assert(s->format->palette);
  assert(firstcolor == 0);

  s->format->palette->ncolors = ncolors;
  memcpy(s->format->palette->colors, colors, sizeof(SDL_Color) * ncolors);

  if(s->flags & SDL_HWSURFACE) {
    assert(ncolors == 256);
    for (int i = 0; i < ncolors; i ++) {
      uint8_t r = colors[i].r;
      uint8_t g = colors[i].g;
      uint8_t b = colors[i].b;
    }
    SDL_UpdateRect(s, 0, 0, 0, 0);
  }
}

static void ConvertPixelsARGB_ABGR(void *dst, void *src, int len) {
  int i;
  uint8_t (*pdst)[4] = dst;
  uint8_t (*psrc)[4] = src;
  union {
    uint8_t val8[4];
    uint32_t val32;
  } tmp;
  int first = len & ~0xf;
  for (i = 0; i < first; i += 16) {
#define macro(i) \
    tmp.val32 = *((uint32_t *)psrc[i]); \
    *((uint32_t *)pdst[i]) = tmp.val32; \
    pdst[i][0] = tmp.val8[2]; \
    pdst[i][2] = tmp.val8[0];

    macro(i + 0); macro(i + 1); macro(i + 2); macro(i + 3);
    macro(i + 4); macro(i + 5); macro(i + 6); macro(i + 7);
    macro(i + 8); macro(i + 9); macro(i +10); macro(i +11);
    macro(i +12); macro(i +13); macro(i +14); macro(i +15);
  }

  for (; i < len; i ++) {
    macro(i);
  }
}

SDL_Surface *SDL_ConvertSurface(SDL_Surface *src, SDL_PixelFormat *fmt, uint32_t flags) {
  assert(src->format->BitsPerPixel == 32);
  assert(src->w * src->format->BytesPerPixel == src->pitch);
  assert(src->format->BitsPerPixel == fmt->BitsPerPixel);

  SDL_Surface* ret = SDL_CreateRGBSurface(flags, src->w, src->h, fmt->BitsPerPixel,
    fmt->Rmask, fmt->Gmask, fmt->Bmask, fmt->Amask);

  assert(fmt->Gmask == src->format->Gmask);
  assert(fmt->Amask == 0 || src->format->Amask == 0 || (fmt->Amask == src->format->Amask));
  ConvertPixelsARGB_ABGR(ret->pixels, src->pixels, src->w * src->h);

  return ret;
}

uint32_t SDL_MapRGBA(SDL_PixelFormat *fmt, uint8_t r, uint8_t g, uint8_t b, uint8_t a) {
  assert(fmt->BytesPerPixel == 4);
  uint32_t p = (r << fmt->Rshift) | (g << fmt->Gshift) | (b << fmt->Bshift);
  if (fmt->Amask) p |= (a << fmt->Ashift);
  return p;
}

int SDL_LockSurface(SDL_Surface *s) {
  return 0;
}

void SDL_UnlockSurface(SDL_Surface *s) {
}
