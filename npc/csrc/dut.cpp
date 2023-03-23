#include <verilator.h>
#include <npc.h>
#include <memory.h>
#include <dlfcn.h>

typedef struct REF_GPR{
  uint64_t gpr[32];
  uint64_t pc;
}REF_GPR;

void (*ref_difftest_memcpy)(paddr_t addr, void *buf, size_t n, bool direction) = NULL;
void (*ref_difftest_regcpy)(void *dut, bool direction) = NULL;
void (*ref_difftest_exec)(uint64_t n) = NULL;
void (*ref_difftest_raise_intr)(uint64_t NO) = NULL;

// #ifdef CONFIG_DIFFTEST

extern bool difftest_checkregs(REF_GPR *ref, vaddr_t pc);

extern long img_size;

void init_difftest(char *ref_so_file, long img_size, int port) {
  assert(ref_so_file != NULL);

  void *handle;
  handle = dlopen(ref_so_file, RTLD_LAZY);
  assert(handle);

  ref_difftest_memcpy = (void (*)(paddr_t, void*, size_t, bool))dlsym(handle, "difftest_memcpy");
  assert(ref_difftest_memcpy);

  ref_difftest_regcpy = (void (*)(void*, bool))dlsym(handle, "difftest_regcpy");
  assert(ref_difftest_regcpy);

  ref_difftest_exec = (void (*)(uint64_t))dlsym(handle, "difftest_exec");
  assert(ref_difftest_exec);

  ref_difftest_raise_intr = (void (*)(uint64_t))dlsym(handle, "difftest_raise_intr");
  assert(ref_difftest_raise_intr);

  void (*ref_difftest_init)(int) = (void(*)(int)) dlsym(handle, "difftest_init");
  assert(ref_difftest_init);

  Log("Differential testing: %s", ANSI_FMT("ON", ANSI_FG_GREEN));
  Log("The result of every instruction will be compared with %s. "
      "This will help you a lot for debugging, but also significantly reduce the performance. "
      "If it is not necessary, you can turn it off in menuconfig.", ref_so_file);

  REF_GPR to_ref = {.pc = RESET_VECTOR};
  memcpy(to_ref.gpr, cpu_gpr, sizeof(cpu_gpr));
  ref_difftest_init(port);
  ref_difftest_memcpy(RESET_VECTOR, guest_to_host(RESET_VECTOR), img_size, DIFFTEST_TO_REF);
  ref_difftest_regcpy(&to_ref, DIFFTEST_TO_REF);
}

static void checkregs(REF_GPR *ref, vaddr_t pc)
{
  if(!difftest_checkregs(ref, pc))
  {
    npc_state.state = NPC_ABORT;
    reg_display();
  }
}

void difftest_step(vaddr_t pc)
{
  REF_GPR ref_gpr;
  ref_difftest_exec(1);
  ref_difftest_regcpy(&ref_gpr, DIFFTEST_TO_DUT);
  checkregs(&ref_gpr, pc);
}

// #endif
