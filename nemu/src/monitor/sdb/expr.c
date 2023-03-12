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

#include <isa.h>

/* We use the POSIX regex functions to process regular expressions.
 * Type 'man regex' for more information about POSIX regex functions.
 */
#include <stdbool.h>
#include <regex.h>

enum {
  TK_NOTYPE = 256, TK_EQ,
  TK_NUM, TK_LOGIC_OR, TK_LOGIC_AND, 
  TK_REGISTER, TK_UNEQ
  /* TODO: Add more token types */

};

static struct rule {
  const char *regex;
  int token_type;
} rules[] = {

  /* TODO: Add more rules.
   * Pay attention to the precedence level of different rules.
   */

  {" +", TK_NOTYPE},    // spaces
  {"\\+", '+'},         // plus
  {"-", '-'},           // sub
  {"\\*", '*'},         // multiply
  {"\\/", '/'},         // divide
  {"\\(", '('},
  {"\\)", ')'},
  {"&&", TK_LOGIC_AND}, // logical and
  {"\\|\\|", TK_LOGIC_OR},  //logical or
  {"!=", TK_UNEQ},      // unequal
  {"==", TK_EQ},        // equal
  {"\\$0|\\$t[0-6p]|\\$a[0-7]|\\$s[0-9]+|\\$gp|\\$ra|\\$sp", TK_REGISTER},
  {"[0-9]+", TK_NUM}
  // {"\\\$[a-dA- D][hlHL]|\\\$[eE]?(ax|dx|cx|bx|bp|si|di|sp)",TK_REGISTER}
};

#define NR_REGEX ARRLEN(rules)

static regex_t re[NR_REGEX] = {};

/* Rules are used for many times.
 * Therefore we compile them only once before any usage.
 */
void init_regex() {
  int i;
  char error_msg[128];
  int ret;

  for (i = 0; i < NR_REGEX; i ++) {
    ret = regcomp(&re[i], rules[i].regex, REG_EXTENDED);
    if (ret != 0) {
      regerror(ret, &re[i], error_msg, 128);
      panic("regex compilation failed: %s\n%s", error_msg, rules[i].regex);
    }
  }
}

typedef struct token {
  int type;
  char str[32];
} Token;

static Token tokens[128] __attribute__((used)) = {};
static int nr_token __attribute__((used))  = 0;

static bool make_token(char *e) {
  int position = 0;
  int i;
  regmatch_t pmatch;

  nr_token = 0;
  Log("string:%s", e);
  while (e[position] != '\0') {
    /* Try all rules one by one. */
    for (i = 0; i < NR_REGEX; i ++) {
      if (regexec(&re[i], e + position, 1, &pmatch, 0) == 0 && pmatch.rm_so == 0) {
        char *substr_start = e + position;
        int substr_len = pmatch.rm_eo;

        Log("match rules[%d] = \"%s\" at position %d with len %d: %.*s",
            i, rules[i].regex, position, substr_len, substr_len, substr_start);

        if(substr_len > sizeof(tokens->str))
        {
            printf("Numeric constant too large.\n");
            return true;
        }

        /* TODO: Now a new token is recognized with rules[i]. Add codes
         * to record the token in the array `tokens'. For certain types
         * of tokens, some extra actions should be performed.
         */

        switch (rules[i].token_type) {
          // default: TODO();
          case(TK_NUM):
          case(TK_REGISTER):
              memcpy(tokens[nr_token].str, &e[position], substr_len);
              tokens[nr_token].str[substr_len] = '\0';
          default: 
              tokens[nr_token++].type = rules[i].token_type;
        }

        position += substr_len;
        break;
      }
    }

    if (i == NR_REGEX) {
      printf("no match at position %d\n%s\n%*.s^\n", position, e, position, "");
      return false;
    }
  }

  return true;
}

bool check_parentheses(int p, int q)
{
    bool flag = false;
    if(p < q && tokens[p].type == '(')
    {
        int pair = 0;
        for(int i=p+1;i<=q;i++)
        {
            if(tokens[i].type == '(')
                pair++;
            else if(tokens[i].type == ')')
                pair--;
        }
        if(pair == 0 && tokens[q].type == ')')
            flag = true;
    }
    
    return flag;
}

long eval(int p, int q)
{ 
    Log("p: %d q: %d", p, q);
    while(tokens[p].type == TK_NOTYPE)
        p++;
    while(tokens[q].type == TK_NOTYPE)
        q--;

    if(p > q)
        return -1;
    else if(p == q)
    {
        // int start = 0;
        // while(tokens[p].str[start] == ' ')
        //     start++;
        if(tokens[p].type == TK_NUM)
            return atoi(tokens[p].str);
        else
            panic("An nonnumeric single token!\n");
    }
    else if(check_parentheses(p, q))
        return eval(p+1, q-1);
    else
    {
        //op: the location of the main operation
        //op2: the location of a '*' or '/' operation. when there is not '+' or '-', op2 will be main operation
        int op = -1, pari = 0, op2 = -1;
        
        bool flag = false;
        // Search for a '+' or '-' as the main operation
        for(int i=q;i>p && !flag;i--)
        {
            if(tokens[i].type == ')')
                pari++;
            else if(tokens[i].type == '(')
                pari--;
            if(pari == 0)
            {
                switch(tokens[i].type)
                {
                    case '+':
                    case '-':
                        op = i;
                        flag = true;
                        break;
                    case '*':
                    case '/':
                        op2 = i;
                    default:
                        break;
                }
            }
        }
        // if not found, search for a '*' or '/' as main operation
        if(!flag && op2 != -1)
        {
            flag = true;
            op = op2;
        }
        Log("op=%d", op);
        if(flag != true)
        {
            for(int i=p;i<=q;i++)
            {
                if(tokens[i].type == TK_NUM)
                    Log("Token[i]: %d", atoi(tokens[i].str));
                else
                    Log("Token[i]: %c", tokens[i].type);
            }
            assert(flag == true);
        }
        //skip all space
        int not_space = op-1, not_space2 = op+1;
        while(tokens[not_space].type == TK_NOTYPE)
            not_space--;
        while(tokens[not_space2].type == TK_NOTYPE)
            not_space2++;
        Log("1: %d, 2:%d", not_space, not_space2);
        long val1 = eval(p, not_space);
        long val2 = eval(not_space2, q);
        // Log("val1:%lu val2:%lu op_type: %c", val1, val2, (char)tokens[op].type);
        switch(tokens[op].type)
        {
            case '+': return val1 + val2;
            case '-': return val1 - val2;
            case '*': return val1 * val2;
            case '/': return val1 / val2;
            default : assert(0);
        }
    }
}

word_t expr(char *e, bool *success) {
  if (!make_token(e)) {
    *success = false;
    return 0;
  }
  assert(nr_token > 0);
  /* TODO: Insert codes to evaluate the expression. */
  return (word_t)eval(0, nr_token-1);

  // return 0;
}
