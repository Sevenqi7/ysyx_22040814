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

#include "sdb.h"

#define NR_WP 32

typedef struct watchpoint {
  int NO;
  struct watchpoint *next;
  char expr[1024];
  word_t val;
  int status;
  /* TODO: Add more members if necessary */

} WP;

enum WP_STATUS{
    WP_FREE, WP_BUSY
};

static WP wp_pool[NR_WP] = {};
static WP *head = NULL, *free_ = NULL;

WP* new_wp();
void free_wp(WP *wp);

void init_wp_pool() {
  int i;
  for (i = 0; i < NR_WP; i ++) {
    wp_pool[i].NO = i;
    wp_pool[i].next = (i == NR_WP - 1 ? NULL : &wp_pool[i + 1]);
    wp_pool[i].status = WP_FREE;
  }

  head = NULL;
  free_ = wp_pool;
}

/* TODO: Implement the functionality of watchpoint */

WP* new_wp()
{
    WP *p = free_, *q = p;
    while(p->status == WP_BUSY && p)
    {
        q = p;
        p = p->next;
    }
    if(!p) assert(0);
    q->next = p->next;
    p->next = NULL;
    if(!head)
        head = p;
    else
    {
        q = head;
        while(q->next) q = q->next;
        q->next = p;
    }
    
    return p;
}

void free_wp(WP *wp)
{
    WP *p = head, *q = p;
    while(p != wp && p)
    {
        q = p;
        p = p->next;
    }
    assert(p);
    q->next = p->next;
    p->next = NULL;
    if(free_)
        free_ = p;
    else
    {
        q = free_;
        while(q->next) q = q->next;
        q->next = p;
    }
}

int add_watchpoint(char *expr_)
{
    WP *p = new_wp();
    Log("newwp");
    memcpy(p->expr, expr_, strlen(expr_)+1);
    p->status = WP_BUSY;
    bool s;
    p->val = expr(expr_, &s);
    Log("success:%d", s);
    return p->NO;
}

bool del_watchpoint(int NO)
{
    WP *p = head;
    if(p) return false;
    for(;p;p=p->next)
    {
        if(p->NO == NO)
        {
            p->status = WP_FREE;
            free_wp(p);
            return true;
        }
    }
    return false;
}

bool check_watchpoints()
{
    WP *p = head;
    bool flag = false;
    if(!p) return false;
    for(;p;p=p->next)
    {
        bool success = false;
        word_t new_val = expr(p->expr, &success);
        if(success && new_val != p->val)
        {
            printf("Watchpoint %d: %s\n", p->NO, p->expr);
            printf("Old Value is :%lu\n", p->val);
            p->val = new_val;
            printf("New Value is :%lu\n", new_val);
            flag = true;
        }
    }
    return flag;
}