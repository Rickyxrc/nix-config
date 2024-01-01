/*
 *  debugger.h
 *      Description
 *          A lightweight debugger written by rickyxrc.
 *      Interface
 *          info() - Print mutiple variable.
 *      Todo
 *          add more color when print variable.
 * */
#warning "You are using debug lib, remember using -D debug_rickyxrc instead of #define debug_rickyxrc"

// comment or uncomment these features to control your own experience

// #define SHOW_TYPE
// print format will like this: "int:3, char:'6', vector<T>(int:1, int:2, int:3)"
#define SHOW_ARG_LIST
// print format will like this: "(a, b, c) = (1, 2, 3)"

// comment part ended.

#include<bits/stdc++.h>
using namespace std;

#define COLRGB(R, G, B) "\e[38;2;" #R ";" #G ";" #B "m"
#define to_err cerr

namespace rickyxrc {
    namespace colors {
        const char
            INFO[]       = COLRGB(76, 185, 231),
            VAR[]        = COLRGB(255, 108, 34),
            VARINT[]     = COLRGB(211, 155, 182),
            VARCHAR[]    = COLRGB(167, 192, 128),
            VARBOOL[]    = COLRGB(230, 129, 131),
            VARTYPE[]    = COLRGB(128, 128, 128),
            RESET[]      = "\033[0m",
            ENDL         = '\n';
    }
    namespace debugger {
        using namespace colors;
        void info(const char* str) {
            to_err << INFO << "[INFO  ] " << str << RESET << ENDL;
        }
        void show_info() {
            info("Debug lib for rickyxrc");
        }

#ifdef SHOW_TYPE
        void show_type(const char* x) {
            to_err << VARTYPE << x << ": " << RESET;
        }
#else
#define show_type
#endif

        // This will BREAK code, DON'T use
        // template <class T> void __var_any(T x) { to_err << x; }
        void __var_any(char x) { show_type("char"); to_err << VARCHAR << "\'" << x << "\'" << RESET; }
        void __var_any(int x) { show_type("int"); to_err << VARINT << x << RESET; }
        void __var_any(i64 x) { show_type("i64"); to_err << VARINT << x << RESET; }
        void __var_any(const char* x) { show_type("char*"); to_err << VARCHAR << "\"" << x << "\"" << RESET; }
        void __var_any(string s) { show_type("string"); to_err << VARCHAR << "\"" << s << "\"" << RESET; }
        template <class T1, class T2>
        void __var_any(std::pair<T1, T2> pii) { show_type("pair<,>"); to_err << "("; __var_any(pii.first); to_err << ", "; __var_any(pii.second); to_err << ")"; }
        template <class T>
        void __var_any(std::vector<T> ve) {
            show_type("vector<>");
            to_err << "[";
            for(auto x:ve)
                __var_any(x), to_err << ", ";
            to_err << "]";
        }
        template <class T>
        void __var_any(std::set<T> ve) {
            show_type("set<>");
            to_err << "{";
            for(auto x:ve)
                __var_any(x), to_err << ", ";
            to_err << "}";
        }
        template <class T1, class T2>
        void __var_any(std::map<T1, T2> ve) {
            show_type("map<,>");
            to_err << "{";
            for(auto x:ve)
                __var_any(x.first), to_err<<" -> ", __var_any(x.second), to_err << ", ";
            to_err << "}";
        }
        void __var_any(bool x) { to_err << VARBOOL << (x ? "True" : "False") << RESET; }

        void __var_args() { to_err << ")" << ENDL; }
        template <class T1, class... T2>
        void __var_args(T1 x, T2... v) {
            __var_any(x);
            if (sizeof... (v)) to_err << ", ";
            __var_args(v...);
        }
        template <class... T2>
        void callinfo(const int lineno, const char* func, const char* arglist, T2... extra) {
            to_err << VAR << "[VAR   ] " << RESET << func << "():" << lineno << ":";
#ifdef SHOW_ARG_LIST
            to_err << " (" << arglist << ") =";
#endif
            to_err << " (";
            __var_args(extra...);
        }
    }
}

#define info(x...) rickyxrc::debugger::callinfo(__LINE__, __func__, #x, x)

