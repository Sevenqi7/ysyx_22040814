/***************************************************************************************
* Copyright (c) 2014-2022 Zihao Yu, Nanjing University
*
* NEMU is licensed under Mulan PSL v2.
* You can use this software according to the terms and conditions of the Mulan PSL v2.
* You may obtain a copy of Mulan PSL v2 at:
*          http://license.coscl.org.cn/MulanPSL2
*
* THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
* EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
* MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
*
* See the Mulan PSL v2 for more details.
***************************************************************************************/

#include <common.h>
#include "/home/seven7/Documents/学业/一生一芯/ysyx-workbench/nemu/src/monitor/sdb/sdb.h"

#include <stdio.h>
void init_monitor(int, char *[]);
void am_init_monitor();
void engine_start();
int is_exit_status_bad();

int main(int argc, char *argv[]) {
  /* Initialize the monitor. */
#ifdef CONFIG_TARGET_AM
  am_init_monitor();
#else
  init_monitor(argc, argv);
#endif
  // FILE *fp = fopen("/home/seven7/Documents/学业/一生一芯/ysyx-workbench/nemu/tools/gen-expr/input", "r");
  
  // char str[65535];
  // int i=0;
  // bool s;
  // do{
  //     unsigned long result;
  //     assert(fscanf(fp, "%lu", &result));
  //     char* ret = fgets(str, 65534, fp);
  //     str[strlen(str)-1] = '\0';

  //     if(ret) Log("expression:%s", str);
  //     unsigned long get_result = expr(str, &s);
  //     Log("result=%lu", result);
  //     Log("get_result=%lu", get_result);
  //     assert(get_result == result);
  // }while(i++<9999);
  /* Start engine. */
  engine_start();

  return is_exit_status_bad();
}
