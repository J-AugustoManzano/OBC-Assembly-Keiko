MODULE c04ex02 0xFFFFFFFF  0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

PROC c04ex02.%main 0 0 0

! Leia valor
GLOBAL c04ex02.valor
GLOBAL In.Int
CALL 1

! resto <- valor - 2 * (valor DIV 2)
LDGW c04ex02.valor
CONST 2
DIV
CONST 2
TIMES
LDGW c04ex02.valor
MINUS
STGW c04ex02.resto

! Se (resto = 0) Então
LDGW c04ex02.resto
JNEQZ CONDICAO_FALSA

! Escreva "PAR"
CONST 4
GLOBAL c04ex02.%1
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0
JUMP FIM_SE

! Senão
LABEL CONDICAO_FALSA

! Escreva "IMPAR"
CONST 6
GLOBAL c04ex02.%2
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

LABEL FIM_SE

RETURN
END

! Variáveis globais
GLOVAR c04ex02.valor 4
GLOVAR c04ex02.resto 4

! Texto "PAR"
DEFINE c04ex02.%1
STRING 50415200

! Texto "IMPAR"
DEFINE c04ex02.%2
STRING 494D50415200
