#include <verilator.h>
#include <npc.h>

const char *regs[] = {
  "$0", "ra", "sp", "gp", "tp", "t0", "t1", "t2",
  "s0", "s1", "a0", "a1", "a2", "a3", "a4", "a5",
  "a6", "a7", "s2", "s3", "s4", "s5", "s6", "s7",
  "s8", "s9", "s10", "s11", "t3", "t4", "t5", "t6"
};

uint64_t *cpu_gpr = NULL;
extern "C" void set_gpr_ptr(const svOpenArrayHandle r) {
  cpu_gpr = (uint64_t *)(((VerilatedDpiOpenVar*)r)->datap());
}

void reg_display() {
  int i;
  for (i = 0; i < 32; i++) {
    printf("%s = 0x%016lx\n", regs[i], cpu_gpr[i]);
  }
}

uint64_t reg_str2val(const char *s, bool *success) {
  int i;
  *success = false;
  for(i=1;i<32;i++)
    if(!strcmp(s+1, regs[i])) 
        break;
  if(!strcmp(s, regs[0])) {*success = true; return 0;}
  if(!strcmp(s, "$pc")) {*success = true; return top->io_IF_pc;}
  if(i < 32)
  {
      *success = true;
      return cpu_gpr[i];
  }
  else
      return 0;
}
