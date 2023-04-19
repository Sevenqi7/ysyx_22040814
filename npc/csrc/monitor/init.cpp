#include <verilator.h>
#include <npc.h>
#include <memory.h>
#include <stdio.h>


long img_size;

long init_img(int argc, char **argv);
void init_sdb();
void init_disasm(const char *triple);
void init_ftrace(char *path);
void init_vga();
#ifdef CONFIG_DIFFTEST
void init_difftest(char *ref_so_file, long img_size, int port);
#endif

void reset(int time)
{
    top->reset = !0;
    for(int i=0;i<time;i++)
    {
        contextp->timeInc(1);
        top->clock = !top->clock;
        top->eval();
    }
    top->reset = !1;
}

void init_npc(int argc, char **argv)
{
    Log("npc initialize...");
    Verilated::mkdir("logs");
    contextp = new VerilatedContext;
    contextp->debug(0);
    contextp->randReset(3);
    // contextp->traceEverOn(true);
    contextp->commandArgs(argc, argv);
    top = new Vtop;
    top->clock = 0;
    Verilated::traceEverOn(true);
    
    img_size = init_img(argc, argv);
    init_disasm("riscv64");
    init_ftrace(argv[2]);
    #ifdef CONFIG_DIFFTEST
    init_difftest(argv[3],img_size, 1234);
    #endif
    init_sdb();
    init_vga();

    for(int i=0;i<6;i++)
    {
        // contextp->timeInc(1);
        // top->clock = !top->clock;
        // top->eval();
        clock_step();
    }
}

long init_img(int argc, char **argv)
{

    #ifdef CONFIG_DIFFTEST
    if(argc <= 2)
    #else
    if(argc <= 1)
    #endif
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Usage: make ARCH=$ISA run\n");
        exit(0);
    }
    //read img
    char *img_file = argv[1];
    if(img_file == NULL)
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Error: No image is given!\n");
        exit(0);
    }
    FILE *fp = fopen(img_file, "rb");
    fseek(fp, 0, SEEK_END);
    long size = ftell(fp);
    printf("\033[0m\033[1;36mThe image is %s, size=%ld\033[0m\n", img_file, size);
    
    fseek(fp, 0, SEEK_SET);
    int ret = fread(pmem_addr(0), size, 1, fp);
    if(ret == -1)
    {
        printf("\033[0m\033[1;31m%s\033[0m", "Error: Failed to read image file!\n");
        exit(-1);
    }
    fclose(fp);
    while(top->io_PF_npc != RESET_VECTOR)
        reset(10);
    return size;
}
