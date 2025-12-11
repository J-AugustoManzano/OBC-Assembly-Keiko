MODULE c04ex06 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

PROC c04ex06.%main 0 0 0

! Escreva "Classificacao esportiva"
CONST 24
GLOBAL c04ex06.%1
GLOBAL Out.String
CALL 2

! Salta linha 2 vezes
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "Entre '1' se atleta pontuou na 1a. prova"
CONST 41
GLOBAL c04ex06.%2
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Entre '1' se atleta pontuou na 2a. prova"
CONST 41
GLOBAL c04ex06.%3
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Qualquer outro valor se nao pontuou nas provas"
CONST 47
GLOBAL c04ex06.%4
GLOBAL Out.String
CALL 2

! Salta linha 2 vezes
GLOBAL Out.Ln
CALL 0
GLOBAL Out.Ln
CALL 0

! Escreva "Prova 1: "
CONST 10
GLOBAL c04ex06.%5
GLOBAL Out.String
CALL 2

! Leia p1
GLOBAL c04ex06.p1
GLOBAL In.Int
CALL 1

! Escreva "Prova 2: "
CONST 10
GLOBAL c04ex06.%6
GLOBAL Out.String
CALL 2

! Leia p2
GLOBAL c04ex06.p2
GLOBAL In.Int
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Se (p1 = 1) .xou. (p2 = 1) Então
LDGW c04ex06.p1
CONST 1
JEQ P1_VERDADEIRO
LDGW c04ex06.p2
CONST 1
JEQ XOR_VERDADEIRO
JUMP XOR_FALSO

LABEL P1_VERDADEIRO
LDGW c04ex06.p2
CONST 1
JNEQ XOR_VERDADEIRO
JUMP XOR_FALSO

LABEL XOR_VERDADEIRO

! Escreva "Atleta participa da terceira prova."
CONST 36
GLOBAL c04ex06.%7
GLOBAL Out.String
CALL 2
JUMP FIM_VERIFICACAO_XOR

LABEL XOR_FALSO

! Escreva "Atleta nao participa da terceira prova."
CONST 40
GLOBAL c04ex06.%8
GLOBAL Out.String
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

! Se (p1 = 1) .e. (p2 = 1) Então
LDGW c04ex06.p1
CONST 1
JNEQ DESCLASSIFICADO
LDGW c04ex06.p2
CONST 1
JNEQ DESCLASSIFICADO

! Escreva "Classificado para a final."
CONST 27
GLOBAL c04ex06.%9
GLOBAL Out.String
CALL 2
JUMP FIM_VERIFICACAO_XOR
LABEL DESCLASSIFICADO

! Escreva "Desclassificado da competicao."
CONST 31
GLOBAL c04ex06.%10
GLOBAL Out.String
CALL 2
LABEL FIM_VERIFICACAO_XOR

! Salata linha 
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c04ex06.p1 4
GLOVAR c04ex06.p2 4

! Texto "Classificacao esportiva"
DEFINE c04ex06.%1
STRING 436C617373696669636163616F206573706F727469766100

! Texto "Entre '1' se atleta pontuou na 1a. prova"
DEFINE c04ex06.%2
STRING 456E747265202731272073652061746C65746120706F6E74756F75206E612031612E2070726F766100

! Texto "Entre '1' se atleta pontuou na 2a. prova"
DEFINE c04ex06.%3
STRING 456E747265202731272073652061746C65746120706F6E74756F75206E612032612E2070726F766100

! Texto "Qualquer outro valor se nao pontuou nas provas"
DEFINE c04ex06.%4
STRING 5175616C71756572206F7574726F2076616C6F72207365206E616F20706F6E74756F75206E61732070726F76617300

! Texto "Prova 1: "
DEFINE c04ex06.%5
STRING 50726F766120313A2000

! Texto "Prova 2: "
DEFINE c04ex06.%6
STRING 50726F766120323A2000

! Texto "Atleta participa da terceira prova."
DEFINE c04ex06.%7
STRING 41746C657461207061727469636970612064612074657263656972612070726F76612E00

! Texto "Atleta nao participa da terceira prova."
DEFINE c04ex06.%8
STRING 41746C657461206E616F207061727469636970612064612074657263656972612070726F76612E00

! Texto "Classificado para a final."
DEFINE c04ex06.%9
STRING 436C6173736966696361646F207061726120612066696E616C2E00

! Texto "Desclassificado da competicao."
DEFINE c04ex06.%10
STRING 446573636C6173736966696361646F20646120636F6D7065746963616F2E00
