// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Tracing implementation internals
#include "verilated_vcd_c.h"
#include "Vtop__Syms.h"


void Vtop___024root__traceInitSub0(Vtop___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void Vtop___024root__traceInitTop(Vtop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        Vtop___024root__traceInitSub0(vlSelf, tracep);
    }
}

void Vtop___024root__traceInitSub0(Vtop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    const int c = vlSymsp->__Vm_baseCode;
    if (false && tracep && c) {}  // Prevent unused
    // Body
    {
        tracep->declBit(c+77,"clock", false,-1);
        tracep->declBit(c+78,"reset", false,-1);
        tracep->declBus(c+79,"io_inst", false,-1, 31,0);
        tracep->declQuad(c+80,"io_IF_pc", false,-1, 63,0);
        tracep->declQuad(c+82,"io_ALUResult", false,-1, 63,0);
        tracep->declBit(c+77,"top clock", false,-1);
        tracep->declBit(c+78,"top reset", false,-1);
        tracep->declBus(c+79,"top io_inst", false,-1, 31,0);
        tracep->declQuad(c+80,"top io_IF_pc", false,-1, 63,0);
        tracep->declQuad(c+82,"top io_ALUResult", false,-1, 63,0);
        tracep->declBit(c+77,"top inst_fetch_unit clock", false,-1);
        tracep->declBit(c+78,"top inst_fetch_unit reset", false,-1);
        tracep->declQuad(c+84,"top inst_fetch_unit io_IF_npc", false,-1, 63,0);
        tracep->declQuad(c+1,"top inst_fetch_unit io_IF_pc", false,-1, 63,0);
        tracep->declQuad(c+1,"top inst_fetch_unit pcReg", false,-1, 63,0);
        tracep->declBit(c+77,"top inst_decode_unit clock", false,-1);
        tracep->declBit(c+78,"top inst_decode_unit reset", false,-1);
        tracep->declBus(c+79,"top inst_decode_unit io_IF_Inst", false,-1, 31,0);
        tracep->declQuad(c+1,"top inst_decode_unit io_IF_pc", false,-1, 63,0);
        tracep->declQuad(c+67,"top inst_decode_unit io_EX_RegWriteData", false,-1, 63,0);
        tracep->declBus(c+86,"top inst_decode_unit io_EX_RegWriteID", false,-1, 4,0);
        tracep->declBit(c+69,"top inst_decode_unit io_EX_RegWriteEn", false,-1);
        tracep->declQuad(c+84,"top inst_decode_unit io_ID_npc", false,-1, 63,0);
        tracep->declQuad(c+70,"top inst_decode_unit io_ID_ALU_Data1", false,-1, 63,0);
        tracep->declQuad(c+72,"top inst_decode_unit io_ID_ALU_Data2", false,-1, 63,0);
        tracep->declBus(c+74,"top inst_decode_unit io_ID_optype", false,-1, 3,0);
        tracep->declBus(c+86,"top inst_decode_unit io_ID_RegWriteID", false,-1, 4,0);
        tracep->declBit(c+69,"top inst_decode_unit io_ID_RegWriteEn", false,-1);
        tracep->declQuad(c+3,"top inst_decode_unit io_ID_GPR10", false,-1, 63,0);
        tracep->declBus(c+75,"top inst_decode_unit InstInfo_2", false,-1, 2,0);
        tracep->declQuad(c+5,"top inst_decode_unit GPR_0", false,-1, 63,0);
        tracep->declQuad(c+7,"top inst_decode_unit GPR_1", false,-1, 63,0);
        tracep->declQuad(c+9,"top inst_decode_unit GPR_2", false,-1, 63,0);
        tracep->declQuad(c+11,"top inst_decode_unit GPR_3", false,-1, 63,0);
        tracep->declQuad(c+13,"top inst_decode_unit GPR_4", false,-1, 63,0);
        tracep->declQuad(c+15,"top inst_decode_unit GPR_5", false,-1, 63,0);
        tracep->declQuad(c+17,"top inst_decode_unit GPR_6", false,-1, 63,0);
        tracep->declQuad(c+19,"top inst_decode_unit GPR_7", false,-1, 63,0);
        tracep->declQuad(c+21,"top inst_decode_unit GPR_8", false,-1, 63,0);
        tracep->declQuad(c+23,"top inst_decode_unit GPR_9", false,-1, 63,0);
        tracep->declQuad(c+3,"top inst_decode_unit GPR_10", false,-1, 63,0);
        tracep->declQuad(c+25,"top inst_decode_unit GPR_11", false,-1, 63,0);
        tracep->declQuad(c+27,"top inst_decode_unit GPR_12", false,-1, 63,0);
        tracep->declQuad(c+29,"top inst_decode_unit GPR_13", false,-1, 63,0);
        tracep->declQuad(c+31,"top inst_decode_unit GPR_14", false,-1, 63,0);
        tracep->declQuad(c+33,"top inst_decode_unit GPR_15", false,-1, 63,0);
        tracep->declQuad(c+35,"top inst_decode_unit GPR_16", false,-1, 63,0);
        tracep->declQuad(c+37,"top inst_decode_unit GPR_17", false,-1, 63,0);
        tracep->declQuad(c+39,"top inst_decode_unit GPR_18", false,-1, 63,0);
        tracep->declQuad(c+41,"top inst_decode_unit GPR_19", false,-1, 63,0);
        tracep->declQuad(c+43,"top inst_decode_unit GPR_20", false,-1, 63,0);
        tracep->declQuad(c+45,"top inst_decode_unit GPR_21", false,-1, 63,0);
        tracep->declQuad(c+47,"top inst_decode_unit GPR_22", false,-1, 63,0);
        tracep->declQuad(c+49,"top inst_decode_unit GPR_23", false,-1, 63,0);
        tracep->declQuad(c+51,"top inst_decode_unit GPR_24", false,-1, 63,0);
        tracep->declQuad(c+53,"top inst_decode_unit GPR_25", false,-1, 63,0);
        tracep->declQuad(c+55,"top inst_decode_unit GPR_26", false,-1, 63,0);
        tracep->declQuad(c+57,"top inst_decode_unit GPR_27", false,-1, 63,0);
        tracep->declQuad(c+59,"top inst_decode_unit GPR_28", false,-1, 63,0);
        tracep->declQuad(c+61,"top inst_decode_unit GPR_29", false,-1, 63,0);
        tracep->declQuad(c+63,"top inst_decode_unit GPR_30", false,-1, 63,0);
        tracep->declQuad(c+65,"top inst_decode_unit GPR_31", false,-1, 63,0);
        tracep->declQuad(c+70,"top excute_unit io_ID_ALU_Data1", false,-1, 63,0);
        tracep->declQuad(c+72,"top excute_unit io_ID_ALU_Data2", false,-1, 63,0);
        tracep->declBus(c+74,"top excute_unit io_ID_optype", false,-1, 3,0);
        tracep->declBit(c+69,"top excute_unit io_ID_RegWriteEn", false,-1);
        tracep->declBus(c+86,"top excute_unit io_ID_RegWriteID", false,-1, 4,0);
        tracep->declQuad(c+67,"top excute_unit io_EX_RegWriteData", false,-1, 63,0);
        tracep->declBus(c+86,"top excute_unit io_EX_RegWriteID", false,-1, 4,0);
        tracep->declBit(c+69,"top excute_unit io_EX_RegWriteEn", false,-1);
        tracep->declBus(c+79,"top simulate inst", false,-1, 31,0);
        tracep->declQuad(c+3,"top simulate R10", false,-1, 63,0);
        tracep->declBus(c+76,"top simulate unnamedblk1 i", false,-1, 31,0);
    }
}

void Vtop___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) VL_ATTR_COLD;
void Vtop___024root__traceChgTop0(void* voidSelf, VerilatedVcd* tracep);
void Vtop___024root__traceCleanup(void* voidSelf, VerilatedVcd* /*unused*/);

void Vtop___024root__traceRegister(Vtop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        tracep->addFullCb(&Vtop___024root__traceFullTop0, vlSelf);
        tracep->addChgCb(&Vtop___024root__traceChgTop0, vlSelf);
        tracep->addCleanupCb(&Vtop___024root__traceCleanup, vlSelf);
    }
}

void Vtop___024root__traceFullSub0(Vtop___024root* vlSelf, VerilatedVcd* tracep) VL_ATTR_COLD;

void Vtop___024root__traceFullTop0(void* voidSelf, VerilatedVcd* tracep) {
    Vtop___024root* const __restrict vlSelf = static_cast<Vtop___024root*>(voidSelf);
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    // Body
    {
        Vtop___024root__traceFullSub0((&vlSymsp->TOP), tracep);
    }
}

void Vtop___024root__traceFullSub0(Vtop___024root* vlSelf, VerilatedVcd* tracep) {
    if (false && vlSelf) {}  // Prevent unused
    Vtop__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    vluint32_t* const oldp = tracep->oldp(vlSymsp->__Vm_baseCode);
    if (false && oldp) {}  // Prevent unused
    // Body
    {
        tracep->fullQData(oldp+1,(vlSelf->top__DOT__inst_fetch_unit__DOT__pcReg),64);
        tracep->fullQData(oldp+3,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_10),64);
        tracep->fullQData(oldp+5,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_0),64);
        tracep->fullQData(oldp+7,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_1),64);
        tracep->fullQData(oldp+9,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_2),64);
        tracep->fullQData(oldp+11,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_3),64);
        tracep->fullQData(oldp+13,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_4),64);
        tracep->fullQData(oldp+15,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_5),64);
        tracep->fullQData(oldp+17,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_6),64);
        tracep->fullQData(oldp+19,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_7),64);
        tracep->fullQData(oldp+21,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_8),64);
        tracep->fullQData(oldp+23,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_9),64);
        tracep->fullQData(oldp+25,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_11),64);
        tracep->fullQData(oldp+27,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_12),64);
        tracep->fullQData(oldp+29,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_13),64);
        tracep->fullQData(oldp+31,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_14),64);
        tracep->fullQData(oldp+33,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_15),64);
        tracep->fullQData(oldp+35,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_16),64);
        tracep->fullQData(oldp+37,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_17),64);
        tracep->fullQData(oldp+39,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_18),64);
        tracep->fullQData(oldp+41,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_19),64);
        tracep->fullQData(oldp+43,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_20),64);
        tracep->fullQData(oldp+45,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_21),64);
        tracep->fullQData(oldp+47,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_22),64);
        tracep->fullQData(oldp+49,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_23),64);
        tracep->fullQData(oldp+51,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_24),64);
        tracep->fullQData(oldp+53,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_25),64);
        tracep->fullQData(oldp+55,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_26),64);
        tracep->fullQData(oldp+57,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_27),64);
        tracep->fullQData(oldp+59,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_28),64);
        tracep->fullQData(oldp+61,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_29),64);
        tracep->fullQData(oldp+63,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_30),64);
        tracep->fullQData(oldp+65,(vlSelf->top__DOT__inst_decode_unit__DOT__GPR_31),64);
        tracep->fullQData(oldp+67,(vlSelf->top__DOT___excute_unit_io_EX_RegWriteData),64);
        tracep->fullBit(oldp+69,(vlSelf->top__DOT___inst_decode_unit_io_ID_RegWriteEn));
        tracep->fullQData(oldp+70,(vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data1),64);
        tracep->fullQData(oldp+72,(vlSelf->top__DOT___inst_decode_unit_io_ID_ALU_Data2),64);
        tracep->fullCData(oldp+74,(vlSelf->top__DOT___inst_decode_unit_io_ID_optype),4);
        tracep->fullCData(oldp+75,(vlSelf->top__DOT__inst_decode_unit__DOT__InstInfo_2),3);
        tracep->fullIData(oldp+76,(vlSelf->top__DOT__simulate__DOT__unnamedblk1__DOT__i),32);
        tracep->fullBit(oldp+77,(vlSelf->clock));
        tracep->fullBit(oldp+78,(vlSelf->reset));
        tracep->fullIData(oldp+79,(vlSelf->io_inst),32);
        tracep->fullQData(oldp+80,(vlSelf->io_IF_pc),64);
        tracep->fullQData(oldp+82,(vlSelf->io_ALUResult),64);
        tracep->fullQData(oldp+84,(((2U == (IData)(vlSelf->top__DOT__inst_decode_unit__DOT___GEN_0))
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
        tracep->fullCData(oldp+86,((0x1fU & (vlSelf->io_inst 
                                             >> 7U))),5);
    }
}
