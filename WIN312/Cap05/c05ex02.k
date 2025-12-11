MODULE c05ex02 0xFFFFFFFF 0
IMPORT Out 0x190c339a
ENDHDR

PROC c05ex02.%main 0 0 0

! i atribuído a 1
CONST 1
STGW c05ex02.i

! ENQUANTO (i <= 10) FAÇA 
LABEL ENQUANTO
LDGW c05ex02.i
CONST 10
JGT FIM_ENQUANTO

! Escreva i
CONST 4
LDGW c05ex02.i
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0

! Incremento de 1 em i
LDGW c05ex02.i
CONST 1
PLUS
STGW c05ex02.i

! Retorna para o início do laço
JUMP ENQUANTO

LABEL FIM_ENQUANTO

RETURN
END

! Variável global
GLOVAR c05ex02.i 4
