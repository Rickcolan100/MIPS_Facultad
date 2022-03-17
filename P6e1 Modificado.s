          .data
texto:    .asciiz "Ingrese texto"
texto2:   .asciiz ""
CONTROL:  .word32 0x10000
DATA:     .word32 0x10008
          .text
          lwu   $s0, DATA(r0) ; $s0 = dirección de DATA
          daddi $t0, $0, texto ; $t0 = dirección del mensaje a mostrar
          sd    $t0, 0($s0) ; DATA recibe el puntero al comienzo del mensaje          
          lwu   $s1, CONTROL(r0) ; $s1 = dirección de CONTROL
          daddi $t0, $0, 6 ; $t0 = 6 -> función 6: limpiar pantalla alfanumérica
          sd    $t0, 0($s1) ; CONTROL recibe 6 y limpia la pantalla          
          daddi $t0, $0, 4 ; $t0 = 4 -> función 4: salida de una cadena ASCII
          sd    $t0, 0($s1) ; CONTROL recibe 4 y produce la salida del mensaje
          daddi $t1, $t1, 48
          daddi $t6, $zero, 0
          daddi $t2, $zero, 0         
loop:     daddi $t0, $0, 9  ;mueve 9 a $t0
          sd    $t0, 0($s1) ;activa ingresar caracter
          lb    $t3, 0($s0) ;almacena caracter en data
          beq   $t3, $t1, fin ;si el caracter es igual salta a fin
          sb    $t3, texto2($t6) ;almacena caracter
          daddi $t6, $t6, 1      ;cuenta caracter
          j loop
fin:      lwu   $s0, DATA(r0)
          daddi $t5, $0, texto2
          sd    $t5, 0($s0)
          lwu   $s1, CONTROL(r0)
          daddi $t0, $0, 6
          sd    $t0, 0($s1)
          lwu   $s1, CONTROL(r0)
          daddi $t0, $0, 4
          sd    $t0, 0($s1)    
          halt
          
    