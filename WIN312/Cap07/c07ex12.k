MODULE c07ex12 0xFFFFFFFF 0
IMPORT In   0x1d6e8955
IMPORT Out  0x190c339a
IMPORT Calc 0x00000001
ENDHDR

PROC c07ex12.%main 0 0 0

! Escreva "Entre um valor para n: "
CONST 24
GLOBAL c07ex12.%1
GLOBAL Out.String
CALL 2

! Leia n
GLOBAL c07ex12.n
GLOBAL In.Int
CALL 1

! resultado := Calc.Somatorio(n)
LDGW c07ex12.n
GLOBAL Calc.Somatorio
CALLW 1
STGW c07ex12.resultado

! Escreva "Somatorio = "); 
CONST 14
GLOBAL c07ex12.%2
GLOBAL Out.String
CALL 2

! Escreva resultado
CONST 0
LDGW c07ex12.resultado
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex12.n 4
GLOVAR c07ex12.resultado 4

! Texto "Entre um valor para n: "
DEFINE c07ex12.%1
STRING 456E74726520756D2076616C6F722070617261206E3A2000

! Texto "Somatorio = "
DEFINE c07ex12.%2
STRING 536F6D61746F72696F203D2000
