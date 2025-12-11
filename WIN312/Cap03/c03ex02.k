MODULE c03ex02 0xXXXXXXXX 0
IMPORT In  0x1d6e8955
IMPORT Out 0x190c339a
ENDHDR

PROC c03ex02.%main 0 0 0

! Escreva "Informe nome ....: "
CONST 20
GLOBAL c03ex02.%1
GLOBAL Out.String
CALL 2

! Leia nome
CONST 100
GLOBAL c03ex02.nome
GLOBAL In.Line
CALL 2

! Escreva "Informe idade ...: "
CONST 20
GLOBAL c03ex02.%2
GLOBAL Out.String
CALL 2

! Leia idade
GLOBAL c03ex02.idade
GLOBAL In.Int
CALL 1

! Escreva "Informe altura ..: "
CONST 20
GLOBAL c03ex02.%3
GLOBAL Out.String
CALL 2

! Leia altura
GLOBAL c03ex02.altura
GLOBAL In.Real
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Nome.....: "
CONST 12
GLOBAL c03ex02.%4
GLOBAL Out.String
CALL 2
CONST 100
GLOBAL c03ex02.nome
GLOBAL Out.String
CALL 2
GLOBAL Out.Ln
CALL 0

! Escreva "Idade ...: "
CONST 12
GLOBAL c03ex02.%5
GLOBAL Out.String
CALL 2
CONST 0
LDGW c03ex02.idade
GLOBAL Out.Int
CALL 2
GLOBAL Out.Ln
CALL 0

! Escreva "Altura ..: "
CONST 12
GLOBAL c03ex02.%6
GLOBAL Out.String
CALL 2
CONST 2
CONST 0
LDGF c03ex02.altura
CONVFD
GLOBAL Out.Fixed
CALL 4
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c03ex02.nome   100
GLOVAR c03ex02.idade    4
GLOVAR c03ex02.altura   4

! String "Informe nome ....: "
DEFINE c03ex02.%1
STRING 496E666F726D65206E6F6D65202E2E2E2E3A2000

! String "Informe idade ...: "
DEFINE c03ex02.%2
STRING 496E666F726D65206964616465202E2E2E3A2000

! String "Informe altura ..: "
DEFINE c03ex02.%3
STRING 496E666F726D6520616C74757261202E2E3A2000

! String "Nome.....: "
DEFINE c03ex02.%4
STRING 4E6F6D652E2E2E2E2E3A2000

! String "Idade ...: "
DEFINE c03ex02.%5
STRING 4964616465202E2E2E3A2000

! String "Altura ..: "
DEFINE c03ex02.%6
STRING 416C74757261202E2E3A2000
