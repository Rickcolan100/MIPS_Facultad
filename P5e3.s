        .data
base:   .double 5.85
altura: .double 13.47
div:    .double 2.0
sup:    .double 0.0

        .code
        l.d f1, base(r0)
        l.d f2, altura(r0)
        l.d f3, div(r0)
        mul.d f4, f1, f2 #Multiplica base x altura
        nop
        div.d f5, f4, f3 #Divide el resultado en f4 con 2
        nop
        s.d f6, sup(r0)  #Almacena el resultado
        halt