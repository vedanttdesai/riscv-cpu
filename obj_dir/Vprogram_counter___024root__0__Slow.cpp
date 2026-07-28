// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vprogram_counter.h for the primary calling header

#include "Vprogram_counter__pch.h"

VL_ATTR_COLD void Vprogram_counter___024root___eval_static(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_static\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.__Vtrigprevexpr___TOP__program_counter_tb__DOT__clk__0 
        = vlSelfRef.program_counter_tb__DOT__clk;
    do {
        vlSelfRef.__VactTriggeredAcc[vlSelfRef.__Vi] 
            = vlSelfRef.__VactTriggered[vlSelfRef.__Vi];
        vlSelfRef.__Vi = ((IData)(1U) + vlSelfRef.__Vi);
    } while ((0U >= vlSelfRef.__Vi));
}

VL_ATTR_COLD void Vprogram_counter___024root___eval_final(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_final\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

VL_ATTR_COLD void Vprogram_counter___024root___eval_settle(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_settle\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}

bool Vprogram_counter___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in);

#ifdef VL_DEBUG
VL_ATTR_COLD void Vprogram_counter___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___dump_triggers__act\n"); );
    // Body
    if ((1U & (~ (IData)(Vprogram_counter___024root___trigger_anySet__act(triggers))))) {
        VL_DBG_MSGS("         No '" + tag + "' region triggers active\n");
    }
    if ((1U & (IData)(triggers[0U]))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 0 is active: @(posedge program_counter_tb.clk)\n");
    }
    if ((1U & (IData)((triggers[0U] >> 1U)))) {
        VL_DBG_MSGS("         '" + tag + "' region trigger index 1 is active: @([true] __VdlySched.awaitingCurrentTime())\n");
    }
}
#endif  // VL_DEBUG

VL_ATTR_COLD void Vprogram_counter___024root___ctor_var_reset(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___ctor_var_reset\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    const uint64_t __VscopeHash = VL_MURMUR64_HASH(vlSelf->vlNamep);
    vlSelf->program_counter_tb__DOT__clk = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 161337692332724392ull);
    vlSelf->program_counter_tb__DOT__rst = VL_SCOPED_RAND_RESET_I(1, __VscopeHash, 7186402120935706221ull);
    vlSelf->program_counter_tb__DOT__next_pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 18337599090516788490ull);
    vlSelf->program_counter_tb__DOT__pc = VL_SCOPED_RAND_RESET_I(32, __VscopeHash, 6854694105034424284ull);
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggered[__Vi0] = 0;
    }
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VactTriggeredAcc[__Vi0] = 0;
    }
    vlSelf->__Vtrigprevexpr___TOP__program_counter_tb__DOT__clk__0 = 0;
    for (int __Vi0 = 0; __Vi0 < 1; ++__Vi0) {
        vlSelf->__VnbaTriggered[__Vi0] = 0;
    }
    vlSelf->__Vi = 0;
}
