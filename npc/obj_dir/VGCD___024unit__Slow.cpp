// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGCD.h for the primary calling header

#include "VGCD___024unit.h"
#include "VGCD__Syms.h"

#include "verilated_dpi.h"

//==========


void VGCD___024unit___ctor_var_reset(VGCD___024unit* vlSelf);

VGCD___024unit::VGCD___024unit(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VGCD___024unit___ctor_var_reset(this);
}

void VGCD___024unit::__Vconfigure(VGCD__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VGCD___024unit::~VGCD___024unit() {
}

void VGCD___024unit___ctor_var_reset(VGCD___024unit* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+        VGCD___024unit___ctor_var_reset\n"); );
}
