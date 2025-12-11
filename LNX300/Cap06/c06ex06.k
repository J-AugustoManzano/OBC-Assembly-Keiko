MODULE c06ex06 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

PROC c06ex06.%main 28 0 0

! Escreva "--- Cadastro de Alunos/Notas ---"
CONST 33
GLOBAL c06ex06.%1
GLOBAL Out.String
CALL 2

! Salta linhas (2 x)
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "Entre a quantidade de alunos ..: "
CONST 34
GLOBAL c06ex06.%2
GLOBAL Out.String
CALL 2

! Leia numAlunos
GLOBAL c06ex06.numAlunos
GLOBAL In.Int
CALL 1

! Escreva "Entre a quantidade de notas ...: "
CONST 34
GLOBAL c06ex06.%3
GLOBAL Out.String
CALL 2

! Leia numNotas
GLOBAL c06ex06.numNotas
GLOBAL In.Int
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Define lista com número de alunos
LDGW c06ex06.numAlunos
CONST 1
CONST 36
CONST 0x00000201
GLOBAL NEWFLEX
CALLW 4
STGW c06ex06.lista

! Para i de 0 Até numAlunos - 1 Faça
LDGW c06ex06.numAlunos
DEC
STLW -4
CONST 0
STGW c06ex06.i
LABEL ENTRA_ALUNOS
LDGW c06ex06.i
LDLW -4
JGT FIM_ENTRA_ALUNOS

! Escreva "--- Aluno "
CONST 11
GLOBAL c06ex06.%4
GLOBAL Out.String
CALL 2

! Escreva i + 1, 0
CONST 0
LDGW c06ex06.i
INC
GLOBAL Out.Int
CALL 2

! Escreva " ---"
CONST 5
GLOBAL c06ex06.%5
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Define lista[i].notas com número de notas
LDGW c06ex06.numNotas
CONST 1
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 4
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
STNW 32

! Escreva "Nome do aluno ..: "
CONST 19
GLOBAL c06ex06.%6
GLOBAL Out.String
CALL 2

! Leia lista[i].nome
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
CONST 31
SWAP
GLOBAL In.Line
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Para j de 0 Até numNotas - 1 Faça
LDGW c06ex06.numNotas
DEC
STLW -8
CONST 0
STGW c06ex06.j
LABEL ENTRA_NOTAS
LDGW c06ex06.j
LDLW -8
JGT FIM_ENTRA_NOTAS

! Escreva "Nota ")
CONST 6
GLOBAL c06ex06.%7
GLOBAL Out.String
CALL 2

! Escreva j + 1
CONST 0
LDGW c06ex06.j
INC
GLOBAL Out.Int
CALL 2

! Escreva "..........: "
CONST 13
GLOBAL c06ex06.%8
GLOBAL Out.String
CALL 2

! Leia lista[i, j]
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
LDNW 32
LDGW c06ex06.j
DUP 1
LDNW -4
LDNW 4
BOUND 0
INDEXW
GLOBAL In.Real
CALL 1

! j := j + 1
LDGW c06ex06.j
INC
STGW c06ex06.j
JUMP ENTRA_NOTAS
LABEL FIM_ENTRA_NOTAS

! Salta linha
GLOBAL Out.Ln
CALL 0

! i := i + 1
LDGW c06ex06.i
INC
STGW c06ex06.i
JUMP ENTRA_ALUNOS
LABEL FIM_ENTRA_ALUNOS

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "--- RELATORIO DE NOTAS ---"
CONST 27
GLOBAL c06ex06.%9
GLOBAL Out.String
CALL 2

!   Out.Ln;
GLOBAL Out.Ln
CALL 0

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Nome                           "
CONST 32
GLOBAL c06ex06.%10
GLOBAL Out.String
CALL 2

! Para j de 0 Até numNotas - 1 Faça
LDGW c06ex06.numNotas
DEC
STLW -12
CONST 0
STGW c06ex06.j
LABEL TITULO_NOTAS
LDGW c06ex06.j
LDLW -12
JGT FIM_TITULO_NOTAS

! Escreva "Nota"
CONST 5
GLOBAL c06ex06.%11
GLOBAL Out.String
CALL 2

! Escreva j + 1
CONST 0
LDGW c06ex06.j
INC
GLOBAL Out.Int
CALL 2

! Escreva " "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1

! j := j + 1
LDGW c06ex06.j
INC
STGW c06ex06.j
JUMP TITULO_NOTAS
LABEL FIM_TITULO_NOTAS

! Escreva " "
CONST 2
GLOBAL c06ex06.%15
GLOBAL Out.String
CALL 2

! Escreva  "Media"
CONST 6
GLOBAL c06ex06.%12
GLOBAL Out.String
CALL 2

! Escreva " "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "-------------------------------"
CONST 32
GLOBAL c06ex06.%13
GLOBAL Out.String
CALL 2

! Para j de 0 Até numNotas - 1 Faça
LDGW c06ex06.numNotas
DEC
STLW -16
CONST 0
STGW c06ex06.j
LABEL LINHA_TRACEJADA
LDGW c06ex06.j
LDLW -16
JGT FIM_LINHA_TRACEJADA

! Escreva "------"
CONST 7
GLOBAL c06ex06.%14
GLOBAL Out.String
CALL 2

! j := j + 1
LDGW c06ex06.j
INC
STGW c06ex06.j
JUMP LINHA_TRACEJADA
LABEL FIM_LINHA_TRACEJADA

! Escreva "------"
CONST 7
GLOBAL c06ex06.%14
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Para i de 0 Até numAlunos - 1 Faça
LDGW c06ex06.numAlunos
DEC
STLW -20
CONST 0
STGW c06ex06.i
LABEL RELATORIO_ALUNOS
LDGW c06ex06.i
LDLW -20
JGT FIM_RELATORIO_ALUNOS

! Escreva lista[i].nome
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
CONST 31
SWAP
GLOBAL Out.String
CALL 2

! k := 0
CONST 0
STGW c06ex06.k
LABEL AJUSTA_ESPACAMENTO

! Enquanto (lista[i].nome[k] <> 0X) .e. (k < 30) Faça
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
LDGW c06ex06.k
CONST 31
BOUND 0
LDIC
JEQZ FIM_AJUSTE_ESPACAMENTO
LDGW c06ex06.k
CONST 30
JGEQ FIM_AJUSTE_ESPACAMENTO

! k := k + 1
LDGW c06ex06.k
INC
STGW c06ex06.k
JUMP AJUSTA_ESPACAMENTO
LABEL FIM_AJUSTE_ESPACAMENTO

! Enquanto (k < 31) Faça
LDGW c06ex06.k
CONST 31
JGEQ FIM_ESPACAMENTO

! Escreva " "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1

! k := k + 1
LDGW c06ex06.k
INC
STGW c06ex06.k
JUMP FIM_AJUSTE_ESPACAMENTO
LABEL FIM_ESPACAMENTO

! somaNotas := 0.0
FCONST 0.0
STGF c06ex06.somaNotas

! Para j de 0 Até numNotas - 1 Faça
LDGW c06ex06.numNotas
DEC
STLW -24
CONST 0
STGW c06ex06.j
LABEL LOOP_IMPRIME_NOTAS
LDGW c06ex06.j
LDLW -24
JGT FIM_IMPRIME_NOTAS

! Escreva lista[i, j]
CONST 1
CONST 5
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
LDNW 32
LDGW c06ex06.j
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIF
CONVFD
GLOBAL Out.Fixed
CALL 4

! Escreva " "
CONST 32
ALIGNC
GLOBAL Out.Char
CALL 1

! j := j + 1
LDGW c06ex06.j
INC
STGW c06ex06.j
JUMP LOOP_IMPRIME_NOTAS
LABEL FIM_IMPRIME_NOTAS

! Para j de 0 Até numNotas - 1 Faça
LDGW c06ex06.numNotas
DEC
STLW -28
CONST 0
STGW c06ex06.j
LABEL SOMA_NOTAS
LDGW c06ex06.j
LDLW -28
JGT FIM_SOMA_NOTAS

! somaNotas := somaNotas + lista[i, j]
LDGF c06ex06.somaNotas
LDGW c06ex06.lista
LDGW c06ex06.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
CONST 36
TIMES
OFFSET
LDNW 32
LDGW c06ex06.j
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIF
FPLUS
STGF c06ex06.somaNotas

! j := j + 1
LDGW c06ex06.j
INC
STGW c06ex06.j
JUMP SOMA_NOTAS
LABEL FIM_SOMA_NOTAS

! Se (numNotas > 0) Então
LDGW c06ex06.numNotas
JLEQZ MEDIA_ZERO

! media := somaNotas / numNotas
LDGF c06ex06.somaNotas
LDGW c06ex06.numNotas
CONVNF
FZCHECK 101
FDIV
STGF c06ex06.media
JUMP IMPRIME_MEDIA
LABEL MEDIA_ZERO

! media := 0.0
FCONST 0.0
STGF c06ex06.media
LABEL IMPRIME_MEDIA

! Escreva media
CONST 1
CONST 6
LDGF c06ex06.media
CONVFD
GLOBAL Out.Fixed
CALL 4

! Salta linha
GLOBAL Out.Ln
CALL 0

! i := 1 + 1
LDGW c06ex06.i
INC
STGW c06ex06.i
JUMP RELATORIO_ALUNOS
LABEL FIM_RELATORIO_ALUNOS

RETURN
END

! Variáveis globais
GLOVAR c06ex06.numAlunos 4
GLOVAR c06ex06.numNotas 4
GLOVAR c06ex06.lista 4
GLOVAR c06ex06.i 4
GLOVAR c06ex06.j 4
GLOVAR c06ex06.somaNotas 4
GLOVAR c06ex06.media 4
GLOVAR c06ex06.k 4

! String "--- Cadastro de Alunos/Notas ---"
DEFINE c06ex06.%1
STRING 2D2D2D20436164617374726F20646520416C756E6F732F4E6F746173202D2D2D00

! Texto "Entre a quantidade de alunos ..: "
DEFINE c06ex06.%2
STRING 456E7472652061207175616E74696461646520646520616C756E6F73202E2E3A2000

! Texto "Entre a quantidade de notas ...: "
DEFINE c06ex06.%3
STRING 456E7472652061207175616E746964616465206465206E6F746173202E2E2E3A2000

! Texto "--- Aluno "
DEFINE c06ex06.%4
STRING 2D2D2D20416C756E6F2000

! String " ---"
DEFINE c06ex06.%5
STRING 202D2D2D00

! Texto "Nome do aluno ..: "
DEFINE c06ex06.%6
STRING 4E6F6D6520646F20616C756E6F202E2E3A2000

! Texto "Nota "
DEFINE c06ex06.%7
STRING 4E6F74612000

! Texto "..........: "
DEFINE c06ex06.%8
STRING 2E2E2E2E2E2E2E2E2E2E3A2000

! Texto "--- RELATORIO DE NOTAS ---"
DEFINE c06ex06.%9
STRING 2D2D2D2052454C41544F52494F204445204E4F544153202D2D2D00

! Texto "Nome                           "
DEFINE c06ex06.%10
STRING 4E6F6D6520202020202020202020202020202020202020202020202020202000

! Texto "Nota"
DEFINE c06ex06.%11
STRING 4E6F746100

! Texto "Media"
DEFINE c06ex06.%12
STRING 4D6564696100

! Texto "-------------------------------"
DEFINE c06ex06.%13
STRING 2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D00

! Texto "------"
DEFINE c06ex06.%14
STRING 2D2D2D2D2D2D00

! Texto " "
DEFINE c06ex06.%15
STRING 2000
