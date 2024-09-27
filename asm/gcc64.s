.intel_syntax noprefix
#ifdef __linux__
.section .note.GNU-stack,"",%progbits
#endif
.text

.macro      __ENTER
            push        rbp
            mov         rbp,rsp
            push        rax
            push        rcx
            push        rdx
            push        rbx
            push        rsi
            push        rdi
            pushf
            
            mov         rsi,rdi # System V
            mov         rax,QWORD PTR[rsi+0]
            mov         rcx,QWORD PTR[rsi+8]
            mov         rdx,QWORD PTR[rsi+16]
            mov         rbx,QWORD PTR[rsi+24]
            push        QWORD PTR[rsi+64]
            popf
.endm
            
.macro      __LEAVE
            mov         QWORD PTR[rsi+32],rax
            mov         QWORD PTR[rsi+40],rdx
            mov         QWORD PTR[rsi+48],rcx
            mov         QWORD PTR[rsi+56],rbx
            pushf       
            pop         QWORD PTR[rsi+72]

            popf
            pop         rdi
            pop         rsi
            pop         rbx
            pop         rdx
            pop         rcx
            pop         rax
            mov         rsp,rbp
            pop         rbp
            ret        
.endm
#################################
# ADD
#################################
            .globl	op_add
op_add:
            __ENTER
            add         rax,rcx
            __LEAVE
#################################
# SUB
#################################
            .globl	op_sub
op_sub:
            __ENTER
            sub         rax,rcx
            __LEAVE
#################################
# ADC
#################################
            .globl	op_adc
op_adc:
            __ENTER
            adc         rax,rcx
            __LEAVE
#################################
# SBB
#################################
            .globl	op_sbb
op_sbb:
            __ENTER
            sbb         rax,rcx
            __LEAVE
#################################
# AND
#################################
            .globl	op_and
op_and:
            __ENTER
            and         rax,rcx
            __LEAVE
#################################
# XOR
#################################
            .globl	op_xor
op_xor:
            __ENTER
            xor         rax,rcx
            __LEAVE
#################################
# OR
#################################
            .globl	op_or
op_or:
            __ENTER
            or          rax,rcx
            __LEAVE
#################################
# INC
#################################
            .globl	op_inc
op_inc:
            __ENTER
            inc         rax
            __LEAVE 
#################################
# DEC
#################################
            .globl	op_dec
op_dec:
            __ENTER
            dec         rax
            __LEAVE
#################################
# TEST
#################################
            .globl	op_test
op_test:
            __ENTER
            test        rax,rcx
            __LEAVE
#################################
# CMP
#################################
            .globl	op_cmp
op_cmp:
            __ENTER
            cmp         rax,rcx
            __LEAVE
#################################
# MUL
#################################
            .globl	op_mul
op_mul:
            __ENTER
            mul         rcx
            __LEAVE
#################################
# IMUL
#################################
            .globl	op_imul
op_imul:
            __ENTER
            imul        rcx
            __LEAVE
#################################
# DIV
#################################
            .globl	op_div
op_div:
            __ENTER
            div         rcx
            __LEAVE
#################################
# IDIV
#################################
            .globl	op_idiv
op_idiv:
            __ENTER
            idiv        rcx
            __LEAVE
#################################
# NOT
#################################
            .globl	op_not
op_not:
            __ENTER
            not         rax
            __LEAVE
#################################
# NEG
#################################
            .globl	op_neg
op_neg:
            __ENTER
            neg         rax
            __LEAVE
#################################
# SHR
#################################
            .globl	op_shr
op_shr:
            __ENTER
            shr         rax,cl
            __LEAVE
#################################
# SHL
#################################
            .globl	op_shl
op_shl:
            __ENTER
            shl         rax,cl
            __LEAVE
#################################
# SAR
#################################
            .globl	op_sar
op_sar:
            __ENTER
            sar         rax,cl
            __LEAVE
#################################
# ROL
#################################
            .globl	op_rol
op_rol:
            __ENTER
            rol         rax,cl
            __LEAVE
#################################
# ROR
#################################
            .globl	op_ror
op_ror:
            __ENTER
            ror         rax,cl
            __LEAVE
#################################
# RCL
#################################
            .globl	op_rcl
op_rcl:
            __ENTER
            rcl         rax,cl
            __LEAVE
#################################
# RCR
#################################
            .globl	op_rcr
op_rcr:
            __ENTER
            rcr         rax,cl
            __LEAVE
#################################
# CPUID
#################################
            .globl	op_cpuid
op_cpuid:
            __ENTER
            cpuid
            __LEAVE
#################################
# RDTSC
#################################
            .globl	op_rdtsc
op_rdtsc:
            __ENTER
            rdtsc
            __LEAVE
#################################
# BSWAP
#################################
            .globl	op_bswap
op_bswap:
            __ENTER
            bswap       rax
            __LEAVE
#################################
# BSF
#################################
            .globl	op_bsf
op_bsf:
            __ENTER
            bsf         rax,rcx
            __LEAVE
#################################
# BSR
#################################
            .globl	op_bsr
op_bsr:
            __ENTER
            bsr         rax,rcx
            __LEAVE
#################################
# BT
#################################
            .globl	op_bt
op_bt:
            __ENTER
            bt          rax,rcx
            __LEAVE
#################################
# BTS
#################################
            .globl	op_bts
op_bts:
            __ENTER
            bts         rax,rcx
            __LEAVE
#################################
# BTR
#################################
            .globl	op_btr
op_btr:
            __ENTER
            btr         rax,rcx
            __LEAVE
#################################
# BTC
#################################
            .globl	op_btc
op_btc:
            __ENTER
            btc         rax,rcx
            __LEAVE
#################################
# MOVZX R64,R8
#################################
            .globl	op_movzx_r8
op_movzx_r8:
            __ENTER
            movzx       rax,cl
            __LEAVE
#################################
# MOVZX R64,R16
#################################
            .globl	op_movzx_r16
op_movzx_r16:
            __ENTER
            movzx       rax,cx
            __LEAVE
#################################
# MOVSX R64,R8
#################################
            .globl	op_movsx_r8
op_movsx_r8:
            __ENTER
            movsx       rax,cl
            __LEAVE
#################################
# MOVSX R64,R16
#################################
            .globl	op_movsx_r16
op_movsx_r16:
            __ENTER
            movsx       rax,cx
            __LEAVE
#################################
# XADD
#################################
            .globl	op_xadd
op_xadd:
            __ENTER
            xadd        rax,rcx
            __LEAVE
