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
#include <common.h>

word_t isa_read_csr(word_t NO)
{
  switch(NO)
  {
    case 0x300: return cpu.csr.mstatus; break;
    case 0x305: return cpu.csr.mtvec  ; break;
    case 0x341: return cpu.csr.mepc   ; break;
    case 0x342: return cpu.csr.mcause ; break;
    default: assert(0);
  }
}

void isa_write_csr(word_t NO, word_t data)
{
  switch(NO)
  {
    case 0x300: cpu.csr.mstatus = data; break;
    case 0x305: cpu.csr.mtvec   = data; Log("reach:0x%lx\n", data);break;
    case 0x341: cpu.csr.mepc    = data; break;
    case 0x342: cpu.csr.mcause  = data; break;
    default: assert(0);
  }
}

word_t isa_raise_intr(word_t NO, vaddr_t epc) {
  /* TODO: Trigger an interrupt/exception with ``NO''.
   * Then return the address of the interrupt/exception vector.
   */
  cpu.csr.mepc = epc;
  cpu.csr.mcause = NO;
  IFDEF(CONFIG_ETRACE, Log("Exception occurs: code:%lu pc:0x%lx ret_addr:0x%lx", NO, epc, cpu.csr.mtvec));
  return cpu.csr.mtvec;
}

word_t isa_query_intr() {
  return INTR_EMPTY;
}
