#ifndef __NPC_H
#define __NPC_H

#include <macro.h>
#include <autoconf.h>

#include <stdio.h>
#include <stdint.h>

//从nemu里抄来的Log
#define _Log(...) \
  do { \
    printf(__VA_ARGS__); \
  } while (0)


#define Log(format, ...) \
    _Log(ANSI_FMT("[%s:%d %s] " format, ANSI_FG_BLUE) "\n", \
        __FILE__, __LINE__, __func__, ## __VA_ARGS__)

#define _panic(...) \
  do { \
    printf(__VA_ARGS__); \
    exit(-1);    \
  } while (0)


#define panic(format, ...) \
    _panic(ANSI_FMT("[%s:%d %s] PANIC! " format, ANSI_FG_RED) "\n", \
        __FILE__, __LINE__, __func__, ## __VA_ARGS__)


extern uint64_t *cpu_gpr;
extern void reg_display();
extern uint64_t reg_str2val(const char *s, bool *success);

//仿照NEMU的一个状态。NPC里可以直接接收ebreak指令，所以只需要一个状态位就够了。
enum { NPC_RUNNING, NPC_STOP, NPC_END, NPC_ABORT, NPC_QUIT };
extern uint32_t npc_state;

//表达式求值
extern uint64_t expr(char *e, bool *success);

//监视点
extern int add_watchpoint(char *expr_);
extern bool del_watchpoint(int NO);
extern bool check_watchpoints();
extern void display_watchpoints();


//用C++实现的仿真用的存储器
extern uint64_t *pmem_addr(uint64_t *addr);
extern uint64_t  pmem_read(uint64_t addr, int len);

#endif