#include <am.h>
#include <klib.h>
#include <klib-macros.h>
#include <stdarg.h>

#if !defined(__ISA_NATIVE__) || defined(__NATIVE_USE_KLIB__)

static void itoa(int x, char str[]);

int printf(const char* format, ...)
{
    va_list args;
    va_start(args, format);

    int count = 0;

    while (*format != '\0')
    {
        if (*format == '%')
        {
            format++;

            if (*format == '\0')
                break;

            if (*format == '%')
            {
                putch('%');
                count++;
            }
            else if (*format == 'x')
            {
                unsigned int value = va_arg(args, unsigned int);
                char buffer[9];
                int i = 0;

                do
                {
                    buffer[i++] = "0123456789abcdef"[value % 16];
                    value /= 16;
                } while (value != 0);

                while (i > 0)
                {
                    putch(buffer[--i]);
                    count++;
                }
            }
            else if (*format == '0' && *(format + 1) == '2' && *(format + 2) == 'x')
            {
                format += 2;
                unsigned int value = va_arg(args, unsigned int);
                char buffer[3];
                int i = 0;

                do
                {
                    buffer[i++] = "0123456789abcdef"[value % 16];
                    value /= 16;
                } while (value != 0);

                while (i < 2)
                {
                    putch('0');
                    count++;
                    i++;
                }

                while (i > 0)
                {
                    putch(buffer[--i]);
                    count++;
                }
            }
        }
        else
        {
            putch(*format);
            count++;
        }

        format++;
    }

    va_end(args);

    return count;
}

// int printf(const char *fmt, ...) {
//   va_list args;
//   va_start(args, fmt);
//   int ret = 0;
//   for(int i=0;fmt[i];i++)
//   {
//       if(fmt[i] == '%')
//       {
//           i++;
//           switch(fmt[i])
//           {
//                 case 'c':
//                   char ch = va_arg(args, int);
//                   putch(ch), ret++; 
//                   break;
//                 case 's': 
//                   for(char *s = va_arg(args, char *);*s;s++) putch(*s), ret++;
//                   break;
//                 case 'd':
//                   char num[32];       //max of int is 2147483647
//                   int x = va_arg(args, int);
//                   itoa(x, num);
//                   for(int j=0;num[j];j++) putch(num[j]);
//                   break;
//                 case 'u':
//                     unsigned int n = va_arg(args, uint32_t);
//                     do{
//                         char ch = n % 10 + '0';
//                         putch(ch);
//                     } while(n /= 10);
//                   break;
//                 case '0':
//                     i++;
//                     char num2[20];
//                     memset(num2, 10, 20);
//                     for(int j=0;fmt[i] < '9' && fmt[i] >'0';i++)
//                         num2[j++] = fmt[i] - '0';
//                     if(fmt[i] == 'd')
//                     { 
//                         int zero_num = 0;
//                         for(int j=0;num2[j] != 10;j++) 
//                             zero_num = zero_num * 10 + num2[j];
//                         int x = va_arg(args, int);
//                         itoa(x, num2);
//                         int j=0;
//                         for(j=0;x;j++)  x /= 10;
//                         while(--zero_num > j) putch('0');
//                         for(j=0;num2[j];j++) putch(num2[j]);
//                     }
//                     break;
//                 default:
//                     putch(fmt[i]);
//                     while(1);
//                     panic("Unimplemented argument!");
//           }
//       }
//       else
//       {
//             putch(fmt[i]);
//       }
//   } 
//   va_end(args);
//   return ret;
// }

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
                  char num[32];       //max of int is 2147483647
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
  *p = '\0';
  
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

static void itoa(int n, char s[])
{
    int i, sign;

    if ((sign = n) < 0)  
        n = -n;          

    i = 0;
    do {
        s[i++] = n % 10 + '0';  
    } while ((n /= 10) > 0);   

    if (sign < 0)
        s[i++] = '-';

    s[i] = '\0';

    int j, temp;
    for (j = 0, i--; j < i; j++, i--) {
        temp = s[j];
        s[j] = s[i];
        s[i] = temp;
    }
}

#endif
