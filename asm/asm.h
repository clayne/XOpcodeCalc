/* Copyright (c) 2019-2024 hors<horsicq@gmail.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */
#include "../global.h"

#ifndef ASM_H
#define ASM_H
#ifdef OPCODE32
typedef unsigned int XVALUE;
typedef int SXVALUE;
#else
typedef unsigned long long XVALUE;
typedef long long SXVALUE;
#endif
struct RECDATA {
    XVALUE OPERAND[4];
    XVALUE RESULT[4];
    XVALUE FLAG[2];
};
#define RECDATA_INIT \
    {                \
        {}, {},      \
        {            \
        }            \
    }
#ifdef Q_OS_OSX
#define XASM(func) asm(func)
#else
#define XASM(func)
#endif

extern "C" void op_add(RECDATA *pRecData) XASM("op_add");
extern "C" void op_sub(RECDATA *pRecData) XASM("op_sub");
extern "C" void op_adc(RECDATA *pRecData) XASM("op_adc");
extern "C" void op_sbb(RECDATA *pRecData) XASM("op_sbb");
extern "C" void op_and(RECDATA *pRecData) XASM("op_and");
extern "C" void op_xor(RECDATA *pRecData) XASM("op_xor");
extern "C" void op_or(RECDATA *pRecData) XASM("op_or");
extern "C" void op_test(RECDATA *pRecData) XASM("op_test");
extern "C" void op_cmp(RECDATA *pRecData) XASM("op_cmp");
extern "C" void op_xadd(RECDATA *pRecData) XASM("op_xadd");
extern "C" void op_movzx_r8(RECDATA *pRecData) XASM("op_movzx_r8");
extern "C" void op_movzx_r16(RECDATA *pRecData) XASM("op_movzx_r16");
extern "C" void op_movsx_r8(RECDATA *pRecData) XASM("op_movsx_r8");
extern "C" void op_movsx_r16(RECDATA *pRecData) XASM("op_movsx_r16");

extern "C" void op_inc(RECDATA *pRecData) XASM("op_inc");
extern "C" void op_dec(RECDATA *pRecData) XASM("op_dec");
extern "C" void op_not(RECDATA *pRecData) XASM("op_not");
extern "C" void op_neg(RECDATA *pRecData) XASM("op_neg");
extern "C" void op_bswap(RECDATA *pRecData) XASM("op_bswap");

extern "C" void op_mul(RECDATA *pRecData) XASM("op_mul");
extern "C" void op_imul(RECDATA *pRecData) XASM("op_imul");
extern "C" void op_div(RECDATA *pRecData) XASM("op_div");
extern "C" void op_idiv(RECDATA *pRecData) XASM("op_idiv");

extern "C" void op_shr(RECDATA *pRecData) XASM("op_shr");
extern "C" void op_shl(RECDATA *pRecData) XASM("op_shl");
extern "C" void op_sar(RECDATA *pRecData) XASM("op_sar");
extern "C" void op_rol(RECDATA *pRecData) XASM("op_rol");
extern "C" void op_ror(RECDATA *pRecData) XASM("op_ror");
extern "C" void op_rcl(RECDATA *pRecData) XASM("op_rcl");
extern "C" void op_rcr(RECDATA *pRecData) XASM("op_rcr");

extern "C" void op_cpuid(RECDATA *pRecData) XASM("op_cpuid");
extern "C" void op_rdtsc(RECDATA *pRecData) XASM("op_rdtsc");

extern "C" void op_bt(RECDATA *pRecData) XASM("op_bt");
extern "C" void op_bsf(RECDATA *pRecData) XASM("op_bsf");
extern "C" void op_bsr(RECDATA *pRecData) XASM("op_bsr");
extern "C" void op_bts(RECDATA *pRecData) XASM("op_bts");
extern "C" void op_btr(RECDATA *pRecData) XASM("op_btr");
extern "C" void op_btc(RECDATA *pRecData) XASM("op_btc");

extern "C" void op_daa(RECDATA *pRecData) XASM("op_daa");
extern "C" void op_das(RECDATA *pRecData) XASM("op_das");
extern "C" void op_aaa(RECDATA *pRecData) XASM("op_aaa");
extern "C" void op_aas(RECDATA *pRecData) XASM("op_aas");
extern "C" void op_aam(RECDATA *pRecData) XASM("op_aam");
extern "C" void op_aad(RECDATA *pRecData) XASM("op_aad");

#endif  // ASM_H
