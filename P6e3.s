         .data
Control: .word32 0x10000
Data:    .word32 0x10008
Ingre1:  .asciiz "Ingrese el primer numero:"
Ingre2:  .asciiz "Ingrese el segundo numero:"
Result:  .asciiz "Resultado:"
    
         .code
         lwu    $s0, Control(r0)
         lwu    $s1, Data(r0)
         daddi  $sp, $zero, 0x400
         jal Ingreso
         halt

Ingreso: daddi   $sp, $sp, -16
         sd      $ra, 0($sp)
         sd      $s5, 8($sp)
         sd      $s6, 16($sp)         
         daddi   $t0, $zero, Ingre1
         sd      $t0, 0($s1)
         daddi   $t0, $zero, 4
         sd      $t0, 0($s0)
Loop:    daddi   $t0, $zero, 8
         sd      $t0, 0($s0)
         ld      $s2, 0($s1)
         daddi   $t1, $zero, 0
         daddi   $t2, $zero, 1
         slti    $t1, $s2, 0
         beq     $t1, $t2, Loop
         slti    $t1, $s2, 0x00000a
         bnez    $t1, Loop
         daddi   $t0, $zero, 6
         sd      $t0, 0($s0)
         daddi   $t0, $zero, Ingre2
         sd      $t0, 0($s1)
         daddi   $t0, $zero, 4
         sd      $t0, 0($s0)
LoopDos: daddi   $t0, $zero, 8
         sd      $t0, 0($s0)
         ld      $s3, 0($s1)
         daddi   $t3, $zero, 0
         daddi   $t4, $zero, 1
         slti    $t3, $s3, 0
         beq     $t3, $t4, LoopDos
         slti    $t3, $s3, 0x00000a
         bnez    $t3, LoopDos
         daddi   $t0, $zero, 6
         sd      $t0, 0($s0)
         jal Muestra
         ld      $ra, 0($sp)
         ld      $s5, 8($sp)
         ld      $s6, 16($sp)
         daddi   $sp, $sp, 16
         jr      $ra

Muestra: daddi   $t0, $zero, 6
         sd      $t0, 0($s0)
         dadd    $s4, $s2, $s3         
         daddi   $t0, $zero, Result
         sd      $t0, 0($s1)
         daddi   $t0, $zero, 4
         sd      $t0, 0($s0)
         dadd    $t0, $zero, $s4
         sd      $t0, 0($s1)
         daddi   $t0, $zero, 1
         sd      $t0, 0($s0)
         jr      $ra