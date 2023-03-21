// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtop__Syms.h"


void Vtop___024root__traceChgSub0(Vtop___024root* vlSelf, VerilatedVcd* tracep);

void Vtop___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep) {
    Vtop___024root* const __restrict vlSelf = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    if (VL_UNLIKELY(!vlSymsp->__Vm_activity)) return;
    // Body
    {
        Vtop___024root__traceChgSub0((&vlSymsp->TOP), tracep);
    }
}

void Vtop___024root__traceChgSub0(Vtop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode + 1);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[1U])) {
            tracep->chgQData(oldp+0,(vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg),64);
            tracep->chgQData(oldp+2,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10),64);
            tracep->chgQData(oldp+4,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0),64);
            tracep->chgQData(oldp+6,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1),64);
            tracep->chgQData(oldp+8,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2),64);
            tracep->chgQData(oldp+10,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3),64);
            tracep->chgQData(oldp+12,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4),64);
            tracep->chgQData(oldp+14,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5),64);
            tracep->chgQData(oldp+16,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6),64);
            tracep->chgQData(oldp+18,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7),64);
            tracep->chgQData(oldp+20,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8),64);
            tracep->chgQData(oldp+22,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9),64);
            tracep->chgQData(oldp+24,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11),64);
            tracep->chgQData(oldp+26,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12),64);
            tracep->chgQData(oldp+28,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13),64);
            tracep->chgQData(oldp+30,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14),64);
            tracep->chgQData(oldp+32,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15),64);
            tracep->chgQData(oldp+34,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16),64);
            tracep->chgQData(oldp+36,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17),64);
            tracep->chgQData(oldp+38,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18),64);
            tracep->chgQData(oldp+40,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19),64);
            tracep->chgQData(oldp+42,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20),64);
            tracep->chgQData(oldp+44,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21),64);
            tracep->chgQData(oldp+46,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22),64);
            tracep->chgQData(oldp+48,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23),64);
            tracep->chgQData(oldp+50,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24),64);
            tracep->chgQData(oldp+52,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25),64);
            tracep->chgQData(oldp+54,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26),64);
            tracep->chgQData(oldp+56,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27),64);
            tracep->chgQData(oldp+58,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28),64);
            tracep->chgQData(oldp+60,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29),64);
            tracep->chgQData(oldp+62,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30),64);
            tracep->chgQData(oldp+64,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31),64);
        }
        if (VL_UNLIKELY(vlSelf->__Vm_traceActivity[2U])) {
            tracep->chgQData(oldp+66,(vlSelf->top__DOT___excute_unit_io_EX_RegWriteData),64);
            tracep->chgBit(oldp+68,(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn));
            tracep->chgQData(oldp+69,(vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data1),64);
            tracep->chgQData(oldp+71,(vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data2),64);
            tracep->chgCData(oldp+73,(vlSelf->top__DOT___inst_decode_unit_io_ID_optype),4);
            tracep->chgCData(oldp+74,(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2),3);
            tracep->chgIData(oldp+75,(vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i),32);
        }
        tracep->chgBit(oldp+76,(vlSelf->clock));
        tracep->chgBit(oldp+77,(vlSelf->reset));
        tracep->chgIData(oldp+78,(vlSelf->io_inst),32);
        tracep->chgQData(oldp+79,(vlSelf->io_IF_pc),64);
        tracep->chgQData(oldp+81,(vlSelf->io_ALUResult),64);
        tracep->chgQData(oldp+83,(((2U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0))
                                    ? (vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg 
                                       + (((- (QData)((IData)(
                                                              (vlSelf->io_inst 
                                                               >> 0x1fU)))) 
                                           << 0x14U) 
                                          | (QData)((IData)(
                                                            ((0xff000U 
                                                              & vlSelf->io_inst) 
                                                             | ((0x800U 
                                                                 & (vlSelf->io_inst 
                                                                    >> 9U)) 
                                                                | (0x7feU 
                                                                   & (vlSelf->io_inst 
                                                                      >> 0x14U))))))))
                                    : (((0U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0)) 
                                        & (5U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2)))
                                        ? (vlSelf->top__DOT__inst_decode_unit__DOT___rs1_data_T_1 
                                           + (((- (QData)((IData)(
                                                                  (vlSelf->io_inst 
                                                                   >> 0x1fU)))) 
                                               << 0xcU) 
                                              | (QData)((IData)(
                                                                (vlSelf->io_inst 
                                                                 >> 0x14U)))))
                                        : (QData)((IData)(
                                                          ((IData)(4U) 
                                                           + (IData)(vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg))))))),64);
        tracep->chgCData(oldp+85,((0x1fU & (vlSelf->io_inst 
                                            >> 7U))),5);
    }
}

void Vtop___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/) {
    Vtop___024root* const __restrict vlSelf = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        vlSymsp->__Vm_activity = false;
        vlSymsp->TOP.__Vm_traceActivity[0U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[1U] = 0U;
        vlSymsp->TOP.__Vm_traceActivity[2U] = 0U;
    }
}
