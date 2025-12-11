MODULE c07ex03 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Procedimento: Troca
PROC c07ex03.Troca 4 0 0

! Troca: a <-> b
LDGW c07ex03.a
STLW -4
LDGW c07ex03.b
STGW c07ex03.a
LDLW -4
STGW c07ex03.b

RETURN
END

PROC c07ex03.%main 0 0 0

! Escreva "Entre valor <A>: "
CONST 18
GLOBAL c07ex03.%1
GLOBAL Out.String
CALL 2

! Leia a
GLOBAL c07ex03.a
GLOBAL In.Int
CALL 1

! Escreva "Entre valor <B>: "
CONST 18
GLOBAL c07ex03.%2
GLOBAL Out.String
CALL 2

! Leia b
GLOBAL c07ex03.b
GLOBAL In.Int
CALL 1

! Troca
GLOBAL c07ex03.Troca
CALL 0

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Variavel <A> = "
CONST 16
GLOBAL c07ex03.%3
GLOBAL Out.String
CALL 2

! Escreva a
CONST 0
LDGW c07ex03.a
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Variavel <B> = "
CONST 16
GLOBAL c07ex03.%4
GLOBAL Out.String
CALL 2

! Escreva b
CONST 0
LDGW c07ex03.b
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex03.a 4
GLOVAR c07ex03.b 4

! Texto "Entre valor <A>: "
DEFINE c07ex03.%1
STRING 456E7472652076616C6F72203C413E3A2000

! Texto "Entre valor <B>: "
DEFINE c07ex03.%2
STRING 456E7472652076616C6F72203C423E3A2000

! Texto "Variavel <A> = "
DEFINE c07ex03.%3
STRING 566172696176656C203C413E203D2000

! Texto "Variavel <B> = "
DEFINE c07ex03.%4
STRING 566172696176656C203C423E203D2000
