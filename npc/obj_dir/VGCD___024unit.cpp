// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGCD.h for the primary calling header

#include "VGCD___024unit.h"
#include "VGCD__Syms.h"

#include "verilated_dpi.h"

//==========

extern "C" void ebreak(int halt_ret);

VL_INLINE_OPT void VGCD___024unit____Vdpiimwrap_ebreak_TOP____024unit(IData/*31:0*/ halt_ret) {
    VL_DEBUG_IF(VL_DBG_MSGF("+        VGCD___024unit____Vdpiimwrap_ebreak_TOP____024unit\n"); );
    // Body
    int halt_ret__Vcvt;
    for (size_t halt_ret__Vidx = 0; halt_ret__Vidx < 1; ++halt_ret__Vidx) halt_ret__Vcvt = halt_ret;
    ebreak(halt_ret__Vcvt);
}
