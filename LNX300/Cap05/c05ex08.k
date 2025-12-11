MODULE c05ex08 0xFFFFFFFF 0

IMPORT Out 0x66adaa46
ENDHDR

PROC c05ex08.%main 0 0 0

! i := 1
CONST 1
STGW c05ex08.i

LABEL PARA
! Quando i > 10, fim do laço
LDGW c05ex08.i
CONST 10
JGT FIM_PARA

! Verifica se i >= 6
LDGW c05ex08.i
CONST 6
JGEQ INTERROMPE_LACO

! Escreve i
CONST 4
LDGW c05ex08.i
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! i := i + 1
LDGW c05ex08.i
INC
STGW c05ex08.i

! Volta ao início do laço
JUMP PARA

LABEL INTERROMPE_LACO
JUMP FIM_PARA

LABEL FIM_PARA

RETURN
END

! Variável global
GLOVAR c05ex08.i 4
