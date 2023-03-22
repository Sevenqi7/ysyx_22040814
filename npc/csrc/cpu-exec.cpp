#include <verilator.h>
#include <npc.h>
#include <string.h>

#define MAX_INST_TO_PRINT 10
#define MAX_ITRACE_STORE 10

uint64_t g_print_step;

uint64_t pmem_read(uint64_t addr, int len);

char g_itrace_buf[MAX_ITRACE_STORE][128];
static uint32_t g_itrace_base = 0;
static uint32_t g_itrace_end = 0;
#ifdef CONFIG_ITRACE
static uint32_t g_itrace_num = 0;
#endif


static void trace_and_difftest(char *logbuf, uint64_t *inst)
{
    if(g_print_step){puts(logbuf);}
#ifdef CONFIG_FTRACE
    
#endif
#ifdef CONFIG_WATCHPOINT
    if(check_watchpoints())
        npc_state = NPC_STOP;
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

void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);

void exec_once()
{
    uint64_t current_inst = pmem_read(top->io_IF_pc, 4);
    uint64_t current_pc   = top->io_IF_pc;
    for(int i=0;i<2;i++)
    {
        contextp->timeInc(1); // 1 timeprecision period passes...
        top->clock = !top->clock;
        if(!top->reset)
            top->io_inst = pmem_read(top->io_IF_pc, 4);
        if(!top->io_inst)
        {
            printf("\n\033[0m\033[1;31m%s 0x%lx\033[0m\n", "All 0 inst found in addr: ", top->io_IF_pc);
            exit(-1) ;
        }    

        if(top->clock)
            Log("time=%ld clk=%x rst=%x inst=0x%x IF_pc=0x%lx", contextp->time(), top->clock, top->reset, top->io_inst, top->io_IF_pc);
        top->eval();
    }
    char logbuf[128];
    #ifdef CONFIG_ITRACE
    char *p = logbuf;
    p += snprintf(p, sizeof(logbuf), "0x%016lx" ":", current_pc);
    uint8_t *inst = (uint8_t *)&current_inst;
    for(int i=3;i>=0;i--)
        p += snprintf(p, 4, "%02x", inst[i]);
    Log("logbuf:%s", logbuf);
    *p++ = ' ';
    disassemble(p, logbuf + sizeof(logbuf) - p, current_pc, inst, 4);        //riscv64所有指令都是32位长
    memcpy(g_itrace_buf[g_itrace_end], logbuf, strlen(logbuf)+1);
    if(g_itrace_num < MAX_ITRACE_STORE) g_itrace_num++;
    else  g_itrace_base = g_itrace_base < MAX_ITRACE_STORE - 1 ? g_itrace_base+1 : 0;
    g_itrace_end = g_itrace_end < MAX_ITRACE_STORE - 1 ? g_itrace_end+1 : 0;
    #endif
    puts(p);
    trace_and_difftest(logbuf, (uint64_t *)inst);
}

void execute(uint64_t n)
{
    g_print_step = (n < MAX_INST_TO_PRINT);
    switch(npc_state)
    {
        case NPC_END: case NPC_ABORT:
        printf("Simulation has ended.\n");
        return ;
        default: npc_state = NPC_RUNNING;
    }

    for(int i=0;i<n;i++)
    {
        exec_once();
        if(npc_state != NPC_RUNNING) break;
    }

    if(npc_state == NPC_ABORT)
        display_itrace();
}