MODULE c09ex13 0xFFFFFFFF 0
IMPORT In   0x5d1e568e
IMPORT Out  0x66adaa46
IMPORT Math 0x227a61ff
ENDHDR

PROC c09ex13.%main 12 0 0

! Escreva "Quantos elementos: "
CONST 20
GLOBAL c09ex13.%1
GLOBAL Out.String
CALL 2

! Leia tamanho;
GLOBAL c09ex13.tamanho
GLOBAL In.Int
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Cria matriz A com tamanho definido
LDGW c09ex13.tamanho
CONST 1
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 4
STGW c09ex13.a

! Para i de 0 Até tamanho - 1 Faça
LDGW c09ex13.tamanho
DEC
STLW -4
CONST 0
STGW c09ex13.i
LABEL ENTRADA_DE_DADOS
LDGW c09ex13.i
LDLW -4
JGT FIM_ENTRADA_DE_DADOS

! Escreva "Entre A[" 
CONST 9
GLOBAL c09ex13.%2
GLOBAL Out.String
CALL 2

! Escreva i + 1 .. "] --> "
CONST 0
LDGW c09ex13.i
INC
GLOBAL Out.Int
CALL 2
CONST 7
GLOBAL c09ex13.%3
GLOBAL Out.String
CALL 2

! Leia a[i]
LDGW c09ex13.a
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
INDEXW
GLOBAL In.Real
CALL 1

! Incrementa i de 1 em 1
LDGW c09ex13.i
INC
STGW c09ex13.i
JUMP ENTRADA_DE_DADOS
LABEL FIM_ENTRADA_DE_DADOS

! Cria matriz B com tamanho definido
LDGW c09ex13.tamanho
CONST 1
CONST 4
CONST 0
GLOBAL NEWFLEX
CALLW 4
STGW c09ex13.b

! Para i de 0 Até tamanho - 1 Faça
LDGW c09ex13.tamanho
DEC
STLW -8
CONST 0
STGW c09ex13.i
LABEL CALC_MATRIZ_B
LDGW c09ex13.i
LDLW -8
JGT FIM_CALC_MATRIZ_B

! Se (a[i] = 0.0) Então
LDGW c09ex13.a
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIF
FCONST 0.0
FJNEQ SE_NAO_ZERO

! b[i] <- 0.0
LABEL SE_ZERO
FCONST 0.0
LDGW c09ex13.b
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
STIF
JUMP FIM_TESTE_ZERO
LABEL SE_NAO_ZERO

! b[i] <- a[i] ^ 2
LDGW c09ex13.a
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIF
GLOBAL ABSFLOAT
CALLF 1
GLOBAL Math.Ln
CALLF 1
FCONST 2.0
FTIMES
GLOBAL Math.Exp
CALLF 1
LDGW c09ex13.b
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
STIF
LABEL FIM_TESTE_ZERO

! Incrementa i de 1 em 1
LDGW c09ex13.i
INC
STGW c09ex13.i
JUMP CALC_MATRIZ_B
LABEL FIM_CALC_MATRIZ_B

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "---------|----------|----------")
CONST 32
GLOBAL c09ex13.%4
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

! Escreva " Posicao | Matriz A | Matriz B "
CONST 32
GLOBAL c09ex13.%5
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

! Escreva "---------|----------|----------"
CONST 32
GLOBAL c09ex13.%4
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

! Para i de 0 Até tamanho - 1 Faça
LDGW c09ex13.tamanho
DEC
STLW -12
CONST 0
STGW c09ex13.i
LABEL SAIDA_DE_DADOS
LDGW c09ex13.i
LDLW -12
JGT FIM_SAIDA_DE_DADOS

! Escreva i + 1 .. " | "
CONST 8
LDGW c09ex13.i
INC
GLOBAL Out.Int
CALL 2
CONST 4
GLOBAL c09ex13.%6
GLOBAL Out.String
CALL 2

! Escreva a[i] .. " | ";
CONST 1
CONST 8
LDGW c09ex13.a
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIF
CONVFD
GLOBAL Out.Fixed
CALL 4
CONST 4
GLOBAL c09ex13.%6
GLOBAL Out.String
CALL 2

! Escreva b[i]
CONST 1
CONST 8
LDGW c09ex13.b
LDGW c09ex13.i
DUP 1
LDNW -4
LDNW 4
BOUND 0
LDIF
CONVFD
GLOBAL Out.Fixed
CALL 4
GLOBAL Out.Ln
CALL 0

! Incrementa i de 1 em 1
LDGW c09ex13.i
INC
STGW c09ex13.i
JUMP SAIDA_DE_DADOS
LABEL FIM_SAIDA_DE_DADOS

! Escreva "---------|----------|----------")
CONST 32
GLOBAL c09ex13.%4
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c09ex13.tamanho 4
GLOVAR c09ex13.i 4
GLOVAR c09ex13.a 4
GLOVAR c09ex13.b 4

! Mapa de ponteiro global
DEFINE c09ex13.%gcmap
WORD GC_POINTER
WORD c09ex13.a
WORD GC_POINTER
WORD c09ex13.b
WORD GC_END

! Texto "Quantos elementos: "
DEFINE c09ex13.%1
STRING 5175616E746F7320656C656D656E746F733A00

! Texto "Entre A["
DEFINE c09ex13.%2
STRING 456E74726520415B00

! Texto "] --> "
DEFINE c09ex13.%3
STRING 5D202D2D3E2000

! Texto "---------|----------|----------"
DEFINE c09ex13.%4
STRING 2D2D2D2D2D2D2D2D2D7C2D2D2D2D2D2D2D2D2D2D7C2D2D2D2D2D2D2D2D2D2D00

! Texto " Posicao | Matriz A | Matriz B "
DEFINE c09ex13.%5
STRING 20506F736963616F207C204D617472697A2041207C204D617472697A20422000

! Texto " | "
DEFINE c09ex13.%6
STRING 207C2000
