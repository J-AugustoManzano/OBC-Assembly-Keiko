MODULE Calc 0x00000001 0
ENDHDR

! Função: Somatorio(n) => soma
PROC Calc.Somatorio 12 0 0

! soma := 0
CONST 0
STLW -8

! Para i de 1 Até n Faça
LDLW 12
STLW -12
CONST 1
STLW -4
LABEL SOMATORIO
LDLW -4
LDLW -12
JGT FIM_SOMATORIO

! soma := soma + i
LDLW -8
LDLW -4
PLUS
STLW -8

! i := i + 1
INCL -4
JUMP SOMATORIO
LABEL FIM_SOMATORIO

! Retorna soma
LDLW -8

RETURN
END
