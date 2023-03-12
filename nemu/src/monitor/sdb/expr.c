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
#include <stdlib.h>
#include <memory/paddr.h>
#include <regex.h>


enum {
  TK_NOTYPE = 256, TK_NUM, TK_HEXNUM,TK_REGISTER, 
  TK_EQ,TK_LOGIC_OR, TK_LOGIC_AND, 
  TK_UNEQ, TK_DEREF
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
  {"0x[0-9]+|0X[0-9]", TK_HEXNUM},
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

static Token tokens[25500] __attribute__((used)) = {};
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
          case(TK_HEXNUM):
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
    
    if(p < q && tokens[p].type == '(' && tokens[q].type == ')')
    {
        int pair = 0;
        for(int i=p+1;i<q;i++)
        {
            if(tokens[i].type == '(')
                pair++;
            else if(tokens[i].type == ')')
                pair--;
            if(pair < 0 )
                return false;
            // Log("i:%d, pair: %d", i, pair);
        }
        if(pair == 0 && tokens[q].type == ')')
            flag = true;
        // Log("pair:%d", pair);
    }
    // Log("flag: %d", flag);
    return flag;
}

long eval(int p, int q)
{ 
    // Log("p: %d q: %d", p, q);
    while(tokens[p].type == TK_NOTYPE)
        p++;
    while(tokens[q].type == TK_NOTYPE)
        q--;

    if(p > q)
        return -1;
    else if(p == q)
    {
        if(tokens[p].type == TK_NUM)
        {   
            if(tokens[p-1].type == TK_DEREF)
                return paddr_read(atoi(tokens[p].str), 4);
            else
                return atoi(tokens[p].str);
        }
        else if(tokens[p].type == TK_HEXNUM)
        {
            if(tokens[p-1].type == TK_DEREF)
                return paddr_read(strtol(tokens[p].str, NULL, 16), 4);
            else
                return strtol(tokens[p].str, NULL, 16);
        }
        else if(tokens[p].type == TK_REGISTER)
        {
            bool success;
            word_t ret = isa_reg_str2val(tokens[p].str, &success);
            if(success)
                return ret;
            else
                panic("Unknown register!\n");
        }
        else
            panic("An nonnumeric single token!\n");
    }
    else if(check_parentheses(p, q))
        return eval(p+1, q-1);
    else
    {
        //op: the location of the main operation. op[0] has the highest priority
        int op[5] = {-1, -1, -1, -1, -1}, pari = 0;

        // Search for a '+' or '-' as the main operation

        for(int i=q;i>p;i--)
        {
            if(tokens[i].type == ')')
                pari++;
            else if(tokens[i].type == '(')
                pari--;
            if(pari == 0)
            {
                switch(tokens[i].type)
                {
                    case TK_LOGIC_OR:
                        if(op[0] == -1) op[0] = i;
                        break;
                    case TK_LOGIC_AND:
                        if(op[1] == -1) op[1] = i;
                        break;
                    case TK_EQ:
                    case TK_UNEQ:
                        if(op[2] == -1) op[2] = i;
                        break;
                    case '+':
                    case '-':
                        if(op[3] == -1) op[3] = i;
                        break;
                    case '*':
                    case '/':
                        if(op[4] == -1) op[4] = i;
                    default:
                        break;
                }
            }
        }
        // if not found, search for a '*' or '/' as main operation
        int op_type = -1;
        for(int i=0;i<5;i++)
        {
            if(op[i] != -1)
            {
                op_type = op[i];
                break;
            }
        }

        // Log("op=%d", op);
        assert(op_type != -1);
        
        //skip all space
        int not_space = op_type-1, not_space2 = op_type+1;
        while(tokens[not_space].type == TK_NOTYPE)
            not_space--;
        while(tokens[not_space2].type == TK_NOTYPE)
            not_space2++;
        // Log("1: %d, 2:%d", not_space, not_space2);
        long val1 = eval(p, not_space);
        long val2 = eval(not_space2, q);
        // Log("val1:%lu val2:%lu op_type: %c", val1, val2, (char)tokens[op].type);
        switch(tokens[op_type].type)
        {
            case TK_LOGIC_OR: return val1 || val2;
            case TK_LOGIC_AND: return val1 && val2;
            case TK_EQ: return val1 == val2;
            case TK_UNEQ: return val1 != val2;
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
  *success = true;
  for (int i = 0; i < nr_token; i ++) 
  { 
      int j;
      for(j=i-1;tokens[j].type != TK_NOTYPE && j >= 0;j--);
      if (tokens[i].type == '*' && (i == 0 || tokens[j].type == '(' || 
          tokens[j].type == '+' || tokens[j].type == '-' || 
          tokens[j].type == '*' || tokens[j].type == '/' ||
          tokens[j].type >= TK_EQ || tokens[j].type <= TK_UNEQ)) 
      {
          tokens[i].type = TK_DEREF;
      }
  }
  /* TODO: Insert codes to evaluate the expression. */
  return (word_t)eval(0, nr_token-1);

  // return 0;
}
