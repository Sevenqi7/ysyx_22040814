// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See VGCD.h for the primary calling header

#ifndef VERILATED_VGCD___024UNIT_H_
#define VERILATED_VGCD___024UNIT_H_  // guard

#include "verilated_heavy.h"

//==========

class VGCD__Syms;
class VGCD_VerilatedVcd;


//----------

VL_MODULE(VGCD___024unit) {
  public:

    // INTERNAL VARIABLES
    VGCD__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(VGCD___024unit);  ///< Copying not allowed
  public:
    VGCD___024unit(const char* name);
    ~VGCD___024unit();

    // INTERNAL METHODS
    void __Vconfigure(VGCD__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
