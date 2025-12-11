MODULE c06ex05 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

PROC c06ex05.%main 28 0 0

! Escreva "--- Matriz Dinamica de Inteiros ---"
CONST 36
GLOBAL c06ex05.%1
GLOBAL Out.String
CALL 2

! Salta linha (2 x)
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "Entre o numero de linhas ...: "
CONST 29
GLOBAL c06ex05.%2
GLOBAL Out.String
CALL 2

! Leia numLinhas
GLOBAL c06ex05.numLinhas
GLOBAL In.Int
CALL 1

! Escreva "Entre o numero de colunas ..: "
CONST 29
GLOBAL c06ex05.%3
GLOBAL Out.String
CALL 2

! Leia numColunas
GLOBAL c06ex05.numColunas
GLOBAL In.Int
CALL 1

! Salta linha (2 x)
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! matriz[numLinhas, ???]
LDGW c06ex05.numLinhas
CONST 1
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 4
STGW c06ex05.matriz

! Para i de 0 Até numLinhas - 1 Faça
LDGW c06ex05.numLinhas
DEC
STLW -4
CONST 0
STGW c06ex05.i
LABEL LACO_CRIAR_MAT2D
LDGW c06ex05.i
LDLW -4
JGT FIM_CRIAR_MAT2D

! matriz[i, numColunas]
LDGW c06ex05.numColunas
CONST 1
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 4
LDGW c06ex05.matriz
LDGW c06ex05.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
STIW

! i := i + 1
LDGW c06ex05.i
INC
STGW c06ex05.i
JUMP LACO_CRIAR_MAT2D
LABEL FIM_CRIAR_MAT2D

! Escreva "--- Entrada de Valores ---"
CONST 27
GLOBAL c06ex05.%4
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Para i de 0 Até numLinhas - 1 Faça
LDGW c06ex05.numLinhas
DEC
STLW -8
CONST 0
STGW c06ex05.i
LABEL LACO_ENTRADA_LINHAS
LDGW c06ex05.i
LDLW -8
JGT FIM_ENTRADA_LINHAS

! Escreva "Linha "
CONST 7
GLOBAL c06ex05.%5
GLOBAL Out.String
CALL 2

! Escreva i + 1
CONST 0
LDGW c06ex05.i
INC
GLOBAL Out.Int
CALL 2

! Salta linha 
GLOBAL Out.Ln
CALL 0

! Para j de 0 Até numColunas - 1 faça
LDGW c06ex05.numColunas
DEC
STLW -12
CONST 0
STGW c06ex05.j
LABEL LACO_ENTRADA_COLUNAS
LDGW c06ex05.j
LDLW -12
JGT FIM_ENTRADA_COLUNAS

! Escreva "  Coluna "
CONST 10
GLOBAL c06ex05.%6
GLOBAL Out.String
CALL 2

! Escreva j + 1
CONST 0
LDGW c06ex05.j
INC
GLOBAL Out.Int
CALL 2

! Escreva ": "
CONST 3
GLOBAL c06ex05.%7
GLOBAL Out.String
CALL 2

! Leia matriz[i, j]
LDGW c06ex05.matriz
LDGW c06ex05.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIW
LDGW c06ex05.j
DUP 1
LDNW -4
LDNW 4
BOUND 0
INDEXW
GLOBAL In.Int
CALL 1

! j := j + 1
LDGW c06ex05.j
INC
STGW c06ex05.j
JUMP LACO_ENTRADA_COLUNAS
LABEL FIM_ENTRADA_COLUNAS

! Salta linha
GLOBAL Out.Ln
CALL 0

! i := i + 1
LDGW c06ex05.i
INC
STGW c06ex05.i
JUMP LACO_ENTRADA_LINHAS
LABEL FIM_ENTRADA_LINHAS

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva ("--- Matriz Resultante ---"
CONST 26
GLOBAL c06ex05.%8
GLOBAL Out.String
CALL 2

! Salta linha (2 x)
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "            "
CONST 13
GLOBAL c06ex05.%9
GLOBAL Out.String
CALL 2

! Para j de 0 Até numColunas - 1 Faça
LDGW c06ex05.numColunas
DEC
STLW -16
CONST 0
STGW c06ex05.j
LABEL LACO_CABECALHO
LDGW c06ex05.j
LDLW -16
JGT FIM_CABECALHO

! Escreva " "
CONST 2
GLOBAL c06ex05.%14
GLOBAL Out.String
CALL 2

! Escreva "Col"
CONST 4
GLOBAL c06ex05.%10
GLOBAL Out.String
CALL 2

! Escreva j + 1
CONST 0
LDGW c06ex05.j
INC
GLOBAL Out.Int
CALL 2

! Escreva " "
CONST 2
GLOBAL c06ex05.%14
GLOBAL Out.String
CALL 2

! j := j + 1
LDGW c06ex05.j
INC
STGW c06ex05.j
JUMP LACO_CABECALHO
LABEL FIM_CABECALHO

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "------------"
CONST 13
GLOBAL c06ex05.%11
GLOBAL Out.String
CALL 2

! Para j de 0 Até numColunas - 1 Faça
LDGW c06ex05.numColunas
DEC
STLW -20
CONST 0
STGW c06ex05.j
LABEL LACO_TRACOS_COLUNAS
LDGW c06ex05.j
LDLW -20
JGT FIM_TRACOS_COLUNAS

! Escreva "------"
CONST 7
GLOBAL c06ex05.%12
GLOBAL Out.String
CALL 2

! j := j + 1
LDGW c06ex05.j
INC
STGW c06ex05.j
JUMP LACO_TRACOS_COLUNAS
LABEL FIM_TRACOS_COLUNAS

! Salta linha
GLOBAL Out.Ln
CALL 0

! Para i de 0 Até numLinhas - 1 Faça
LDGW c06ex05.numLinhas
DEC
STLW -24
CONST 0
STGW c06ex05.i
LABEL LACO_CABECALHO_LINHA
LDGW c06ex05.i
LDLW -24
JGT FIM_CABECALHO_LINHA

! Escreva "Linha "
CONST 7
GLOBAL c06ex05.%5
GLOBAL Out.String
CALL 2

! Escreva i + 1
CONST 0
LDGW c06ex05.i
INC
GLOBAL Out.Int
CALL 2

! Escreva " |"
CONST 3
GLOBAL c06ex05.%13
GLOBAL Out.String
CALL 2

! Se (i + 1 < 10) Então
LDGW c06ex05.i
INC
CONST 10
JGEQ ALINHAMENTO_DOIS_ESPACOS

! Escreva "   "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1
JUMP FIM_ALINHAMENTO
LABEL ALINHAMENTO_DOIS_ESPACOS

! Escreva "  "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1
LABEL FIM_ALINHAMENTO

! para j de 0 Até numColunas - 1 Faça
LDGW c06ex05.numColunas
DEC
STLW -28
CONST 0
STGW c06ex05.j
LABEL LACO_IMPRESSAO_COLUNAS
LDGW c06ex05.j
LDLW -28
JGT FIM_IMPRESSAO_COLUNAS

! Escreva matriz[i, j]
CONST 5
LDGW c06ex05.matriz
LDGW c06ex05.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIW
LDGW c06ex05.j
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIW
GLOBAL Out.Int
CALL 2

! Escreva " "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1

! i := i + 1
LDGW c06ex05.j
INC
STGW c06ex05.j
JUMP LACO_IMPRESSAO_COLUNAS
LABEL FIM_IMPRESSAO_COLUNAS

! Salta linha
GLOBAL Out.Ln
CALL 0

! Para i de 0 Até numLinhas - 1 Faça
LDGW c06ex05.i
INC
STGW c06ex05.i
JUMP LACO_CABECALHO_LINHA
LABEL FIM_CABECALHO_LINHA

RETURN
END

! Variáveis globais
GLOVAR c06ex05.numLinhas 4
GLOVAR c06ex05.numColunas 4
GLOVAR c06ex05.matriz 4
GLOVAR c06ex05.i 4
GLOVAR c06ex05.j 4

! Texto "--- Matriz Dinamica de Inteiros ---"
DEFINE c06ex05.%1
STRING 2D2D2D204D617472697A2044696E616D69636120646520496E746569726F73202D2D2D00

! Texto "Entre numero de linhas ...: "
DEFINE c06ex05.%2
STRING 456E747265206E756D65726F206465206C696E686173202E2E2E3A2000

! Texto "Entre numero de colunas ..: "
DEFINE c06ex05.%3
STRING 456E747265206E756D65726F20646520636F6C756E6173202E2E3A2000

! Texto "--- Entrada de Valores ---"
DEFINE c06ex05.%4
STRING 2D2D2D20456E74726164612064652056616C6F726573202D2D2D00

! Texto "Linha "
DEFINE c06ex05.%5
STRING 4C696E68612000

! Texto "  Coluna "
DEFINE c06ex05.%6
STRING 2020436F6C756E612000

! Texto ": "
DEFINE c06ex05.%7
STRING 3A2000

! Texto "--- Matriz Resultante ---"
DEFINE c06ex05.%8
STRING 2D2D2D204D617472697A20526573756C74616E7465202D2D2D00

! Texto "           "
DEFINE c06ex05.%9
STRING 20202020202020202020202000

! Texto "Col"
DEFINE c06ex05.%10
STRING 436F6C00

! Texto "------------"
DEFINE c06ex05.%11
STRING 2D2D2D2D2D2D2D2D2D2D2D2D2D00

! Texto "------"
DEFINE c06ex05.%12
STRING 2D2D2D2D2D2D00

! Texto " |"
DEFINE c06ex05.%13
STRING 207C00

! Texto " "
DEFINE c06ex05.%14
STRING 2000
