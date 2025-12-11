MODULE c05ex03 0xFFFFFFFF 0
IMPORT In  0x1d6e8955
IMPORT Out 0x190c339a
ENDHDR

PROC c05ex03.%main 0 0 0

! i atribuído a 1
CONST 1
STGW c05ex03.i

! continuar atribuído a 'S';
CONST 83
STGC c05ex03.continuar

! ENQUANTO (continuar = 'S') OR (continuar = 's') FAÇA
LABEL ENQUANTO
LDGC c05ex03.continuar
CONST 83
JEQ OPERACAO

LDGC c05ex03.continuar
CONST 115
JNEQ FIM_ENQUANTO

LABEL OPERACAO

! Escreva i 
CONST 4
LDGW c05ex03.i
GLOBAL Out.Int
CALL 2

! Escreva " - "
CONST 4
GLOBAL c05ex03.%1
GLOBAL Out.String
CALL 2

! i := i + 1
LDGW c05ex03.i
INC
STGW c05ex03.i

! Escreva "Deseja continuar? [S] para sim: "
CONST 33
GLOBAL c05ex03.%2
GLOBAL Out.String
CALL 2

! Leia continuar
GLOBAL c05ex03.continuar
GLOBAL In.Char
CALL 1

! Limpeza do buffer do teclado 
LABEL LIMPA_BUFFER
GLOBAL c05ex03.buffer
GLOBAL In.Char
CALL 1
LDGC c05ex03.buffer
CONST 10
JNEQ LIMPA_BUFFER

! Volta ao início do laço
JUMP ENQUANTO

LABEL FIM_ENQUANTO

RETURN
END

! Variáveis globais
GLOVAR c05ex03.i 4
GLOVAR c05ex03.continuar 1
GLOVAR c05ex03.buffer 1

! Texto " - "
DEFINE c05ex03.%1
STRING 202D2000

! Texto "Deseja continuar? [S] para sim: "
DEFINE c05ex03.%2
STRING 446573656A6120636F6E74696E7561723F205B535D20706172612073696D3A2000
