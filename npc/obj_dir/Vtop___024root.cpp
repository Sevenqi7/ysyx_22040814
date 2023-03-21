// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vtop.h for the primary calling header

#include "Vtop___024root.h"
#include "Vtop__Syms.h"

#include "verilated_dpi.h"

//==========

VL_INLINE_OPT void Vtop___024root___sequent__TOP__2(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___sequent__TOP__2\n"); );
    // Body
    vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg = 
        ((IData)(vlSelf->reset) ? 0x80000000ULL : vlSelf->top__DOT___inst_decode_unit_io_ID_npc);
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x1bU == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x1aU == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x19U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x18U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x17U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x16U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x15U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x14U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x13U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x12U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x11U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x10U == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0xfU == (0x1fU & (vlSelf->io_inst 
                                     >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0xeU == (0x1fU & (vlSelf->io_inst 
                                     >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0xdU == (0x1fU & (vlSelf->io_inst 
                                     >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0xcU == (0x1fU & (vlSelf->io_inst 
                                     >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (8U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (1U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (3U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (5U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (2U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (7U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (4U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (9U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (6U == (0x1fU & (vlSelf->io_inst 
                                   >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0xbU == (0x1fU & (vlSelf->io_inst 
                                     >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x1cU == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x1dU == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x1eU == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0x1fU == (0x1fU & (vlSelf->io_inst 
                                      >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    if (vlSelf->reset) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10 = 0ULL;
    } else if (((IData)(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn) 
                & (0xaU == (0x1fU & (vlSelf->io_inst 
                                     >> 7U))))) {
        vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10 
            = vlSelf->top__DOT___excute_unit_io_EX_RegWriteData;
    }
    vlSelf->io_IF_pc = vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg;
}

void Vtop___024unit____Vdpiimwrap_ebreak_TOP____024unit(IData/*31:0*/ halt_ret);

VL_INLINE_OPT void Vtop___024root___combo__TOP__3(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___combo__TOP__3\n"); );
    // Variables
    SData/*9:0*/ top__DOT__inst_decode_unit__DOT___GEN;
    VlWide<64>/*2047:0*/ __Vtemp32;
    // Body
    top__DOT__inst_decode_unit__DOT___GEN = ((0x380U 
                                              & (vlSelf->io_inst 
                                                 >> 5U)) 
                                             | (0x7fU 
                                                & vlSelf->io_inst));
    vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i 
        = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10);
    if (VL_UNLIKELY((0x100073U == vlSelf->io_inst))) {
        Vtop___024unit____Vdpiimwrap_ebreak_TOP____024unit(vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i);
        VL_FINISH_MT("/home/seven7/Documents/\345\255\246\344\270\232/\344\270\200\347\224\237\344\270\200\350\212\257/ysyx-workbench/npc/vsrc/top.v", 530, "");
    }
    __Vtemp32[0U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0);
    __Vtemp32[1U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0 
                             >> 0x20U));
    __Vtemp32[2U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1);
    __Vtemp32[3U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1 
                             >> 0x20U));
    __Vtemp32[4U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2);
    __Vtemp32[5U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2 
                             >> 0x20U));
    __Vtemp32[6U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3);
    __Vtemp32[7U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3 
                             >> 0x20U));
    __Vtemp32[8U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4);
    __Vtemp32[9U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4 
                             >> 0x20U));
    __Vtemp32[0xaU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5);
    __Vtemp32[0xbU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5 
                               >> 0x20U));
    __Vtemp32[0xcU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6);
    __Vtemp32[0xdU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6 
                               >> 0x20U));
    __Vtemp32[0xeU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7);
    __Vtemp32[0xfU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7 
                               >> 0x20U));
    __Vtemp32[0x10U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8);
    __Vtemp32[0x11U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8 
                                >> 0x20U));
    __Vtemp32[0x12U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9);
    __Vtemp32[0x13U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9 
                                >> 0x20U));
    __Vtemp32[0x14U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10);
    __Vtemp32[0x15U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10 
                                >> 0x20U));
    __Vtemp32[0x16U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11);
    __Vtemp32[0x17U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11 
                                >> 0x20U));
    __Vtemp32[0x18U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12);
    __Vtemp32[0x19U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12 
                                >> 0x20U));
    __Vtemp32[0x1aU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13);
    __Vtemp32[0x1bU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13 
                                >> 0x20U));
    __Vtemp32[0x1cU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14);
    __Vtemp32[0x1dU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14 
                                >> 0x20U));
    __Vtemp32[0x1eU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15);
    __Vtemp32[0x1fU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15 
                                >> 0x20U));
    __Vtemp32[0x20U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16);
    __Vtemp32[0x21U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16 
                                >> 0x20U));
    __Vtemp32[0x22U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17);
    __Vtemp32[0x23U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17 
                                >> 0x20U));
    __Vtemp32[0x24U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18);
    __Vtemp32[0x25U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18 
                                >> 0x20U));
    __Vtemp32[0x26U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19);
    __Vtemp32[0x27U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19 
                                >> 0x20U));
    __Vtemp32[0x28U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20);
    __Vtemp32[0x29U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20 
                                >> 0x20U));
    __Vtemp32[0x2aU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21);
    __Vtemp32[0x2bU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21 
                                >> 0x20U));
    __Vtemp32[0x2cU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22);
    __Vtemp32[0x2dU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22 
                                >> 0x20U));
    __Vtemp32[0x2eU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23);
    __Vtemp32[0x2fU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23 
                                >> 0x20U));
    __Vtemp32[0x30U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24);
    __Vtemp32[0x31U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24 
                                >> 0x20U));
    __Vtemp32[0x32U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25);
    __Vtemp32[0x33U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25 
                                >> 0x20U));
    __Vtemp32[0x34U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26);
    __Vtemp32[0x35U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26 
                                >> 0x20U));
    __Vtemp32[0x36U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27);
    __Vtemp32[0x37U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27 
                                >> 0x20U));
    __Vtemp32[0x38U] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28);
    __Vtemp32[0x39U] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28 
                                >> 0x20U));
    __Vtemp32[0x3aU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29);
    __Vtemp32[0x3bU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29 
                                >> 0x20U));
    __Vtemp32[0x3cU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30);
    __Vtemp32[0x3dU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30 
                                >> 0x20U));
    __Vtemp32[0x3eU] = (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31);
    __Vtemp32[0x3fU] = (IData)((vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31 
                                >> 0x20U));
    vlSelf->top__DOT__inst_decode_unit__DOT___rs1_data_T_1 
        = ((0U == (0x1fU & (vlSelf->io_inst >> 0xfU)))
            ? 0ULL : (((QData)((IData)(__Vtemp32[(((IData)(0x3fU) 
                                                   + 
                                                   (0x7c0U 
                                                    & (vlSelf->io_inst 
                                                       >> 9U))) 
                                                  >> 5U)])) 
                       << 0x20U) | (QData)((IData)(
                                                   __Vtemp32[
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

void Vtop___024root___eval(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval\n"); );
    // Body
    if (((IData)(vlSelf->clock) & (~ (IData)(vlSelf->__Vclklast__TOP__clock)))) {
        Vtop___024root___sequent__TOP__2(vlSelf);
        vlSelf->__Vm_traceActivity[1U] = 1U;
    }
    Vtop___024root___combo__TOP__3(vlSelf);
    vlSelf->__Vm_traceActivity[2U] = 1U;
    // Final
    vlSelf->__Vclklast__TOP__clock = vlSelf->clock;
}

QData Vtop___024root___change_request_1(Vtop___024root* vlSelf);

VL_INLINE_OPT QData Vtop___024root___change_request(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___change_request\n"); );
    // Body
    return (Vtop___024root___change_request_1(vlSelf));
}

VL_INLINE_OPT QData Vtop___024root___change_request_1(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___change_request_1\n"); );
    // Body
    // Change detection
    QData __req = false;  // Logically a bool
    return __req;
}

#ifdef VL_DEBUG
void Vtop___024root___eval_debug_assertions(Vtop___024root* vlSelf) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vtop___024root___eval_debug_assertions\n"); );
    // Body
    if (VL_UNLIKELY((vlSelf->clock & 0xfeU))) {
        Verilated::overWidthError("clock");}
    if (VL_UNLIKELY((vlSelf->reset & 0xfeU))) {
        Verilated::overWidthError("reset");}
}
#endif  // VL_DEBUG
