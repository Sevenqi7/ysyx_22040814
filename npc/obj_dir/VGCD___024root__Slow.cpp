// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See VGCD.h for the primary calling header

#include "VGCD___024root.h"
#include "VGCD__Syms.h"

#include "verilated_dpi.h"

//==========


void VGCD___024root___ctor_var_reset(VGCD___024root* vlSelf);

VGCD___024root::VGCD___024root(const char* _vcname__)
    : VerilatedModule(_vcname__)
 {
    // Reset structure values
    VGCD___024root___ctor_var_reset(this);
}

void VGCD___024root::__Vconfigure(VGCD__Syms* _vlSymsp, bool first) {
    if (false && first) {}  // Prevent unused
    this->vlSymsp = _vlSymsp;
}

VGCD___024root::~VGCD___024root() {
}

void VGCD___024root___initial__TOP__1(VGCD___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD___024root___initial__TOP__1\n"); );
    // Variables
    VlWide<5>/*159:0*/ __Vtemp1;
    // Body
    if (VL_UNLIKELY((0U != VL_TESTPLUSARGS_I("trace")))) {
        __Vtemp1[0U] = 0x2e766364U;
        __Vtemp1[1U] = 0x64756d70U;
        __Vtemp1[2U] = 0x766c745fU;
        __Vtemp1[3U] = 0x6f67732fU;
        __Vtemp1[4U] = 0x6cU;
        vlSymsp->_vm_contextp__->dumpfile(VL_CVT_PACK_STR_NW(5, __Vtemp1));
        vlSymsp->_traceDumpOpen();
        VL_WRITEF("[%0t] Tracing to logs/vlt_dump.vcd...\n\n",
                  64,VL_TIME_UNITED_Q(1),-12);
    }
    VL_WRITEF("[%0t] Model running...\n\n",64,VL_TIME_UNITED_Q(1),
              -12);
}

void VGCD___024unit____Vdpiimwrap_ebreak_TOP____024unit(IData/*31:0*/ halt_ret);

void VGCD___024root___settle__TOP__5(VGCD___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD___024root___settle__TOP__5\n"); );
    // Variables
    SData/*9:0*/ top__DOT__inst_decode_unit__DOT___GEN;
    VlWide<64>/*2047:0*/ __Vtemp63;
    // Body
    top__DOT__inst_decode_unit__DOT___GEN = ((0x380U 
                                              & (vlSelf->io_inst 
                                                 >> 5U)) 
                                             | (0x7fU 
                                                & vlSelf->io_inst));
    vlSelf->io_outputGCD = vlSelf->GCD__DOT__x;
    vlSelf->io_outputValid = (0U == (IData)(vlSelf->GCD__DOT__y));
    vlSelf->io_IF_pc = vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg;
    vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i 
        = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10);
    if (VL_UNLIKELY((0x100073U == vlSelf->io_inst))) {
        VGCD___024unit____Vdpiimwrap_ebreak_TOP____024unit(vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i);
        VL_FINISH_MT("/home/seven7/Documents/\345\255\246\344\270\232/\344\270\200\347\224\237\344\270\200\350\212\257/ysyx-workbench/npc/vsrc/top.v", 530, "");
    }
    __Vtemp63[0U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0);
    __Vtemp63[1U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0 
                             >> 0x20U));
    __Vtemp63[2U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1);
    __Vtemp63[3U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1 
                             >> 0x20U));
    __Vtemp63[4U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2);
    __Vtemp63[5U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2 
                             >> 0x20U));
    __Vtemp63[6U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3);
    __Vtemp63[7U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3 
                             >> 0x20U));
    __Vtemp63[8U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4);
    __Vtemp63[9U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4 
                             >> 0x20U));
    __Vtemp63[0xaU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5);
    __Vtemp63[0xbU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5 
                               >> 0x20U));
    __Vtemp63[0xcU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6);
    __Vtemp63[0xdU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6 
                               >> 0x20U));
    __Vtemp63[0xeU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7);
    __Vtemp63[0xfU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7 
                               >> 0x20U));
    __Vtemp63[0x10U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8);
    __Vtemp63[0x11U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8 
                                >> 0x20U));
    __Vtemp63[0x12U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9);
    __Vtemp63[0x13U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9 
                                >> 0x20U));
    __Vtemp63[0x14U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10);
    __Vtemp63[0x15U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10 
                                >> 0x20U));
    __Vtemp63[0x16U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11);
    __Vtemp63[0x17U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11 
                                >> 0x20U));
    __Vtemp63[0x18U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12);
    __Vtemp63[0x19U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12 
                                >> 0x20U));
    __Vtemp63[0x1aU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13);
    __Vtemp63[0x1bU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13 
                                >> 0x20U));
    __Vtemp63[0x1cU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14);
    __Vtemp63[0x1dU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14 
                                >> 0x20U));
    __Vtemp63[0x1eU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15);
    __Vtemp63[0x1fU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15 
                                >> 0x20U));
    __Vtemp63[0x20U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16);
    __Vtemp63[0x21U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16 
                                >> 0x20U));
    __Vtemp63[0x22U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17);
    __Vtemp63[0x23U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17 
                                >> 0x20U));
    __Vtemp63[0x24U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18);
    __Vtemp63[0x25U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18 
                                >> 0x20U));
    __Vtemp63[0x26U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19);
    __Vtemp63[0x27U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19 
                                >> 0x20U));
    __Vtemp63[0x28U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20);
    __Vtemp63[0x29U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20 
                                >> 0x20U));
    __Vtemp63[0x2aU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21);
    __Vtemp63[0x2bU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21 
                                >> 0x20U));
    __Vtemp63[0x2cU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22);
    __Vtemp63[0x2dU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22 
                                >> 0x20U));
    __Vtemp63[0x2eU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23);
    __Vtemp63[0x2fU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23 
                                >> 0x20U));
    __Vtemp63[0x30U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24);
    __Vtemp63[0x31U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24 
                                >> 0x20U));
    __Vtemp63[0x32U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25);
    __Vtemp63[0x33U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25 
                                >> 0x20U));
    __Vtemp63[0x34U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26);
    __Vtemp63[0x35U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26 
                                >> 0x20U));
    __Vtemp63[0x36U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27);
    __Vtemp63[0x37U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27 
                                >> 0x20U));
    __Vtemp63[0x38U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28);
    __Vtemp63[0x39U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28 
                                >> 0x20U));
    __Vtemp63[0x3aU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29);
    __Vtemp63[0x3bU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29 
                                >> 0x20U));
    __Vtemp63[0x3cU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30);
    __Vtemp63[0x3dU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30 
                                >> 0x20U));
    __Vtemp63[0x3eU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31);
    __Vtemp63[0x3fU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31 
                                >> 0x20U));
    vlSelf->top__DOT__inst_decode_unit__DOT___rs1_data_T_1 
        = ((0U == (0x1fU & (vlSelf->io_inst >> 0xfU)))
            ? 0ULL : (((QData)((IData)(__Vtemp63[(((IData)(0x3fU) 
                                                   + 
                                                   (0x7c0U 
                                                    & (vlSelf->io_inst 
                                                       >> 9U))) 
                                                  >> 5U)])) 
                       << 0x20U) | (QData)((IData)(
                                                   __Vtemp63[
                                                   (0x3eU 
                                                    & (vlSelf->io_inst 
                                                       >> 0xeU))]))));
    vlSelf->top__DOT___inst_decode_unit_io_ID_optype 
        = (((((0x100073U == vlSelf->io_inst) | (0x17U 
                                                == 
                                                (0x7fU 
                                                 & vlSelf->io_inst))) 
             | (0x13U == (IData)(top__DOT__inst_decode_unit__DOT___GEN))) 
            | (0x67U == (IData)(top__DOT__inst_decode_unit__DOT___GEN))) 
           | (0x6fU == (0x7fU & vlSelf->io_inst)));
    if ((0x100073U == vlSelf->io_inst)) {
        vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2 = 0U;
        vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0 = 3U;
    } else {
        vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2 
            = ((0x17U == (0x7fU & vlSelf->io_inst))
                ? 1U : ((0x13U == (IData)(top__DOT__inst_decode_unit__DOT___GEN))
                         ? 2U : (((0x67U == (IData)(top__DOT__inst_decode_unit__DOT___GEN)) 
                                  | (0x6fU == (0x7fU 
                                               & vlSelf->io_inst)))
                                  ? 5U : 0U)));
        vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0 
            = ((0x17U == (0x7fU & vlSelf->io_inst))
                ? 1U : (((0x13U == (IData)(top__DOT__inst_decode_unit__DOT___GEN)) 
                         | (0x67U == (IData)(top__DOT__inst_decode_unit__DOT___GEN)))
                         ? 0U : ((0x6fU == (0x7fU & vlSelf->io_inst)) 
                                 << 1U)));
    }
    vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data1 
        = ((0U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2))
            ? 0ULL : ((1U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2))
                       ? vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg
                       : ((2U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2))
                           ? vlSelf->top__DOT__inst_decode_unit__DOT___rs1_data_T_1
                           : ((5U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2))
                               ? (4ULL + vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg)
                               : 0ULL))));
    vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data2 
        = (((0x100073U != vlSelf->io_inst) & ((0x17U 
                                               == (0x7fU 
                                                   & vlSelf->io_inst)) 
                                              | (0x13U 
                                                 == (IData)(top__DOT__inst_decode_unit__DOT___GEN))))
            ? ((0U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0))
                ? (((- (QData)((IData)((vlSelf->io_inst 
                                        >> 0x1fU)))) 
                    << 0xcU) | (QData)((IData)((vlSelf->io_inst 
                                                >> 0x14U))))
                : ((1U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0))
                    ? (((QData)((IData)((- (IData)(
                                                   (vlSelf->io_inst 
                                                    >> 0x1fU))))) 
                        << 0x20U) | (QData)((IData)(
                                                    (0xfffff000U 
                                                     & vlSelf->io_inst))))
                    : 0ULL)) : 0ULL);
    vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn 
        = (((0U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0)) 
            | (1U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0))) 
           | (2U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0)));
    vlSelf->top__DOT___inst_decode_unit_io_ID_npc = 
        ((2U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0))
          ? (vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg 
             + (((- (QData)((IData)((vlSelf->io_inst 
                                     >> 0x1fU)))) << 0x14U) 
                | (QData)((IData)(((0xff000U & vlSelf->io_inst) 
                                   | ((0x800U & (vlSelf->io_inst 
                                                 >> 9U)) 
                                      | (0x7feU & (vlSelf->io_inst 
                                                   >> 0x14U))))))))
          : (((0U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0)) 
              & (5U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2)))
              ? (vlSelf->top__DOT__inst_decode_unit__DOT___rs1_data_T_1 
                 + (((- (QData)((IData)((vlSelf->io_inst 
                                         >> 0x1fU)))) 
                     << 0xcU) | (QData)((IData)((vlSelf->io_inst 
                                                 >> 0x14U)))))
              : (QData)((IData)(((IData)(4U) + (IData)(vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg))))));
    vlSelf->top__DOT___excute_unit_io_EX_RegWriteData 
        = ((1U == (IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_optype))
            ? (vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data1 
               + vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data2)
            : ((2U == (IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_optype))
                ? (vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data1 
                   - vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data2)
                : 0ULL));
    vlSelf->io_ALUResult = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
}

void VGCD___024root___eval_initial(VGCD___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD___024root___eval_initial\n"); );
    // Body
    VGCD___024root___initial__TOP__1(vlSelf);
    vlSelf->__Vclklast__TOP__GCD__02Eclock = vlSelf->GCD__02Eclock;
    vlSelf->__Vclklast__TOP__top__02Eclock = vlSelf->top__02Eclock;
}

void VGCD___024root___eval_settle(VGCD___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD___024root___eval_settle\n"); );
    // Body
    VGCD___024root___settle__TOP__5(vlSelf);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    vlSelf->__Vm_traceActivity[1U] = 1U;
    vlSelf->__Vm_traceActivity[0U] = 1U;
}

void VGCD___024root___final(VGCD___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD___024root___final\n"); );
}

void VGCD___024root___ctor_var_reset(VGCD___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    VGCD__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    VGCD___024root___ctor_var_reset\n"); );
    // Body
    vlSelf->GCD__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->GCD__02Ereset = VL_RAND_RESET_I(1);
    vlSelf->io_value1 = VL_RAND_RESET_I(16);
    vlSelf->io_value2 = VL_RAND_RESET_I(16);
    vlSelf->io_loadingValues = VL_RAND_RESET_I(1);
    vlSelf->io_outputGCD = VL_RAND_RESET_I(16);
    vlSelf->io_outputValid = VL_RAND_RESET_I(1);
    vlSelf->top__02Eclock = VL_RAND_RESET_I(1);
    vlSelf->top__02Ereset = VL_RAND_RESET_I(1);
    vlSelf->io_inst = VL_RAND_RESET_I(32);
    vlSelf->io_IF_pc = VL_RAND_RESET_Q(64);
    vlSelf->io_ALUResult = VL_RAND_RESET_Q(64);
    vlSelf->GCD__DOT__x = VL_RAND_RESET_I(16);
    vlSelf->GCD__DOT__y = VL_RAND_RESET_I(16);
    vlSelf->top__DOT___excute_unit_io_EX_RegWriteData = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT___inst_decode_unit_io_ID_npc = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data1 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data2 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT___inst_decode_unit_io_ID_optype = VL_RAND_RESET_I(4);
    vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn = VL_RAND_RESET_I(1);
    vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0 = VL_RAND_RESET_I(2);
    vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2 = VL_RAND_RESET_I(3);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__inst_decode_unit__DOT___rs1_data_T_1 = VL_RAND_RESET_Q(64);
    vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i = VL_RAND_RESET_I(32);
    for (int __Vi0=0; __Vi0<3; ++__Vi0) {
        vlSelf->__Vm_traceActivity[__Vi0] = VL_RAND_RESET_I(1);
    }
}
