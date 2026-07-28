// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design internal header
// See Vprogram_counter.h for the primary calling header

#ifndef VERILATED_VPROGRAM_COUNTER___024ROOT_H_
#define VERILATED_VPROGRAM_COUNTER___024ROOT_H_  // guard

#include "verilated.h"
#include "verilated_timing.h"


class Vprogram_counter__Syms;

class alignas(VL_CACHE_LINE_BYTES) Vprogram_counter___024root final {
  public:

    // DESIGN SPECIFIC STATE
    CData/*0:0*/ program_counter_tb__DOT__clk;
    CData/*0:0*/ program_counter_tb__DOT__rst;
    CData/*0:0*/ __Vtrigprevexpr___TOP__program_counter_tb__DOT__clk__0;
    CData/*0:0*/ __VactPhaseResult;
    CData/*0:0*/ __VinactPhaseResult;
    CData/*0:0*/ __VnbaPhaseResult;
    IData/*31:0*/ program_counter_tb__DOT__next_pc;
    IData/*31:0*/ program_counter_tb__DOT__pc;
    IData/*31:0*/ __VactIterCount;
    IData/*31:0*/ __VinactIterCount;
    IData/*31:0*/ __Vi;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggered;
    VlUnpacked<QData/*63:0*/, 1> __VactTriggeredAcc;
    VlUnpacked<QData/*63:0*/, 1> __VnbaTriggered;
    VlDelayScheduler __VdlySched;

    // INTERNAL VARIABLES
    Vprogram_counter__Syms* vlSymsp;
    const char* vlNamep;

    // CONSTRUCTORS
    Vprogram_counter___024root(Vprogram_counter__Syms* symsp, const char* namep);
    ~Vprogram_counter___024root();
    VL_UNCOPYABLE(Vprogram_counter___024root);

    // INTERNAL METHODS
    void __Vconfigure(bool first);
};


#endif  // guard
