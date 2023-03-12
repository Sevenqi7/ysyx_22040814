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

#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <assert.h>
#include <string.h>

// this should be enough
static char buf[65536] = {};
static char code_buf[65536 + 128] = {}; // a little larger than `buf`
static char *code_format =
"#include <stdio.h>\n"
"int main() { "
"  unsigned result = %s; "
"  printf(\"%%u\", result); "
"  return 0; "
"}";

static int pos;

static unsigned int choose(unsigned int a)
{
    return (unsigned int) rand() % a;
}

static void gen(char c)
{
    buf[pos++] = c;
}


static void gen_space(int times)
{
    for(int i=0;i<times;i++)
        gen(' ');
}

static void gen_num(void)
{
    gen_space(rand() % 4);
    gen('0' + choose(10));
    gen_space(rand() % 4);
}

static void gen_rand_op(void)
{
    gen_space(rand() % 4);
    switch(choose(4))
    {
        case 0:
            gen('+');break;
        case 1:
            gen('-');break;
        case 2:
            gen('*');break;
        default:
            gen('/');break;
    }
    gen_space(rand() % 4);
}

static void gen_rand_expr() {
    if(pos > 60000)
        return;
    switch (rand() % 3) {
    case 0: gen_num(); break;
    case 1: gen('('); gen_rand_expr(); gen(')'); break;
    default: gen_rand_expr(); gen_rand_op(); gen_rand_expr(); break;
  }
    // buf[pos++] = '\0';
}

int main(int argc, char *argv[]) {
  int seed = time(0);
  srand(seed);
  int loop = 1;
  if (argc > 1) {
    sscanf(argv[1], "%d", &loop);
  }
  int i;
  for (i = 0; i < loop; i ++) {
    pos = 0;
    gen_rand_expr();
    buf[pos++] = '\0';
    // printf("pos=%d\n", pos);
    // printf("%s\n", buf);

    sprintf(code_buf, code_format, buf);

    FILE *fp = fopen("/tmp/.code.c", "w");
    assert(fp != NULL);
    fputs(code_buf, fp);
    fclose(fp);

    int ret = system("gcc /tmp/.code.c -o /tmp/.expr");
    if (ret != 0) continue;

    fp = popen("/tmp/.expr", "r");
    assert(fp != NULL);
    int result;
    int a = fscanf(fp, "%d", &result);
    a = 0;
    if(!a)
      pclose(fp);

    printf("%u %s\n", result, buf);
  }
  return 0;
}
