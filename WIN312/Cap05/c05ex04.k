MODULE c05ex04 0xFFFFFFFF 0

IMPORT In  0x1d6e8955
IMPORT Out 0x190c339a
ENDHDR

PROC c05ex04.%main 0 0 0

! Escreva "Entre valor PAR: "
LABEL REPITA
CONST 18
GLOBAL c05ex04.%1
GLOBAL Out.String
CALL 2

! Leia valor;
GLOBAL c05ex04.valor
GLOBAL In.Int
CALL 1

! Até que valor PAR seja verdadeiro | ~ODD = EVEN
LDGW c05ex04.valor
CONST 1
BITAND
JNEQZ REPITA

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Valor informado: "
CONST 18
GLOBAL c05ex04.%2
GLOBAL Out.String
CALL 2

! Escreva valor
CONST 0
LDGW c05ex04.valor
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variável global
GLOVAR c05ex04.valor 4

! Texto "Entre valor PAR: "
DEFINE c05ex04.%1
STRING 456E7472652076616C6F72205041523A2000

! Texto "Valor informado: "
DEFINE c05ex04.%2
STRING 56616C6F7220696E666F726D61646F3A2000
