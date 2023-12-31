/*
 * User : $%U%$
 * Date : $%Y%$-$%M%$-$%D%$ $%h%$-$%m%$-$%s%$
 * */

// I'm too LAZY
#include<bits/stdc++.h>
using namespace std;

#define mkp make_pair
#define True true
#define False false
typedef long long i64;
typedef vector<int> vint;
typedef vector<i64> vi64;

template <class T>
void in_vec(std::vector<T> &v, int siz)
{
    v.clear();
    T x;
    while (siz--)
        cin >> x, v.push_back(x);
}

template <class T>
void to_siz(std::vector<T> &v, int siz)
{
    v.clear();
    v = std::vector<T>(siz, 0);
}

#ifdef debug_rickyxrc
#include "/home/ricky/oi/debugger.h"
#else
#define info
#endif

int T;
void solve();

int main() {
#ifdef debug_rickyxrc
    ios::sync_with_stdio(false);
    rickyxrc::debugger::show_info();
#endif
    cin >> T;
#ifdef debug_rickyxrc
    int __total_test = T, __now_test = 0;
#endif
    while(T--) {
#ifdef debug_rickyxrc
        __now_test++;
        to_err << rickyxrc::colors::INFO << "[INFO  ] Testcase " << __now_test << " / " << __total_test << rickyxrc::colors::RESET << endl;
#endif
        solve();
    }
    return 0;
}

// Below is code

