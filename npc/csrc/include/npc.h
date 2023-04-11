#ifndef __NPC_H
#define __NPC_H

#include <macro.h>
#include <autoconf.h>
#include <utils.h>

#include <stdio.h>
#include <stdint.h>
#include <assert.h>

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

enum { DIFFTEST_TO_DUT, DIFFTEST_TO_REF };


#define panic(format, ...) \
    _panic(ANSI_FMT("[%s:%d %s] PANIC! " format, ANSI_FG_RED) "\n", \
        __FILE__, __LINE__, __func__, ## __VA_ARGS__)



extern uint64_t *cpu_gpr;
extern void reg_display();
extern uint64_t reg_str2val(const char *s, bool *success);

#define PIPELINE_STAGES 5

//仿照NEMU的一个状态。NPC里可以直接接收ebreak指令，所以只需要一个状态位就够了。
typedef struct NPCState{
    uint64_t pc;
    uint64_t inst;
    uint32_t state;
}NPCState;

enum { NPC_RUNNING, NPC_STOP, NPC_END, NPC_ABORT, NPC_QUIT };
extern NPCState npc_state;

//表达式求值
extern uint64_t expr(char *e, bool *success);

//监视点
extern int add_watchpoint(char *expr_);
extern bool del_watchpoint(int NO);
extern bool check_watchpoints();
extern void display_watchpoints();


#endif