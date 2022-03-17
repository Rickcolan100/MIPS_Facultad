         .data
coorX:   .byte 24 ; coordenada X de un punto
coorY:   .byte 24 ; coordenada Y de un punto
color:   .byte 255, 0, 255, 0 ; color: m�ximo rojo + m�ximo azul => magenta
CONTROL: .word32 0x10000
DATA:    .word32 0x10008
         .text
         lwu $s6, CONTROL(r0) ; $s6 = direcci�n de CONTROL
         lwu $s7, DATA(r0) ; $s7 = direcci�n de DATA
         daddi $t0, $0, 7 ; $t0 = 7 -> funci�n 7: limpiar pantalla gr�fica
         sd $t0, 0($s6) ; CONTROL recibe 7 y limpia la pantalla gr�fica
         lbu $s0, coorX(r0) ; $s0 = valor de coordenada X
         sb $s0, 5($s7) ; DATA+5 recibe el valor de coordenada X
         lbu $s1, coorY(r0) ; $s1 = valor de coordenada Y
         sb $s1, 4($s7) ; DATA+4 recibe el valor de coordenada Y
         lwu $s2, color(r0) ; $s2 = valor de color a pintar
         sw $s2, 0($s7) ; DATA recibe el valor del color a pintar
         daddi $t0, $0, 5 ; $t0 = 5 -> funci�n 5: salida gr�fica
         sd $t0, 0($s6) ; CONTROL recibe 5 y produce el dibujo del punto
         halt