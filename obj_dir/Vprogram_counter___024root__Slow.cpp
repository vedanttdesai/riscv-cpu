// Verilated -*- C++ -*-
// DESCRIPTION: Verilator output: Design implementation internals
// See Vprogram_counter.h for the primary calling header

#include "Vprogram_counter__pch.h"

void Vprogram_counter___024root___ctor_var_reset(Vprogram_counter___024root* vlSelf);

Vprogram_counter___024root::Vprogram_counter___024root(Vprogram_counter__Syms* symsp, const char* namep)
    : __VdlySched{*symsp->_vm_contextp__}
 {
    vlSymsp = symsp;
    vlNamep = strdup(namep);
    // Reset structure values
    Vprogram_counter___024root___ctor_var_reset(this);
}

void Vprogram_counter___024root::__Vconfigure(bool first) {
    (void)first;  // Prevent unused variable warning
}

Vprogram_counter___024root::~Vprogram_counter___024root() {
    VL_DO_DANGLING(std::free(const_cast<char*>(vlNamep)), vlNamep);
}
