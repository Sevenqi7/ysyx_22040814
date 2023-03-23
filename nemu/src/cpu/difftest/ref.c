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
#include <cpu/cpu.h>
#include <difftest-def.h>
#include <memory/paddr.h>

void difftest_memcpy(paddr_t addr, void *buf, size_t n, bool direction) {
  if(addr < PMEM_LEFT || addr > PMEM_RIGHT)
  {
      printf("Difftest addr out of bound\n");
      assert(0);   
  }
  Log("buf first:%lx", *(uint64_t*)buf);
  char *p = buf;
  if(direction == DIFFTEST_TO_DUT)
    while(n--)
      *p++ = paddr_read(addr++, 1);
  else if(direction == DIFFTEST_TO_REF)
    while(n--)
      paddr_write(addr++, 1, *p++);
}

void difftest_regcpy(void *dut, bool direction) {
  if(direction == DIFFTEST_TO_DUT)
      memcpy(dut, &cpu.gpr, sizeof(cpu.gpr));
  else if(direction == DIFFTEST_TO_DUT)
      memcpy(&cpu.gpr, dut, sizeof(cpu.gpr));
}

void difftest_exec(uint64_t n) {
  cpu_exec(n);
}

void difftest_raise_intr(word_t NO) {
  assert(0);
}

void difftest_init(int port) {
  /* Perform ISA dependent initialization. */
  init_isa();
}
