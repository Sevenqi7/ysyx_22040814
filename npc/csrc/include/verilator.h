#ifndef __VERILATOR_H
#define __VERILATOR_H

#include <memory>
#include <verilated.h>
#include "verilated_dpi.h"
#include <verilated_vcd_c.h>
#include "svdpi.h"
#include "Vtop__Dpi.h"
#include "Vtop.h"

extern Vtop *top;
extern VerilatedContext *contextp;
#endif