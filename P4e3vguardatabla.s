      .data

A:    .word 1

B:    .word 6

tabla .word 
0      
      
      .code
      
      ld     r1, A(r0)
      
      ld     r2, B(r0)
      
      ld     r3, tabla(r0)
      
      dadd   r4, r0, r0
      dadd   r10, r0, r0
loop: dsll   r1, r1, 1
      
      sd     r3, r1, r0
      daddi  r4, r4, 8      
      dsubu  r10, r3, r2
      
      bnez   r10, loop
      
      halt
