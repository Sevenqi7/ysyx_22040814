// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vtop.h for the primary calling header

#ifndef VERILATED_VTOP___024ROOT_H_
#define VERILATED_VTOP___024ROOT_H_  // guard

#include "verilated_heavy.h"

//==========

class Vtop__Syms;
class Vtop_VerilatedVcd;
class Vtop___024unit;


//----------

VL_MODULE(Vtop___024root) {
  public:
    // CELLS
    Vtop___024unit* __PVT____024unit;

    // PORTS
    VL_IN8(clock,0,0);
    VL_IN8(reset,0,0);
    VL_IN(io_inst,31,0);
    VL_OUT64(io_IF_pc,63,0);
    VL_OUT64(io_ALUResult,63,0);

    // LOCAL SIGNALS
    CData/*3:0*/ top__DOT___inst_decode_unit_io_ID_optype;
    CData/*0:0*/ top__DOT___inst_decode_unit_io_ID_RegWriteEn;
    CData/*1:0*/ top__DOT__inst_decode_unit__DOT___GEN_0;
    CData/*2:0*/ top__DOT__inst_decode_unit__DOT__InstInfo_2;
    IData/*31:0*/ top__DOT__simulate__DOT__unnamedblk1__DOT__i;
    QData/*63:0*/ top__DOT___excute_unit_io_EX_RegWriteData;
    QData/*63:0*/ top__DOT___inst_decode_unit_io_ID_npc;
    QData/*63:0*/ top__DOT___inst_decode_unit_io_ID_ALU_Data1;
    QData/*63:0*/ top__DOT___inst_decode_unit_io_ID_ALU_Data2;
    QData/*63:0*/ top__DOT__inst_fetch_unit__DOT__pcReg;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_0;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_1;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_2;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_3;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_4;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_5;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_6;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_7;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_8;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_9;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_10;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_11;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_12;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_13;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_14;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_15;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_16;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_17;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_18;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_19;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_20;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_21;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_22;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_23;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_24;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_25;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_26;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_27;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_28;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_29;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_30;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT__GPR_31;
    QData/*63:0*/ top__DOT__inst_decode_unit__DOT___rs1_data_T_1;

    // LOCAL VARIABLES
    CData/*0:0*/ __Vclklast__TOP__clock;
    VlUnpacked<CData/*0:0*/, 3> __Vm_traceActivity;

    // INTERNAL VARIABLES
    Vtop__Syms* vlSymsp;  // Symbol table

    // CONSTRUCTORS
  private:
    VL_UNCOPYABLE(Vtop___024root);  ///< Copying not allowed
  public:
    Vtop___024root(const char* name);
    ~Vtop___024root();

    // INTERNAL METHODS
    void __Vconfigure(Vtop__Syms* symsp, bool first);
} VL_ATTR_ALIGNED(VL_CACHE_LINE_BYTES);

//----------


#endif  // guard
