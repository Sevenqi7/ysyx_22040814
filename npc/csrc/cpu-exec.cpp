#include <verilator.h>
#include <npc.h>

#define MAX_INST_TO_PRINT 10
#define MAX_ITRACE_STORE 10

uint64_t g_print_step;

uint64_t pmem_read(uint64_t addr, int len);

typedef struct Decode {
  vaddr_t pc;
  vaddr_t snpc; // static next pc
  vaddr_t dnpc; // dynamic next pc
  ISADecodeInfo isa;
  IFDEF(CONFIG_ITRACE, char logbuf[128]);
} Decode;

char g_itrace_buf[MAX_ITRACE_STORE][128];
static uint32_t g_itrace_base = 0;
static uint32_t g_itrace_end = 0;
#ifdef CONFIG_ITRACE
static uint32_t g_itrace_num = 0;
#endif


static void trace_and_difftest(Decode *_this)
{
    if(g_print_step){puts_this(_this->logbuf)};
}

void exec_once()
{
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

        top->eval();
        if(top->clock)
            Log("time=%ld clk=%x rst=%x inst=0x%x IF_pc=0x%lx", contextp->time(), top->clock, top->reset, top->io_inst, top->io_IF_pc);
    }
    #ifdef CONFIG_ITRACE
    char *p = s->logbuf;
    p += snprintf(p, sizeof(s->logbuf), FMT_WORD ":", s->pc);
    int ilen = s->snpc - s->pc;
    int i;
    uint8_t *inst = (uint8_t *)&s->isa.inst.val;
    for (i = ilen - 1; i >= 0; i --) {
        p += snprintf(p, 4, " %02x", inst[i]);
    }
    int ilen_max = MUXDEF(CONFIG_ISA_x86, 8, 4);
    int space_len = ilen_max - ilen;
    if (space_len < 0) space_len = 0;
    space_len = space_len * 3 + 1;
    memset(p, ' ', space_len);
    p += space_len;
      void disassemble(char *str, int size, uint64_t pc, uint8_t *code, int nbyte);
    disassemble(p, s->logbuf + sizeof(s->logbuf) - p, top->io_IF_pc, (uint8_t *)&s->isa.inst.val, ilen);
    memcpy(g_itrace_buf[g_itrace_end], s->logbuf, strlen(s->logbuf)+1);
    if(g_itrace_num < MAX_ITRACE_STORE) g_itrace_num++;
    else  g_itrace_base = g_itrace_base < MAX_ITRACE_STORE - 1 ? g_itrace_base+1 : 0;
    g_itrace_end = g_itrace_end < MAX_ITRACE_STORE - 1 ? g_itrace_end+1 : 0;
}

void execute(uint64_t n)
{
    Decode s;
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
}