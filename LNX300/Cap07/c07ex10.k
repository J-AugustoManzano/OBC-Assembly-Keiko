MODULE c07ex10 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Função: FATORIAL_BASE(n, p) => resp
PROC c07ex10.FATORIAL_BASE 4 0 0

! Se (n = 0) Então
LDLW 12
JNEQZ FATORIAL_BASE

! resp := p
LDLW 16
STLW -4
JUMP FIM_FATORIAL_BASE

LABEL FATORIAL_BASE

! resp := FATORIAL_BASE(n - 1, n * p)
LDLW 12
LDLW 16
TIMES
LDLW 12
DEC
GLOBAL c07ex10.FATORIAL_BASE
CALLW 2
STLW -4

LABEL FIM_FATORIAL_BASE

! Retorna resp
LDLW -4
RETURN
END

! Função: Fatorial(n) => fat
PROC c07ex10.Fatorial 0 0 0

! Chamada inicial com p = 1
CONST 1
LDLW 12
GLOBAL c07ex10.FATORIAL_BASE
CALLW 2

! Retorna fat
RETURN
END

PROC c07ex10.%main 0 0 0

! Escreva "Qual fatorial: "
CONST 16
GLOBAL c07ex10.%1
GLOBAL Out.String
CALL 2

! Leia limite
GLOBAL c07ex10.limite
GLOBAL In.Int
CALL 1

! Escreva "Fatorial = "
CONST 12
GLOBAL c07ex10.%2
GLOBAL Out.String
CALL 2

! Escreva Fatorial(limite)
CONST 0
LDGW c07ex10.limite
GLOBAL c07ex10.Fatorial
CALLW 1
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variável global
GLOVAR c07ex10.limite 4

! Texto "Qual fatorial: "
DEFINE c07ex10.%1
STRING 5175616C206661746F7269616C3A2000

! Texto "Fatorial = "
DEFINE c07ex10.%2
STRING 4661746F7269616C203D2000
