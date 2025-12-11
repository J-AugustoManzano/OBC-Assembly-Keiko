MODULE c05ex05 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

PROC c05ex05.%main 0 0 0

! i := 1
CONST 1
STGW c05ex05.i

LABEL REPITA

! Escreve o valor de i
CONST 4
LDGW c05ex05.i
GLOBAL Out.Int
CALL 2

! Escreve " - "
CONST 4
GLOBAL c05ex05.%1
GLOBAL Out.String
CALL 2

! i := i + 1
LDGW c05ex05.i
INC
STGW c05ex05.i

! Escreva "Deseja continuar? [S] para sim: "
CONST 33
GLOBAL c05ex05.%2
GLOBAL Out.String
CALL 2

! Leia continuar
GLOBAL c05ex05.continuar
GLOBAL In.Char
CALL 1

! Limpeza do buffer do teclado
LABEL LIMPA_BUFFER
GLOBAL c05ex05.buffer
GLOBAL In.Char
CALL 1
LDGC c05ex05.buffer
CONST 10
JNEQ LIMPA_BUFFER

! Até que continuar <> 'S' E continuar <> 's'
LDGC c05ex05.continuar
CONST 83
JEQ REPITA

LDGC c05ex05.continuar
CONST 115
JEQ REPITA

RETURN
END

! Variáveis globais
GLOVAR c05ex05.i 4
GLOVAR c05ex05.continuar 1
GLOVAR c05ex05.buffer 1

! Texto " - "
DEFINE c05ex05.%1
STRING 202D2000

! Texto "Deseja continuar? [S] para sim: "
DEFINE c05ex05.%2
STRING 446573656A6120636F6E74696E7561723F205B535D20706172612073696D3A2000
