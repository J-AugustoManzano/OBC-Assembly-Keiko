MODULE c04ex01 0xFFFFFFFF  0
IMPORT In  0x1d6e8955
IMPORT Out 0x190c339a
ENDHDR

PROC c04ex01.%main 0 0 0

! Leia valor
GLOBAL c04ex01.valor
GLOBAL In.Real
CALL 1

! Se (valor >= 10.0) Então
LDGF c04ex01.valor
FCONST 10.0
FJLT FIM_SE 

! Escreva valor
CONST 2
CONST 0
LDGF c04ex01.valor
CONVFD
GLOBAL Out.Fixed
CALL 4
GLOBAL Out.Ln
CALL 0

LABEL FIM_SE

RETURN
END

! Variável global
GLOVAR c04ex01.valor 4
