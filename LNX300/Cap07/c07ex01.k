MODULE c07ex01 0xFFFFFFFF 0
IMPORT Out 0x66adaa46
ENDHDR

! Procedimento: LinhaSeparadora
PROC c07ex01.LinhaSeparadora 0 0 0

! Escreva "--------------------------------"
CONST 33
GLOBAL c07ex01.%1
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

RETURN
END

! Procedimento: MostrarSaudacao
PROC c07ex01.MostrarSaudacao 0 0 0

! Escreva "   Bem-vindo ao OBC-Assembly!"
CONST 30
GLOBAL c07ex01.%2
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

RETURN
END

PROC c07ex01.%main 0 0 0

! Executa linha separadora
GLOBAL c07ex01.LinhaSeparadora
CALL 0

! Escreve mensagem de saudação
GLOBAL c07ex01.MostrarSaudacao
CALL 0

! Executa linha separadora
GLOBAL c07ex01.LinhaSeparadora
CALL 0

RETURN
END

! Texto "--------------------------------"
DEFINE c07ex01.%1
STRING 2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D2D00

! Texto "   Bem-vindo ao OBC-Assembly!"
DEFINE c07ex01.%2
STRING 20202042656D2D76696E646F20616F204F42432D417373656D626C792100
