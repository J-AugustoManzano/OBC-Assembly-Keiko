MODULE c07ex07 0xFFFFFFFF 0
IMPORT In 0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Função: Igual(a, b) => a = b
PROC c07ex07.Igual 0 0 0

LDLF 12
LDLF 16
FEQ

! Retorna a = b
RETURN
END

PROC c07ex07.%main 0 0 0

! Escreva "Informe o 1o. valor: "
CONST 22
GLOBAL c07ex07.%1
GLOBAL Out.String
CALL 2

! Leia x
GLOBAL c07ex07.x
GLOBAL In.Real
CALL 1

! Escreva "Informe o 2o. valor: "
CONST 22
GLOBAL c07ex07.%2
GLOBAL Out.String
CALL 2

! Leia y
GLOBAL c07ex07.y
GLOBAL In.Real
CALL 1

! Se (Igual(x, y)) Então
LDGF c07ex07.y
LDGF c07ex07.x
GLOBAL c07ex07.Igual
CALLW 2
JEQZ SE_DIFERENTE

! Escreva "Valores sao iguais"
CONST 19
GLOBAL c07ex07.%3
GLOBAL Out.String
CALL 2
JUMP FIM_SE
LABEL SE_DIFERENTE

! Escreva "Valores sao diferentes"
CONST 23
GLOBAL c07ex07.%4
GLOBAL Out.String
CALL 2
LABEL FIM_SE

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex07.x 4
GLOVAR c07ex07.y 4

! Texto "Informe o 1o. valor: "
DEFINE c07ex07.%1
STRING 496E666F726D65206F20316F2E2076616C6F723A2000

! Texto "Informe o 2o. valor: "
DEFINE c07ex07.%2
STRING 496E666F726D65206F20326F2E2076616C6F723A2000

! Texto "Valores sao iguais"
DEFINE c07ex07.%3
STRING 56616C6F7265732073616F2069677561697300

! Texto "Valores sao diferentes"
DEFINE c07ex07.%4
STRING 56616C6F7265732073616F206469666572656E74657300
