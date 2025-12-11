MODULE c04ex04 0xFFFFFFFF 0
IMPORT Out 0x190c339a
IMPORT In  0x1d6e8955
ENDHDR

PROC c04ex04.%main 0 0 0

! Escreva "Entre numero inteiro: "
CONST 23
GLOBAL c04ex04.%1
GLOBAL Out.String
CALL 2

! Leia numero
GLOBAL c04ex04.numero
GLOBAL In.Int
CALL 1

! Se (numero >= 20) .e. (numero <= 90) Então
LDGW c04ex04.numero
CONST 20
JLT FORA_DA_FAIXA
LDGW c04ex04.numero
CONST 90
JGT FORA_DA_FAIXA

! escreva "Esta na faixa."
CONST 15
GLOBAL c04ex04.%2
GLOBAL Out.String
CALL 2
JUMP FIM_SE

! Escreva "Esta fora da faixa."
LABEL FORA_DA_FAIXA
CONST 20
GLOBAL c04ex04.%3
GLOBAL Out.String
CALL 2

! Salta linha
LABEL FIM_SE
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variável global
GLOVAR c04ex04.numero 4

! Texto "Entre numero inteiro: "
DEFINE c04ex04.%1
STRING 456E747265206E756D65726F20696E746569726F3A2000

! Texto "Esta na faixa."
DEFINE c04ex04.%2
STRING 45737461206E612066616978612E00

! Texto "Esta fora da faixa."
DEFINE c04ex04.%3
STRING 4573746120666F72612064612066616978612E00
