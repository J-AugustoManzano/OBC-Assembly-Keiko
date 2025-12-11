MODULE c05ex06 0xXXXXXXXX 0
IMPORT Out 0x190c339a
ENDHDR

PROC c05ex06.%main 0 0 0

! PARA i DE 10 ATÉ 1 PASSO 1 FAÇA
CONST 10
STGW c05ex06.i
LABEL PARA

LDGW c05ex06.i
CONST 1
JLT FIM_PARA

! Escreva i
CONST 4
LDGW c05ex06.i
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Decrementa i de 1 em 1
LDGW c05ex06.i
DEC
STGW c05ex06.i
JUMP PARA

LABEL FIM_PARA

RETURN
END

! Variável global
GLOVAR c05ex06.i 4
