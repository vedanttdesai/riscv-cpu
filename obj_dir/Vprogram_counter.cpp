// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Model implementation (design independent parts)

#include "Vprogram_counter__pch.h"

//============================================================
// Constructors

Vprogram_counter::Vprogram_counter(VerilatedContext* _vcontextp__, const char* _vcname__)
    : VerilatedModel{*_vcontextp__}
    , vlSymsp{new Vprogram_counter__Syms(contextp(), _vcname__, this)}
    , rootp{&(vlSymsp->TOP)}
{
    // Register model with the context
    contextp()->addModel(this);
}

Vprogram_counter::Vprogram_counter(const char* _vcname__)
    : Vprogram_counter(Verilated::threadContextp(), _vcname__)
{
}

//============================================================
// Destructor

Vprogram_counter::~Vprogram_counter() {
    delete vlSymsp;
}

//============================================================
// Evaluation function

#ifdef VL_DEBUG
void Vprogram_counter___024root___eval_debug_assertions(Vprogram_counter___024root* vlSelf);
#endif  // VL_DEBUG
void Vprogram_counter___024root___eval_static(Vprogram_counter___024root* vlSelf);
void Vprogram_counter___024root___eval_initial(Vprogram_counter___024root* vlSelf);
void Vprogram_counter___024root___eval_settle(Vprogram_counter___024root* vlSelf);
void Vprogram_counter___024root___eval(Vprogram_counter___024root* vlSelf);

void Vprogram_counter::eval_step() {
    VL_DEBUG_IF(VL_DBG_MSGF("+++++TOP Evaluate Vprogram_counter::eval_step\n"); );
#ifdef VL_DEBUG
    // Debug assertions
    Vprogram_counter___024root___eval_debug_assertions(&(vlSymsp->TOP));
#endif  // VL_DEBUG
    vlSymsp->__Vm_deleter.deleteAll();
    if (VL_UNLIKELY(!vlSymsp->__Vm_didInit)) {
        VL_DEBUG_IF(VL_DBG_MSGF("+ Initial\n"););
        Vprogram_counter___024root___eval_static(&(vlSymsp->TOP));
        Vprogram_counter___024root___eval_initial(&(vlSymsp->TOP));
        Vprogram_counter___024root___eval_settle(&(vlSymsp->TOP));
        vlSymsp->__Vm_didInit = true;
    }
    VL_DEBUG_IF(VL_DBG_MSGF("+ Eval\n"););
    Vprogram_counter___024root___eval(&(vlSymsp->TOP));
    // Evaluate cleanup
    Verilated::endOfEval(vlSymsp->__Vm_evalMsgQp);
}

//============================================================
// Events and timing
bool Vprogram_counter::eventsPending() { return !vlSymsp->TOP.__VdlySched.empty() && !contextp()->gotFinish(); }

uint64_t Vprogram_counter::nextTimeSlot() { return vlSymsp->TOP.__VdlySched.nextTimeSlot(); }

//============================================================
// Utilities

const char* Vprogram_counter::name() const {
    return vlSymsp->name();
}

//============================================================
// Invoke final blocks

void Vprogram_counter___024root___eval_final(Vprogram_counter___024root* vlSelf);

VL_ATTR_COLD void Vprogram_counter::final() {
    contextp()->executingFinal(true);
    Vprogram_counter___024root___eval_final(&(vlSymsp->TOP));
    contextp()->executingFinal(false);
}

//============================================================
// Implementations of abstract methods from VerilatedModel

const char* Vprogram_counter::hierName() const { return vlSymsp->name(); }
const char* Vprogram_counter::modelName() const { return "Vprogram_counter"; }
unsigned Vprogram_counter::threads() const { return 1; }
void Vprogram_counter::prepareClone() const { contextp()->prepareClone(); }
void Vprogram_counter::atClone() const {
    contextp()->threadPoolpOnClone();
}
