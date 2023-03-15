#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

static int itoa(int x, char str[]);

int printf(const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  int ret = 0;
  for(int i=0;fmt[i];i++)
  {
      if(fmt[i] == '%')
      {
          i++;
          switch(fmt[i])
          {
              case 'c':
                  char ch = va_arg(args, int);
                  putch(ch), ret++; 
                  break;
              case 's': 
                  for(char *s = va_arg(args, char *);*s;s++) putch(*s), ret++;
                  break;
              default:
                  panic("Unimplemented argument!");
          }
      }
  } 
  va_end(args);
  return ret;
}

int vsprintf(char *out, const char *fmt, va_list ap) {
  int len = 0;
  char *p = out;
  for(int i=0;fmt[i];i++)
  {
      if(fmt[i] == '%')
      {
          i++;
          switch(fmt[i])
          {
              case 's':
                  char *str = va_arg(ap, char*);
                  for(int j=0;str[j];j++) *p++ = str[j], len++;
                  break;
              case 'd':
                  char num[11];       //max of int is 2147483647
                  int x = va_arg(ap, int);
                  itoa(x, num);
                  for(int j=0;num[j];j++) *p++ = num[j], len++;
                  break;
              default:
                  panic("Unimplemented Argument in vsprintf!\n");
          }
      }
      else
      {
          *p++ = fmt[i];
          len++;
      }
  }
  
  return len;
}

int sprintf(char *out, const char *fmt, ...) {
  va_list args;
  va_start(args, fmt);
  int ret = vsprintf(out, fmt, args);
  va_end(args);
  return ret;
}

int snprintf(char *out, size_t n, const char *fmt, ...) {
  panic("Not implemented");
}

int vsnprintf(char *out, size_t n, const char *fmt, va_list ap) {
  panic("Not implemented");
}

static int itoa(int x, char str[])
{
    char *p = str;
    int sign = x;
    if(x < 0)
    {
        *p++ = '-';
        x = -x;   
    }

    do
    {
        *p++ = x % 10 + '0';
        x /= 10;
    }while(x);
    *p-- = '\0';
    char *q = str;
    if(sign == -1) q++;
    for(;q<p;q++,p--)
    {
        char temp = *p;
        *p = *q;
        *q = temp;
    }

    return strlen(str);
}

#endif
