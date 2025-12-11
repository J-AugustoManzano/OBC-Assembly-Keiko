MODULE c05ex07 0xFFFFFFFF 0
IMPORT Out 0x66adaa46
ENDHDR

PROC c05ex07.%main 0 0 0

! i := 1
CONST 1
STGW c05ex07.i

LABEL PARA
LDGW c05ex07.i
CONST 15
JGT FIM_PARA

! Escreve o valor de i
CONST 4
LDGW c05ex07.i
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! i := i + 3 
LDGW c05ex07.i
CONST 3
PLUS
STGW c05ex07.i

JUMP PARA

LABEL FIM_PARA

RETURN
END

! Variável global
GLOVAR c05ex07.i 4
