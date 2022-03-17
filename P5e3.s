       .data
base:  .double 5,85
altura:.double 13,74
div:   .double 2.0
sup:   .double 0.0

       .code
       l.d f1, base(r0)
       l.d f2, altura(r0)
       l.d f3, div(r0)
       mul.d f4, f1, f2
       div.d f5, f4, f3
       s.d f6, sup(f5)
       halt