MODULE c04ex05 0xFFFFFFFF 0
IMPORT Out 0x66adaa46
IMPORT In  0x5d1e568e
ENDHDR

PROC c04ex05.%main 0 0 0

! Escreva "Escolha o tipo de transporte:"
CONST 30
GLOBAL c04ex05.%1
GLOBAL Out.String
CALL 2

! Salta 2 linhas
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "[M] - Motocicleta"
CONST 18
GLOBAL c04ex05.%2
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "[S] - Scooter"
CONST 14
GLOBAL c04ex05.%3
GLOBAL Out.String
CALL 2

! Salta 2 linhas
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "==> "
CONST 5
GLOBAL c04ex05.%4
GLOBAL Out.String
CALL 2

! Leia transp
GLOBAL c04ex05.transp
GLOBAL In.Char
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Se (transp >= 'a') .e. (transp <= 'z') Então
LDGC c04ex05.transp
CONST 97
JLT NAO_MINUSCULO
LDGC c04ex05.transp
CONST 122
JGT NAO_MINUSCULO

! Transforma transp em maiúsculo, põe em transpMaiusc
LDGC c04ex05.transp
CONST 32
MINUS
STGC c04ex05.transpMaiusc
JUMP FIM_CONVERSAO

LABEL NAO_MINUSCULO
LDGC c04ex05.transp
STGC c04ex05.transpMaiusc

LABEL FIM_CONVERSAO

! Limpa buffer de teclado
GLOBAL c04ex05.transp
GLOBAL In.Char
CALL 1
LDGC c04ex05.transp
CONST 10
JNEQ FIM_CONVERSAO

! Se (transpMaiusc = 'M') .ou. (transpMaiusc = 'S') Então
LDGC c04ex05.transpMaiusc
CONST 77
JEQ TRANSPORTE_VALIDO
LDGC c04ex05.transpMaiusc
CONST 83
JEQ TRANSPORTE_VALIDO
JUMP TRANSPORTE_INVALIDO

LABEL TRANSPORTE_VALIDO

! Escreva "Transporte valido."
CONST 19
GLOBAL c04ex05.%5
GLOBAL Out.String
CALL 2
JUMP FIM_VALIDACAO

LABEL TRANSPORTE_INVALIDO

! Escreva "Transporte invalido."
CONST 21
GLOBAL c04ex05.%6
GLOBAL Out.String
CALL 2

LABEL FIM_VALIDACAO

! Salta linha
LINE 33
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c04ex05.transp 1
GLOVAR c04ex05.transpMaiusc 1

! Texto "Escolha o tipo de transporte:"
DEFINE c04ex05.%1
STRING 4573636F6C6861206F207469706F206465207472616E73706F7274653A00

! Texto "[M] - Motocicleta"
DEFINE c04ex05.%2
STRING 5B4D5D202D204D6F746F6369636C65746100

! Texto "[S] - Scooter"
DEFINE c04ex05.%3
STRING 5B535D202D2053636F6F74657200

! Texto "==> "
DEFINE c04ex05.%4
STRING 3D3D3E2000

! Texto "Transporte valido."
DEFINE c04ex05.%5
STRING 5472616E73706F7274652076616C69646F2E00

! Texto "Transporte invalido."
DEFINE c04ex05.%6
STRING 5472616E73706F72746520696E76616C69646F2E00
