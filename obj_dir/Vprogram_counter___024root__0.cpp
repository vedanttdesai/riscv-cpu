// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vprogram_counter.h for the primary calling header

#include "Vprogram_counter__pch.h"

VlCoroutine Vprogram_counter___024root___eval_initial__TOP__Vtiming__0(Vprogram_counter___024root* vlSelf);
VlCoroutine Vprogram_counter___024root___eval_initial__TOP__Vtiming__1(Vprogram_counter___024root* vlSelf);

void Vprogram_counter___024root___eval_initial(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_initial\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    Vprogram_counter___024root___eval_initial__TOP__Vtiming__0(vlSelf);
    Vprogram_counter___024root___eval_initial__TOP__Vtiming__1(vlSelf);
}

VlCoroutine Vprogram_counter___024root___eval_initial__TOP__Vtiming__0(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_initial__TOP__Vtiming__0\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    vlSelfRef.program_counter_tb__DOT__clk = 0U;
    vlSelfRef.program_counter_tb__DOT__rst = 1U;
    vlSelfRef.program_counter_tb__DOT__next_pc = 0U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "tb/program_counter_tb.sv", 
                                         24);
    if (VL_UNLIKELY(((0U != vlSelfRef.program_counter_tb__DOT__pc)))) {
        VL_WRITEF_NX("[%0t] %%Fatal: program_counter_tb.sv:25: Assertion failed in %m\n",3, 'M',vlSymsp->name(),"program_counter_tb", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1000));
        VL_STOP_MT("tb/program_counter_tb.sv", 25, "", false);
    }
    vlSelfRef.program_counter_tb__DOT__rst = 0U;
    vlSelfRef.program_counter_tb__DOT__next_pc = 4U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "tb/program_counter_tb.sv", 
                                         30);
    if (VL_UNLIKELY(((4U != vlSelfRef.program_counter_tb__DOT__pc)))) {
        VL_WRITEF_NX("[%0t] %%Fatal: program_counter_tb.sv:31: Assertion failed in %m\n",3, 'M',vlSymsp->name(),"program_counter_tb", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1000));
        VL_STOP_MT("tb/program_counter_tb.sv", 31, "", false);
    }
    vlSelfRef.program_counter_tb__DOT__next_pc = 8U;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "tb/program_counter_tb.sv", 
                                         34);
    if (VL_UNLIKELY(((8U != vlSelfRef.program_counter_tb__DOT__pc)))) {
        VL_WRITEF_NX("[%0t] %%Fatal: program_counter_tb.sv:35: Assertion failed in %m\n",3, 'M',vlSymsp->name(),"program_counter_tb", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1000));
        VL_STOP_MT("tb/program_counter_tb.sv", 35, "", false);
    }
    vlSelfRef.program_counter_tb__DOT__next_pc = 0x0000000cU;
    co_await vlSelfRef.__VdlySched.delay(0x0000000000002710ULL, 
                                         nullptr, "tb/program_counter_tb.sv", 
                                         38);
    if (VL_UNLIKELY(((0x0000000cU != vlSelfRef.program_counter_tb__DOT__pc)))) {
        VL_WRITEF_NX("[%0t] %%Fatal: program_counter_tb.sv:39: Assertion failed in %m\n",3, 'M',vlSymsp->name(),"program_counter_tb", 'T',-9
                     , '#',64,VL_TIME_UNITED_Q(1000));
        VL_STOP_MT("tb/program_counter_tb.sv", 39, "", false);
    }
    VL_WRITEF_NX("PASS: Program Counter\n",0);
    VL_FINISH_MT("tb/program_counter_tb.sv", 42, "");
    co_return;
}

VlCoroutine Vprogram_counter___024root___eval_initial__TOP__Vtiming__1(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_initial__TOP__Vtiming__1\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Body
    while (VL_LIKELY(!vlSymsp->_vm_contextp__->gotFinish())) {
        co_await vlSelfRef.__VdlySched.delay(0x0000000000001388ULL, 
                                             nullptr, 
                                             "tb/program_counter_tb.sv", 
                                             17);
        vlSelfRef.program_counter_tb__DOT__clk = (1U 
                                                  & (~ (IData)(vlSelfRef.program_counter_tb__DOT__clk)));
    }
    co_return;
}

bool Vprogram_counter___024root___trigger_anySet__act(const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___trigger_anySet__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        if (in[n]) {
            return (1U);
        }
        n = ((IData)(1U) + n);
    } while ((1U > n));
    return (0U);
}

void Vprogram_counter___024root___trigger_orInto__act_vec_vec(VlUnpacked<QData/*63:0*/, 1> &out, const VlUnpacked<QData/*63:0*/, 1> &in) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___trigger_orInto__act_vec_vec\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = (out[n] | in[n]);
        n = ((IData)(1U) + n);
    } while ((0U >= n));
}

#ifdef VL_DEBUG
VL_ATTR_COLD void Vprogram_counter___024root___dump_triggers__act(const VlUnpacked<QData/*63:0*/, 1> &triggers, const std::string &tag);
#endif  // VL_DEBUG

bool Vprogram_counter___024root___eval_phase__act(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_phase__act\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VactExecute;
    // Body
    {
        // Inlined CFunc: _eval_triggers_vec__act
        vlSelfRef.__VactTriggered[0U] = (QData)((IData)(
                                                        ((vlSelfRef.__VdlySched.awaitingCurrentTime() 
                                                          << 1U) 
                                                         | ((IData)(vlSelfRef.program_counter_tb__DOT__clk) 
                                                            & (~ (IData)(vlSelfRef.__Vtrigprevexpr___TOP__program_counter_tb__DOT__clk__0))))));
        vlSelfRef.__Vtrigprevexpr___TOP__program_counter_tb__DOT__clk__0 
            = vlSelfRef.program_counter_tb__DOT__clk;
    }
    Vprogram_counter___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VactTriggered, vlSelfRef.__VactTriggeredAcc);
#ifdef VL_DEBUG
    if (VL_UNLIKELY(vlSymsp->_vm_contextp__->debug())) {
        Vprogram_counter___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
    }
#endif
    Vprogram_counter___024root___trigger_orInto__act_vec_vec(vlSelfRef.__VnbaTriggered, vlSelfRef.__VactTriggered);
    __VactExecute = Vprogram_counter___024root___trigger_anySet__act(vlSelfRef.__VactTriggered);
    if (__VactExecute) {
        vlSelfRef.__VactTriggeredAcc.fill(0ULL);
        {
            // Inlined CFunc: _timing_resume
            if ((2ULL & vlSelfRef.__VactTriggered[0U])) {
                vlSelfRef.__VdlySched.resume();
            }
        }
    }
    return (__VactExecute);
}

bool Vprogram_counter___024root___eval_phase__inact(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_phase__inact\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VinactExecute;
    // Body
    __VinactExecute = vlSelfRef.__VdlySched.awaitingZeroDelay();
    if (__VinactExecute) {
        VL_FATAL_MT("tb/program_counter_tb.sv", 3, "", "ZERODLY: Design Verilated with '--no-sched-zero-delay', but #0 delay executed at runtime");
    }
    return (__VinactExecute);
}

void Vprogram_counter___024root___trigger_clear__act(VlUnpacked<QData/*63:0*/, 1> &out) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___trigger_clear__act\n"); );
    // Locals
    IData/*31:0*/ n;
    // Body
    n = 0U;
    do {
        out[n] = 0ULL;
        n = ((IData)(1U) + n);
    } while ((1U > n));
}

bool Vprogram_counter___024root___eval_phase__nba(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_phase__nba\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    CData/*0:0*/ __VnbaExecute;
    // Body
    __VnbaExecute = Vprogram_counter___024root___trigger_anySet__act(vlSelfRef.__VnbaTriggered);
    if (__VnbaExecute) {
        {
            // Inlined CFunc: _eval_nba
            if ((1ULL & vlSelfRef.__VnbaTriggered[0U])) {
                {
                    // Inlined CFunc: _nba_sequent__TOP__0
                    vlSelfRef.program_counter_tb__DOT__pc 
                        = ((IData)(vlSelfRef.program_counter_tb__DOT__rst)
                            ? 0U : vlSelfRef.program_counter_tb__DOT__next_pc);
                }
            }
        }
        Vprogram_counter___024root___trigger_clear__act(vlSelfRef.__VnbaTriggered);
    }
    return (__VnbaExecute);
}

void Vprogram_counter___024root___eval(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
    // Locals
    IData/*31:0*/ __VnbaIterCount;
    // Body
    __VnbaIterCount = 0U;
    do {
        if (VL_UNLIKELY(((0x00002710U < __VnbaIterCount)))) {
#ifdef VL_DEBUG
            Vprogram_counter___024root___dump_triggers__act(vlSelfRef.__VnbaTriggered, "nba"s);
#endif
            VL_FATAL_MT("tb/program_counter_tb.sv", 3, "", "DIDNOTCONVERGE: NBA region did not converge after '--converge-limit' of 10000 tries");
        }
        __VnbaIterCount = ((IData)(1U) + __VnbaIterCount);
        vlSelfRef.__VinactIterCount = 0U;
        do {
            if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VinactIterCount)))) {
                VL_FATAL_MT("tb/program_counter_tb.sv", 3, "", "DIDNOTCONVERGE: Inactive region did not converge after '--converge-limit' of 10000 tries");
            }
            vlSelfRef.__VinactIterCount = ((IData)(1U) 
                                           + vlSelfRef.__VinactIterCount);
            vlSelfRef.__VactIterCount = 0U;
            do {
                if (VL_UNLIKELY(((0x00002710U < vlSelfRef.__VactIterCount)))) {
#ifdef VL_DEBUG
                    Vprogram_counter___024root___dump_triggers__act(vlSelfRef.__VactTriggered, "act"s);
#endif
                    VL_FATAL_MT("tb/program_counter_tb.sv", 3, "", "DIDNOTCONVERGE: Active region did not converge after '--converge-limit' of 10000 tries");
                }
                vlSelfRef.__VactIterCount = ((IData)(1U) 
                                             + vlSelfRef.__VactIterCount);
                vlSelfRef.__VactPhaseResult = Vprogram_counter___024root___eval_phase__act(vlSelf);
            } while (vlSelfRef.__VactPhaseResult);
            vlSelfRef.__VinactPhaseResult = Vprogram_counter___024root___eval_phase__inact(vlSelf);
        } while (vlSelfRef.__VinactPhaseResult);
        vlSelfRef.__VnbaPhaseResult = Vprogram_counter___024root___eval_phase__nba(vlSelf);
    } while (vlSelfRef.__VnbaPhaseResult);
}

#ifdef VL_DEBUG
void Vprogram_counter___024root___eval_debug_assertions(Vprogram_counter___024root* vlSelf) {
    VL_DEBUG_IF(VL_DBG_MSGF("+    Vprogram_counter___024root___eval_debug_assertions\n"); );
    Vprogram_counter__Syms* const __restrict vlSymsp VL_ATTR_UNUSED = vlSelf->vlSymsp;
    auto& vlSelfRef = std::ref(*vlSelf).get();
}
#endif  // VL_DEBUG
