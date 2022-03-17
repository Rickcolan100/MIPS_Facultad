             .data
num:         .word 5   
tabla:       .word 1, 3, 2, 7, 10, 6.
canttabla:   .word 6
result:      .word 0

             .code
             ld    $a0, num($zero)
             ld    $a1, tabla($zero)
             ld    $a2, canttabla($zero)
             jal   Mayor_que_n
             sd    result, $t3($zero)
             halt                           

Mayor_que_n: dadd  $v0, $zero, $zero
             dadd  $v1, $zero, 1
       loop: dsubu $v0, $a1, $a0
             slt   $t2, $v0, $a0
             beq   $v0, $v1, pos
             beq   $v0, $zero, sig
        sig: daddi $a1, $a1, 8
             dsubu $a2, $a2, -1
             beq   $a1, $a2, fin
             j     loop
        
        fin: jr    $ra
        
        pos: daddi $t3, $t1, $zero
             j     sig
       