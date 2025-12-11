MODULE c07ex05 0xFFFFFFFF 0
IMPORT In  0x1d6e8955
IMPORT Out 0x190c339a
ENDHDR

! Procedimento: fatorial(n, &fat)
PROC c07ex05.fatorial 8 0 0

! fat := 1
CONST 1
LDLW 16
STOREW

! Para i de 1 Até n Faça
LDLW 12
STLW -8
CONST 1
STLW -4
LABEL FATORIAL
LDLW -4
LDLW -8
JGT FIM_FATORIAL

! fat := fat * i
LDLW 16
LOADW
LDLW -4
TIMES
LDLW 16
STOREW

! i := i + 1
INCL -4
JUMP FATORIAL
LABEL FIM_FATORIAL

RETURN
END

PROC c07ex05.%main 0 0 0

! resultado := 1
CONST 1
STGW c07ex05.resultado

! Escreva "Qual fatorial: "
CONST 16
GLOBAL c07ex05.%1
GLOBAL Out.String
CALL 2

! Leia limite
GLOBAL c07ex05.limite
GLOBAL In.Int
CALL 1

! fatorial(limite, resultado);
GLOBAL c07ex05.resultado
LDGW c07ex05.limite
GLOBAL c07ex05.fatorial
CALL 2

! Escreva "Fatorial = "
CONST 12
GLOBAL c07ex05.%2
GLOBAL Out.String
CALL 2

! Escreva resultado
CONST 0
LDGW c07ex05.resultado
GLOBAL Out.Int
CALL 2

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex05.resultado 4
GLOVAR c07ex05.limite 4

! Texto "Qual fatorial: "
DEFINE c07ex05.%1
STRING 5175616C206661746F7269616C3A2000

! Texto "Fatorial = "
DEFINE c07ex05.%2
STRING 4661746F7269616C203D2000
