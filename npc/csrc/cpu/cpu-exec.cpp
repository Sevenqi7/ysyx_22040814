#include <verilator.h>
#include <npc.h>
#include <memory.h>
#include <string.h>

#define MAX_INST_TO_PRINT 10
#define MAX_ITRACE_STORE 10



char g_itrace_buf[MAX_ITRACE_STORE][128];
static bool  g_print_step;
static uint32_t g_itrace_base = 0;
static uint32_t g_itrace_end = 0;
#ifdef CONFIG_ITRACE
static uint32_t g_itrace_num = 0;
#endif

extern bool inst_fault;

void device_update();
void difftest_regcpy(void *dut, bool direction);

static void trace_and_difftest(char *logbuf)
{
    uint64_t cpyreg[32];
    if(g_print_step){puts(logbuf);}
#ifdef CONFIG_FTRACE
    void ftrace_check_jal(uint64_t jump_addr, uint64_t ret_addr, int rs1, int rd);
    int rd = BITS(npc_state.inst, 11, 7), rs1 = BITS(npc_state.inst, 19, 15);
    ftrace_check_jal(top->io_WB_pc, npc_state.pc + 4, rs1, rd);
#endif
#ifdef CONFIG_WATCHPOINT
    if(check_watchpoints())
        npc_state.state = NPC_STOP;
#endif
#ifdef CONFIG_DIFFTEST
    void difftest_step(vaddr_t pc);
    difftest_step(top->io_WB_pc);
#endif
}

void display_itrace()
{
    printf("\nItrace Info : q\n\n");
    char printbuf[150];
    memset(printbuf, ' ', 150);
    int i = g_itrace_base;
    do{
      memcpy(&printbuf[10], g_itrace_buf[i], strlen(g_itrace_buf[i])+1);
      i = i < MAX_ITRACE_STORE - 1 ? i + 1 : 0;
      if(i == g_itrace_end) memcpy(printbuf, "-->", 3);
      printf("%s\n", printbuf);
    }while(i != g_itrace_end);
    printf("\nItrace Info End\n");
}

uint8_t stall_flag ;

void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);

void exec_once()            //disassemble实质上是反汇编的上一个已执行完的指令（正要执行的指令还在等待上升沿）
{
    // npc_state.inst = pmem_read(top->io_WB_pc, 4);       //record the pc value and inst that excuted last time
    npc_state.inst = top->io_WB_Inst;
    npc_state.pc   = top->io_WB_pc;                   
    if(stall_flag && inst_fault)
    {
        inst_fault = 0;
        clock_step();
    }
    if(inst_fault)                           //if an unimplemented inst found, directly record inst trace without excuting next inst
    {                                                       
        npc_state.state = NPC_ABORT;
        uint32_t abort_inst = pmem_read(top->io_IF_pc, 4);
        printf("\033[0m\033[1;31m%s\033[0m\n", "UNKNOWN INST RECEIVED in IDU:");
        printf("\033[0m\033[1;31mPC:0x%016lx inst:0x%08x\033[0m\n", top->io_IF_pc, abort_inst);
    }
    clock_step();
    
    if(top->io_stall)
    {    top->io_stall++;
        Log("stall deteceted");
    }
trace:
    char logbuf[128];
    #ifdef CONFIG_ITRACE
    char *p = logbuf;
    p += snprintf(p, sizeof(logbuf), "0x%016lx" ":", npc_state.pc);
    uint8_t *inst = (uint8_t *)&npc_state.inst;
    for(int i=3;i>=0;i--)
        p += snprintf(p, 4, "%02x", inst[i]);
    // Log("logbuf:%s", logbuf);
    *p++ = ' ';
    disassemble(p, logbuf + sizeof(logbuf) - p, npc_state.pc, inst, 4);        //riscv64所有指令都是32位长
    memcpy(g_itrace_buf[g_itrace_end], logbuf, strlen(logbuf)+1);
    if(g_itrace_num < MAX_ITRACE_STORE) g_itrace_num++;
    else  g_itrace_base = g_itrace_base < MAX_ITRACE_STORE - 1 ? g_itrace_base+1 : 0;
    g_itrace_end = g_itrace_end < MAX_ITRACE_STORE - 1 ? g_itrace_end+1 : 0;
    #endif
    trace_and_difftest(logbuf);
}

void execute(uint64_t n)
{
    g_print_step = (n < MAX_INST_TO_PRINT);
    switch(npc_state.state)
    {
        case NPC_END: case NPC_ABORT:
        printf("Simulation has ended.\n");
        return ;
        default: npc_state.state = NPC_RUNNING;
    }

    for(int i=0;i<n;i++)
    {
        exec_once();
        device_update();
        if(npc_state.state != NPC_RUNNING) break;
    }

    if(npc_state.state == NPC_ABORT)
    {
        printf("\n\033[0m\033[1;31mNPC ABORT \033[0mat pc = %016lx\n", npc_state.pc);
        display_itrace();
    }
}