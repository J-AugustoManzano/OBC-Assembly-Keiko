MODULE c07ex08 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Função: Fatorial(n) => fat
PROC c07ex08.Fatorial 4 0 0

! Se (n = 0) Então
LDLW 12
JNEQZ FIM_FATORIAL

! resp := 1
CONST 1
STLW -4
JUMP FATORIAL
LABEL FIM_FATORIAL

! resp := n * Fatorial(n - 1)
LDLW 12
LDLW 12
DEC
GLOBAL c07ex08.Fatorial
CALLW 1
TIMES
STLW -4
LABEL FATORIAL

! Retorna resp
LDLW -4
RETURN
END

PROC c07ex08.%main 0 0 0

! Escreva "Qual fatorial: "
CONST 16
GLOBAL c07ex08.%1
GLOBAL Out.String
CALL 2

! Leia limite
GLOBAL c07ex08.limite
GLOBAL In.Int
CALL 1

! Escreva "Fatorial = "
CONST 12
GLOBAL c07ex08.%2
GLOBAL Out.String
CALL 2

! Escreva Fatorial(limite)
CONST 0
LDGW c07ex08.limite
GLOBAL c07ex08.Fatorial
CALLW 1
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variável global
GLOVAR c07ex08.limite 4

! Texto "Qual fatorial: "
DEFINE c07ex08.%1
STRING 5175616C206661746F7269616C3A2000

! Texto "Fatorial = "
DEFINE c07ex08.%2
STRING 4661746F7269616C203D2000
