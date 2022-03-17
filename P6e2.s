          .data
INGRESO:  .asciiz "Ingrese un numero:"
CERO:     .asciiz "Cero"
UNO:      .asciiz "Uno"
DOS:      .asciiz "Dos"
TRES:     .asciiz "Tres"
CUATRO:   .asciiz "Cuatro"
CINCO:    .asciiz "Cinco"
SEIS:     .asciiz "Seis"
SIETE:    .asciiz "Siete"
OCHO:     .asciiz "Ocho"
NUEVE:    .asciiz "Nueve"
Control:  .word32 0x10000
Data:     .word32 0x10008

          .code
          lwu     $s7, Data(r0)
          daddi   $t0, $zero, INGRESO
          sd      $t0, 0($s7)
          lwu     $s6, Control(r0)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          daddi   $sp, $zero, 0x400
          jal     Ingreso
          j Final
Final:    halt

Ingreso:  daddi   $sp, $sp, -16
          sd      $ra, 0($sp)
          sd      $s0, 8($sp)
          sd      $s1, 16($sp)
Loop:     daddi   $t0, $0, 8
          sd      $t0, 0($s6)
          ld      $s2, 0($s7)
          daddi   $t1, $zero, 0
          daddi   $t2, $zero, 1
          slti    $t1, $s2, 0
          beq     $t1, $t2, Loop
          slti    $t1, $s2, 10
          bnez    $t1, $zero, Loop
          jal     Muestra
          ld      $ra, 0($sp)
          ld      $s0, 8($sp)
          ld      $s1, 16($sp)
          daddi   $sp, $sp, 16
          j       $ra

Muestra:  daddi   $t1, $zero, 1
          daddi   $t2, $zero, 2
          daddi   $t3, $zero, 3
          daddi   $t4, $zero, 4
          daddi   $t5, $zero, 5
          daddi   $t6, $zero, 6
          daddi   $t7, $zero, 7
          daddi   $t8, $zero, 8
          daddi   $t9, $zero, 9
          beq     $s2, $zero, Muestra0
          beq     $s2, $t1, Muestra1
          beq     $s2, $t2, Muestra2
          beq     $s2, $t3, Muestra3
          beq     $s2, $t4, Muestra4
          beq     $s2, $t5, Muestra5
          beq     $s2, $t6, Muestra6
          beq     $s2, $t7, Muestra7
          beq     $s2, $t8, Muestra8
          beq     $s2, $t9, Muestra9
Muestra0: daddi   $t0, $zero, CERO
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra1: daddi   $t0, $zero, UNO
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra2: daddi   $t0, $zero, DOS
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra3: daddi   $t0, $zero, TRES
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra4: daddi   $t0, $zero, CUATRO
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra5: daddi   $t0, $zero, CINCO
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra6: daddi   $t0, $zero, SEIS
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra7: daddi   $t0, $zero, SIETE
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra8: daddi   $t0, $zero, OCHO
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Muestra9: daddi   $t0, $zero, NUEVE
          sd      $t0, 0($s7)
          daddi   $t0, $zero, 6
          sd      $t0, 0($s6)
          daddi   $t0, $zero, 4
          sd      $t0, 0($s6)
          j Fin
Fin:      jr      $ra