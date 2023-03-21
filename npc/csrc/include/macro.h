#ifndef __MACRO_H
#define __MACRO_H

#include <printf.h>

#define ARRLEN(arr) (int)(sizeof(arr)) / sizeof(arr[0])
#define Log(...) do{	\
						printf("\033[0m\033[1;34m[%s][%s][%d][%s]:%s,%ld\033[0m\n",	\
                        __FILE__, __FUNCTION__,__LINE__, __TIME__, ##__VA_ARGS__);	\
				 }while(0)
#define panic(...) do{	\
						printf("\033[0m\033[1;31m[%s][%s][%d][%s]:%s,%ld\033[0m\n",	\
                        __FILE__, __FUNCTION__,__LINE__, __TIME__, ##__VA_ARGS__);	\
				 }while(0)
#endif