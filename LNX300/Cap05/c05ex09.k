MODULE c05ex09 0xFFFFFFFF 0

IMPORT Out 0x66adaa46
ENDHDR

PROC c05ex09.%main 0 0 0

! i := 1
CONST 1
STGW c05ex09.i

LABEL PARA
! Quando i > 10, fim do laço
LDGW c05ex09.i
CONST 10
JGT FIM_PARA

! Se i = 6, ignora e pula para próxima iteração
LDGW c05ex09.i
CONST 6
JEQ CONTINUA

! Escreve i
CONST 4
LDGW c05ex09.i
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

LABEL CONTINUA
! i := i + 1
LDGW c05ex09.i
INC
STGW c05ex09.i
JUMP PARA

LABEL FIM_PARA

RETURN
END

! Variável global
GLOVAR c05ex09.i 4
