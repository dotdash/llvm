; NOTE: Assertions have been autogenerated by utils/update_llc_test_checks.py
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+sse3 | FileCheck %s --check-prefix=SSE
; RUN: llc < %s -mtriple=x86_64-unknown-linux-gnu -mattr=+avx | FileCheck %s --check-prefix=AVX

; Verify that we correctly generate 'addsub' instructions from
; a sequence of vector extracts + float add/sub + vector inserts.

define <4 x float> @test1(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test1:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test1:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 2
  %4 = extractelement <4 x float> %B, i32 2
  %sub2 = fsub float %3, %4
  %5 = extractelement <4 x float> %A, i32 1
  %6 = extractelement <4 x float> %B, i32 1
  %add = fadd float %5, %6
  %7 = extractelement <4 x float> %A, i32 3
  %8 = extractelement <4 x float> %B, i32 3
  %add2 = fadd float %7, %8
  %vecinsert1 = insertelement <4 x float> undef, float %add, i32 1
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add2, i32 3
  %vecinsert3 = insertelement <4 x float> %vecinsert2, float %sub, i32 0
  %vecinsert4 = insertelement <4 x float> %vecinsert3, float %sub2, i32 2
  ret <4 x float> %vecinsert4
}

define <4 x float> @test2(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test2:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test2:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 2
  %2 = extractelement <4 x float> %B, i32 2
  %sub2 = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 3
  %4 = extractelement <4 x float> %B, i32 3
  %add2 = fadd float %3, %4
  %vecinsert1 = insertelement <4 x float> undef, float %sub2, i32 2
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add2, i32 3
  ret <4 x float> %vecinsert2
}

define <4 x float> @test3(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test3:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test3:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 3
  %4 = extractelement <4 x float> %B, i32 3
  %add = fadd float %4, %3
  %vecinsert1 = insertelement <4 x float> undef, float %sub, i32 0
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add, i32 3
  ret <4 x float> %vecinsert2
}

define <4 x float> @test4(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test4:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test4:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 2
  %2 = extractelement <4 x float> %B, i32 2
  %sub = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 1
  %4 = extractelement <4 x float> %B, i32 1
  %add = fadd float %3, %4
  %vecinsert1 = insertelement <4 x float> undef, float %sub, i32 2
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add, i32 1
  ret <4 x float> %vecinsert2
}

define <4 x float> @test5(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test5:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test5:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub2 = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 1
  %4 = extractelement <4 x float> %B, i32 1
  %add2 = fadd float %3, %4
  %vecinsert1 = insertelement <4 x float> undef, float %sub2, i32 0
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add2, i32 1
  ret <4 x float> %vecinsert2
}

define <4 x float> @test6(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test6:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test6:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 2
  %4 = extractelement <4 x float> %B, i32 2
  %sub2 = fsub float %3, %4
  %5 = extractelement <4 x float> %A, i32 1
  %6 = extractelement <4 x float> %B, i32 1
  %add = fadd float %5, %6
  %7 = extractelement <4 x float> %A, i32 3
  %8 = extractelement <4 x float> %B, i32 3
  %add2 = fadd float %7, %8
  %vecinsert1 = insertelement <4 x float> undef, float %add, i32 1
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add2, i32 3
  %vecinsert3 = insertelement <4 x float> %vecinsert2, float %sub, i32 0
  %vecinsert4 = insertelement <4 x float> %vecinsert3, float %sub2, i32 2
  ret <4 x float> %vecinsert4
}

define <4 x double> @test7(<4 x double> %A, <4 x double> %B) {
; SSE-LABEL: test7:
; SSE:       # BB#0:
; SSE-NEXT:    addsubpd %xmm2, %xmm0
; SSE-NEXT:    addsubpd %xmm3, %xmm1
; SSE-NEXT:    retq
;
; AVX-LABEL: test7:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubpd %ymm1, %ymm0, %ymm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x double> %A, i32 0
  %2 = extractelement <4 x double> %B, i32 0
  %sub = fsub double %1, %2
  %3 = extractelement <4 x double> %A, i32 2
  %4 = extractelement <4 x double> %B, i32 2
  %sub2 = fsub double %3, %4
  %5 = extractelement <4 x double> %A, i32 1
  %6 = extractelement <4 x double> %B, i32 1
  %add = fadd double %5, %6
  %7 = extractelement <4 x double> %A, i32 3
  %8 = extractelement <4 x double> %B, i32 3
  %add2 = fadd double %7, %8
  %vecinsert1 = insertelement <4 x double> undef, double %add, i32 1
  %vecinsert2 = insertelement <4 x double> %vecinsert1, double %add2, i32 3
  %vecinsert3 = insertelement <4 x double> %vecinsert2, double %sub, i32 0
  %vecinsert4 = insertelement <4 x double> %vecinsert3, double %sub2, i32 2
  ret <4 x double> %vecinsert4
}

define <2 x double> @test8(<2 x double> %A, <2 x double> %B) {
; SSE-LABEL: test8:
; SSE:       # BB#0:
; SSE-NEXT:    addsubpd %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test8:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubpd %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <2 x double> %A, i32 0
  %2 = extractelement <2 x double> %B, i32 0
  %sub = fsub double %1, %2
  %3 = extractelement <2 x double> %A, i32 1
  %4 = extractelement <2 x double> %B, i32 1
  %add = fadd double %3, %4
  %vecinsert1 = insertelement <2 x double> undef, double %sub, i32 0
  %vecinsert2 = insertelement <2 x double> %vecinsert1, double %add, i32 1
  ret <2 x double> %vecinsert2
}

define <8 x float> @test9(<8 x float> %A, <8 x float> %B) {
; SSE-LABEL: test9:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm2, %xmm0
; SSE-NEXT:    addsubps %xmm3, %xmm1
; SSE-NEXT:    retq
;
; AVX-LABEL: test9:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %ymm1, %ymm0, %ymm0
; AVX-NEXT:    retq
  %1 = extractelement <8 x float> %A, i32 0
  %2 = extractelement <8 x float> %B, i32 0
  %sub = fsub float %1, %2
  %3 = extractelement <8 x float> %A, i32 2
  %4 = extractelement <8 x float> %B, i32 2
  %sub2 = fsub float %3, %4
  %5 = extractelement <8 x float> %A, i32 1
  %6 = extractelement <8 x float> %B, i32 1
  %add = fadd float %5, %6
  %7 = extractelement <8 x float> %A, i32 3
  %8 = extractelement <8 x float> %B, i32 3
  %add2 = fadd float %7, %8
  %9 = extractelement <8 x float> %A, i32 4
  %10 = extractelement <8 x float> %B, i32 4
  %sub3 = fsub float %9, %10
  %11 = extractelement <8 x float> %A, i32 6
  %12 = extractelement <8 x float> %B, i32 6
  %sub4 = fsub float %11, %12
  %13 = extractelement <8 x float> %A, i32 5
  %14 = extractelement <8 x float> %B, i32 5
  %add3 = fadd float %13, %14
  %15 = extractelement <8 x float> %A, i32 7
  %16 = extractelement <8 x float> %B, i32 7
  %add4 = fadd float %15, %16
  %vecinsert1 = insertelement <8 x float> undef, float %add, i32 1
  %vecinsert2 = insertelement <8 x float> %vecinsert1, float %add2, i32 3
  %vecinsert3 = insertelement <8 x float> %vecinsert2, float %sub, i32 0
  %vecinsert4 = insertelement <8 x float> %vecinsert3, float %sub2, i32 2
  %vecinsert5 = insertelement <8 x float> %vecinsert4, float %add3, i32 5
  %vecinsert6 = insertelement <8 x float> %vecinsert5, float %add4, i32 7
  %vecinsert7 = insertelement <8 x float> %vecinsert6, float %sub3, i32 4
  %vecinsert8 = insertelement <8 x float> %vecinsert7, float %sub4, i32 6
  ret <8 x float> %vecinsert8
}

; Verify that we don't generate addsub instruction for the following
; functions.

define <4 x float> @test10(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test10:
; SSE:       # BB#0:
; SSE-NEXT:    subss %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test10:
; AVX:       # BB#0:
; AVX-NEXT:    vsubss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub = fsub float %1, %2
  %vecinsert1 = insertelement <4 x float> undef, float %sub, i32 0
  ret <4 x float> %vecinsert1
}

define <4 x float> @test11(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test11:
; SSE:       # BB#0:
; SSE-NEXT:    shufpd {{.*#+}} xmm0 = xmm0[1,0]
; SSE-NEXT:    shufpd {{.*#+}} xmm1 = xmm1[1,0]
; SSE-NEXT:    subss %xmm1, %xmm0
; SSE-NEXT:    movddup {{.*#+}} xmm0 = xmm0[0,0]
; SSE-NEXT:    retq
;
; AVX-LABEL: test11:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilpd {{.*#+}} xmm0 = xmm0[1,0]
; AVX-NEXT:    vpermilpd {{.*#+}} xmm1 = xmm1[1,0]
; AVX-NEXT:    vsubss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vmovddup {{.*#+}} xmm0 = xmm0[0,0]
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 2
  %2 = extractelement <4 x float> %B, i32 2
  %sub = fsub float %1, %2
  %vecinsert1 = insertelement <4 x float> undef, float %sub, i32 2
  ret <4 x float> %vecinsert1
}

define <4 x float> @test12(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test12:
; SSE:       # BB#0:
; SSE-NEXT:    movshdup {{.*#+}} xmm0 = xmm0[1,1,3,3]
; SSE-NEXT:    movshdup {{.*#+}} xmm1 = xmm1[1,1,3,3]
; SSE-NEXT:    addss %xmm0, %xmm1
; SSE-NEXT:    movsldup {{.*#+}} xmm0 = xmm1[0,0,2,2]
; SSE-NEXT:    retq
;
; AVX-LABEL: test12:
; AVX:       # BB#0:
; AVX-NEXT:    vmovshdup {{.*#+}} xmm0 = xmm0[1,1,3,3]
; AVX-NEXT:    vmovshdup {{.*#+}} xmm1 = xmm1[1,1,3,3]
; AVX-NEXT:    vaddss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vmovsldup {{.*#+}} xmm0 = xmm0[0,0,2,2]
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 1
  %2 = extractelement <4 x float> %B, i32 1
  %add = fadd float %1, %2
  %vecinsert1 = insertelement <4 x float> undef, float %add, i32 1
  ret <4 x float> %vecinsert1
}

define <4 x float> @test13(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test13:
; SSE:       # BB#0:
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,1,2,3]
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[3,1,2,3]
; SSE-NEXT:    addss %xmm0, %xmm1
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[0,1,2,0]
; SSE-NEXT:    movaps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test13:
; AVX:       # BB#0:
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[3,1,2,3]
; AVX-NEXT:    vpermilps {{.*#+}} xmm1 = xmm1[3,1,2,3]
; AVX-NEXT:    vaddss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[0,1,2,0]
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 3
  %2 = extractelement <4 x float> %B, i32 3
  %add = fadd float %1, %2
  %vecinsert1 = insertelement <4 x float> undef, float %add, i32 3
  ret <4 x float> %vecinsert1
}

define <4 x float> @test14(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test14:
; SSE:       # BB#0:
; SSE-NEXT:    movaps %xmm0, %xmm2
; SSE-NEXT:    subss %xmm1, %xmm2
; SSE-NEXT:    shufpd {{.*#+}} xmm0 = xmm0[1,0]
; SSE-NEXT:    shufpd {{.*#+}} xmm1 = xmm1[1,0]
; SSE-NEXT:    subss %xmm1, %xmm0
; SSE-NEXT:    unpcklps {{.*#+}} xmm2 = xmm2[0],xmm0[0],xmm2[1],xmm0[1]
; SSE-NEXT:    shufps {{.*#+}} xmm2 = xmm2[0,1,1,3]
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test14:
; AVX:       # BB#0:
; AVX-NEXT:    vsubss %xmm1, %xmm0, %xmm2
; AVX-NEXT:    vpermilpd {{.*#+}} xmm0 = xmm0[1,0]
; AVX-NEXT:    vpermilpd {{.*#+}} xmm1 = xmm1[1,0]
; AVX-NEXT:    vsubss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm2[0,1],xmm0[0],xmm2[3]
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub = fsub float %1, %2
  %3 = extractelement <4 x float> %A, i32 2
  %4 = extractelement <4 x float> %B, i32 2
  %sub2 = fsub float %3, %4
  %vecinsert1 = insertelement <4 x float> undef, float %sub, i32 0
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %sub2, i32 2
  ret <4 x float> %vecinsert2
}

define <4 x float> @test15(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test15:
; SSE:       # BB#0:
; SSE-NEXT:    movshdup {{.*#+}} xmm3 = xmm0[1,1,3,3]
; SSE-NEXT:    movshdup {{.*#+}} xmm2 = xmm1[1,1,3,3]
; SSE-NEXT:    addss %xmm3, %xmm2
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,1,2,3]
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[3,1,2,3]
; SSE-NEXT:    addss %xmm0, %xmm1
; SSE-NEXT:    unpcklps {{.*#+}} xmm2 = xmm2[0],xmm1[0],xmm2[1],xmm1[1]
; SSE-NEXT:    shufps {{.*#+}} xmm2 = xmm2[0,0,2,1]
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test15:
; AVX:       # BB#0:
; AVX-NEXT:    vmovshdup {{.*#+}} xmm2 = xmm0[1,1,3,3]
; AVX-NEXT:    vmovshdup {{.*#+}} xmm3 = xmm1[1,1,3,3]
; AVX-NEXT:    vaddss %xmm3, %xmm2, %xmm2
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[3,1,2,3]
; AVX-NEXT:    vpermilps {{.*#+}} xmm1 = xmm1[3,1,2,3]
; AVX-NEXT:    vaddss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vinsertps {{.*#+}} xmm1 = xmm0[0],xmm2[0],xmm0[2,3]
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm1[0,1,2],xmm0[0]
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 1
  %2 = extractelement <4 x float> %B, i32 1
  %add = fadd float %1, %2
  %3 = extractelement <4 x float> %A, i32 3
  %4 = extractelement <4 x float> %B, i32 3
  %add2 = fadd float %3, %4
  %vecinsert1 = insertelement <4 x float> undef, float %add, i32 1
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add2, i32 3
  ret <4 x float> %vecinsert2
}

define <4 x float> @test16(<4 x float> %A, <4 x float> %B) {
; SSE-LABEL: test16:
; SSE:       # BB#0:
; SSE-NEXT:    movaps %xmm0, %xmm2
; SSE-NEXT:    subss %xmm0, %xmm2
; SSE-NEXT:    movaps %xmm0, %xmm3
; SSE-NEXT:    shufpd {{.*#+}} xmm3 = xmm3[1,0]
; SSE-NEXT:    movapd %xmm1, %xmm4
; SSE-NEXT:    shufpd {{.*#+}} xmm4 = xmm4[1,0]
; SSE-NEXT:    subss %xmm4, %xmm3
; SSE-NEXT:    movshdup {{.*#+}} xmm4 = xmm0[1,1,3,3]
; SSE-NEXT:    addss %xmm0, %xmm4
; SSE-NEXT:    shufps {{.*#+}} xmm0 = xmm0[3,1,2,3]
; SSE-NEXT:    shufps {{.*#+}} xmm1 = xmm1[3,1,2,3]
; SSE-NEXT:    addss %xmm0, %xmm1
; SSE-NEXT:    unpcklps {{.*#+}} xmm4 = xmm4[0],xmm1[0],xmm4[1],xmm1[1]
; SSE-NEXT:    unpcklps {{.*#+}} xmm2 = xmm2[0],xmm3[0],xmm2[1],xmm3[1]
; SSE-NEXT:    unpcklps {{.*#+}} xmm2 = xmm2[0],xmm4[0],xmm2[1],xmm4[1]
; SSE-NEXT:    movaps %xmm2, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test16:
; AVX:       # BB#0:
; AVX-NEXT:    vsubss %xmm0, %xmm0, %xmm2
; AVX-NEXT:    vpermilpd {{.*#+}} xmm3 = xmm0[1,0]
; AVX-NEXT:    vpermilpd {{.*#+}} xmm4 = xmm1[1,0]
; AVX-NEXT:    vsubss %xmm4, %xmm3, %xmm3
; AVX-NEXT:    vmovshdup {{.*#+}} xmm4 = xmm0[1,1,3,3]
; AVX-NEXT:    vaddss %xmm0, %xmm4, %xmm4
; AVX-NEXT:    vpermilps {{.*#+}} xmm0 = xmm0[3,1,2,3]
; AVX-NEXT:    vpermilps {{.*#+}} xmm1 = xmm1[3,1,2,3]
; AVX-NEXT:    vaddss %xmm1, %xmm0, %xmm0
; AVX-NEXT:    vinsertps {{.*#+}} xmm1 = xmm2[0],xmm4[0],xmm2[2,3]
; AVX-NEXT:    vinsertps {{.*#+}} xmm1 = xmm1[0,1],xmm3[0],xmm1[3]
; AVX-NEXT:    vinsertps {{.*#+}} xmm0 = xmm1[0,1,2],xmm0[0]
; AVX-NEXT:    retq
  %1 = extractelement <4 x float> %A, i32 0
  %2 = extractelement <4 x float> %B, i32 0
  %sub = fsub float %1, undef
  %3 = extractelement <4 x float> %A, i32 2
  %4 = extractelement <4 x float> %B, i32 2
  %sub2 = fsub float %3, %4
  %5 = extractelement <4 x float> %A, i32 1
  %6 = extractelement <4 x float> %B, i32 1
  %add = fadd float %5, undef
  %7 = extractelement <4 x float> %A, i32 3
  %8 = extractelement <4 x float> %B, i32 3
  %add2 = fadd float %7, %8
  %vecinsert1 = insertelement <4 x float> undef, float %add, i32 1
  %vecinsert2 = insertelement <4 x float> %vecinsert1, float %add2, i32 3
  %vecinsert3 = insertelement <4 x float> %vecinsert2, float %sub, i32 0
  %vecinsert4 = insertelement <4 x float> %vecinsert3, float %sub2, i32 2
  ret <4 x float> %vecinsert4
}

define <2 x float> @test_v2f32(<2 x float> %v0, <2 x float> %v1) {
; SSE-LABEL: test_v2f32:
; SSE:       # BB#0:
; SSE-NEXT:    addsubps %xmm1, %xmm0
; SSE-NEXT:    retq
;
; AVX-LABEL: test_v2f32:
; AVX:       # BB#0:
; AVX-NEXT:    vaddsubps %xmm1, %xmm0, %xmm0
; AVX-NEXT:    retq
  %v2 = extractelement <2 x float> %v0, i32 0
  %v3 = extractelement <2 x float> %v1, i32 0
  %v4 = extractelement <2 x float> %v0, i32 1
  %v5 = extractelement <2 x float> %v1, i32 1
  %sub = fsub float %v2, %v3
  %add = fadd float %v5, %v4
  %res0 = insertelement <2 x float> undef, float %sub, i32 0
  %res1 = insertelement <2 x float> %res0, float %add, i32 1
  ret <2 x float> %res1
}
