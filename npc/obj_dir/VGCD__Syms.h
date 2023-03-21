// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Symbol table internal header
//
// Internal details; most calling programs do not need this header,
// unless using verilator public meta comments.

#ifndef VERILATED_VGCD__SYMS_H_
#define VERILATED_VGCD__SYMS_H_  // guard

#include "verilated_heavy.h"
#include "verilated_vcd_c.h"

// INCLUDE MODEL CLASS

#include "VGCD.h"

// INCLUDE MODULE CLASSES
#include "VGCD___024root.h"
#include "VGCD___024unit.h"

// DPI TYPES for DPI Export callbacks (Internal use)

// SYMS CLASS (contains all model state)
class VGCD__Syms final : public VerilatedSyms {
  public:
    // INTERNAL STATE
    VGCD* const __Vm_modelp;
    bool __Vm_dumping = false;  // Dumping is active
    VerilatedMutex __Vm_dumperMutex;  // Protect __Vm_dumperp
    VerilatedVcdC* __Vm_dumperp VL_GUARDED_BY(__Vm_dumperMutex) = nullptr;  /// Trace class for $dump*
    bool __Vm_activity = false;  ///< Used by trace routines to determine change occurred
    uint32_t __Vm_baseCode = 0;  ///< Used by trace routines when tracing multiple models
    bool __Vm_didInit = false;

    // MODULE INSTANCE STATE
    VGCD___024root                 TOP;
    VGCD___024unit                 TOP____024unit;

    // CONSTRUCTORS
    VGCD__Syms(VerilatedContext* contextp, const char* namep, VGCD* modelp);
    ~VGCD__Syms();

    // METHODS
    const char* name() { return TOP.name(); }
    void _traceDump();
    void _traceDumpOpen();
    void _traceDumpClose();
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

#endif  // guard
