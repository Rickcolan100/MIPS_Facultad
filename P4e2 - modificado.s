   .data
A: .word  1
B: .word  2
   .code
   ld     r1, A(r0)
   sd     r2, B(r0)
   halt