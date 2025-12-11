MODULE c07ex06 0xFFFFFFFF 0
IMPORT In  0x1d6e8955
IMPORT Out 0x190c339a
ENDHDR

! Função: Fatorial(n) => fat
PROC c07ex06.Fatorial 12 0 0

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
LINE 14
LDLW -4
LDLW -8
TIMES
STLW -4

! i := i + 1
LINE 13
INCL -8
JUMP FATORIAL
LABEL FIM_FATORIAL

! Retorna fat
LDLW -4

RETURND
END

PROC c07ex06.%main 0 0 0

! Escreva "Qual fatorial: "
CONST 16
GLOBAL c07ex06.%1
GLOBAL Out.String
CALL 2

! Leia limite
GLOBAL c07ex06.limite
GLOBAL In.Int
CALL 1

! Escreva "Fatorial = "
CONST 12
GLOBAL c07ex06.%2
GLOBAL Out.String
CALL 2

! Escreva Fatorial(limite)
CONST 0
LDGW c07ex06.limite
GLOBAL c07ex06.Fatorial
CALLW 1
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variável global
GLOVAR c07ex06.limite 4

! Texto "Qual fatorial: "
DEFINE c07ex06.%1
STRING 5175616C206661746F7269616C3A2000

! Texto "Fatorial = "
DEFINE c07ex06.%2
STRING 4661746F7269616C203D2000
