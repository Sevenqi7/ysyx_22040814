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
#include <cpu/difftest.h>
#include "../local-include/reg.h"
#include <memory/paddr.h>

extern const char *regs[];

bool isa_difftest_checkregs(CPU_state *ref_r, vaddr_t pc) {
  for(int i=0;i<32;i++)
  {
      if(ref_r->gpr[i] != cpu.gpr[i])
      {
          Log("Difftest found %s value is 0x%lx, should be 0x%lx", regs[i], cpu.gpr[i], ref_r->gpr[i]);
          return false;
      }
  }
  return true;
}

bool difftest_flag = true;

extern void (*ref_difftest_memcpy)(paddr_t addr, void *buf, size_t n, bool direction) ;
extern void (*ref_difftest_regcpy)(void *dut, bool direction);
extern void (*ref_difftest_exec)(uint64_t n);


//copy special register(mepc, mtvnc, etc.)
void isa_diff_mregcpy()
{
    CPU_state reg;
    reg.gpr[10] = cpu.csr.mepc;
    reg.gpr[11] = cpu.csr.mstatus;
    reg.gpr[12] = cpu.csr.mcause;
    reg.pc = 0x90000000;        //let ref jump here to excute
    uint32_t inst [3];
    inst[0] = 0x34151073;       //a0->mepc
    inst[1] = 0x30059073;       //a1->mstatus
    inst[2] = 0x34261073;        //a2->mcause
    ref_difftest_regcpy(&reg, DIFFTEST_TO_REF);
    ref_difftest_memcpy(0x90000000, inst, sizeof(inst), DIFFTEST_TO_REF);
    printf("eee\n");
    ref_difftest_exec(3);
}

void isa_difftest_attach(bool flag) {
  if(flag)
  {
      difftest_flag = true;
      isa_diff_mregcpy();
      ref_difftest_regcpy(&cpu, DIFFTEST_TO_REF);
      ref_difftest_memcpy(RESET_VECTOR + 0x100000, guest_to_host(RESET_VECTOR + 0x100000), CONFIG_MSIZE - 0x100000, DIFFTEST_TO_REF);
      printf("eee\n");
  }
  else
      difftest_flag = false;
}
