MODULE c07ex04 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Procedimento: fatorial(n)
PROC c07ex04.fatorial 12 0 0

! fat := 1
CONST 1
STLW -4

! Para i de 1 Até n Faça
LDLW 12
STLW -12
CONST 1
STLW -8
LABEL FATORIAL
LDLW -8
LDLW -12
JGT FIM_FATORIAL

! fat := fat * i
LDLW -4
LDLW -8
TIMES
STLW -4

! i := i + 1
INCL -8
JUMP FATORIAL
LABEL FIM_FATORIAL

! Escreva "Fatorial = "
CONST 12
GLOBAL c07ex04.%1
GLOBAL Out.String
CALL 2

! Escreva fat
CONST 0
LDLW -4

! Salta linha (2 x)
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0

RETURN
END

PROC c07ex04.%main 0 0 0

! Escreva "Qual fatorial: "
CONST 16
GLOBAL c07ex04.%2
GLOBAL Out.String
CALL 2

! Leia limite)
GLOBAL c07ex04.limite
GLOBAL In.Int
CALL 1

! fatorial(limite)
LDGW c07ex04.limite
GLOBAL c07ex04.fatorial
CALL 1

RETURN
END

! Variável global
GLOVAR c07ex04.limite 4

! Texto "Fatorial = "
DEFINE c07ex04.%1
STRING 4661746F7269616C203D2000

! Texto "Qual fatorial: "
DEFINE c07ex04.%2
STRING 5175616C206661746F7269616C3A2000
