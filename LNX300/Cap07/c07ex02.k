MODULE c07ex02 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

PROC c07ex02.%main 0 0 0

! escreva "Entre valor <A>: "
CONST 18
GLOBAL c07ex02.%1
GLOBAL Out.String
CALL 2

! Leia a
GLOBAL c07ex02.a
GLOBAL In.Int
CALL 1

! Escreva "Entre valor <B>: "
CONST 18
GLOBAL c07ex02.%2
GLOBAL Out.String
CALL 2

! Leia b
GLOBAL c07ex02.b
GLOBAL In.Int
CALL 1

! x := a
LDGW c07ex02.a
STGW c07ex02.x

! a := b
LDGW c07ex02.b
STGW c07ex02.a

! b := x
LDGW c07ex02.x
STGW c07ex02.b

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Variavel <A> = "
CONST 16
GLOBAL c07ex02.%3
GLOBAL Out.String
CALL 2

! Escreva a
CONST 0
LDGW c07ex02.a
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Variavel <B> = "
CONST 16
GLOBAL c07ex02.%4
GLOBAL Out.String
CALL 2

! Escreva b
CONST 0
LDGW c07ex02.b
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex02.a 4
GLOVAR c07ex02.b 4
GLOVAR c07ex02.x 4

! Texto "Entre valor <A>: "
DEFINE c07ex02.%1
STRING 456E7472652076616C6F72203C413E3A2000

! Texto "Entre valor <B>: "
DEFINE c07ex02.%2
STRING 456E7472652076616C6F72203C423E3A2000

! Texto "Variavel <A> = "
DEFINE c07ex02.%3
STRING 566172696176656C203C413E203D2000

! Texto "Variavel <B> = "
DEFINE c07ex02.%4
STRING 566172696176656C203C423E203D2000
