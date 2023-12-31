/*
 *  debugger.h
 *      Description
 *          A lightweight debugger written by rickyxrc.
 *      Interface
 *          info() - Print mutiple variable.
 *      Todo
 *          add more color when print variable.
 * */
#include<bits/stdc++.h>
using namespace std;

#define COLRGB(R, G, B) "\e[38;2;" #R ";" #G ";" #B "m"
#define to_err cerr

namespace rickyxrc {
    namespace colors {
        const char
            INFO[]  = COLRGB(76, 185, 231),
            VAR[]   = COLRGB(255, 108, 34),
            RESET[] = "\033[0m",
            ENDL    = '\n';
    }
    namespace debugger {
        using namespace colors;
        void info(char* str) {
            to_err << INFO << "[INFO  ] " << str << RESET << ENDL;
        }
        void show_info() {
            info("Debug lib for rickyxrc");
        }

        // This will BREAK code, DON'T use
        // template <class T> void __var_any(T x) { to_err << x; }
        void __var_any(char x) { to_err << "\'" << x << "\'"; }
        void __var_any(int x) { to_err << x; }
        void __var_any(i64 x) { to_err << x; }
        void __var_any(bool x) { to_err << (x ? "True" : "False"); }
        void __var_any(char* x) { to_err << "\"" << x << "\""; }
        void __var_any(string s) { to_err << "\"" << s.c_str() << "\"" ; }
        template <class T1, class T2>
        void __var_any(std::pair<T1, T2> pii) { to_err << "("; __var_any(pii.first); to_err << ", "; __var_any(pii.second); to_err << ")"; }
        template <class T>
        void __var_any(std::vector<T> ve) {
            to_err << "[";
            for(auto x:ve)
                __var_any(x), to_err << ", ";
            to_err << "]";
        }

        void __var_args() { to_err << ")" << RESET << ENDL; }
        template <class T1, class... T2>
        void __var_args(T1 x, T2... v) {
            __var_any(x);
            if (sizeof... (v)) to_err << ", ";
            __var_args(v...);
        }
        template <class... T2>
        void callinfo(const int lineno, const char* func, const char* arglist, T2... extra) {
            to_err << VAR << "[VAR   ] " << func << "():" << lineno << ": (" << arglist << ") = (";
            __var_args(extra...);
        }
    }
}

#define info(x...) rickyxrc::debugger::callinfo(__LINE__, __func__, #x, x)

