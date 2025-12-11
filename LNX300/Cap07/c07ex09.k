MODULE c07ex09 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Função: Fibonacci(n) => fib
PROC c07ex09.Fibonacci 4 0 0

! Se (n = 0) .ou. (n = 1) Então
LDLW 12
JEQZ CASO_BASE_0
LDLW 12
CONST 1
JNEQ FIBONACCI
LABEL CASO_BASE_0

! resp := n
LDLW 12
STLW -4
JUMP FIM_FIBONACCI
LABEL FIBONACCI

! resp := Fibonacci(n - 1) + Fibonacci(n - 2)
LDLW 12
DEC
GLOBAL c07ex09.Fibonacci
CALLW 1
LDLW 12
CONST 2
MINUS
GLOBAL c07ex09.Fibonacci
CALLW 1
PLUS
STLW -4
LABEL FIM_FIBONACCI

! RETURN resp
LDLW -4
RETURN
END

PROC c07ex09.%main 0 0 0

! Escreva "Qual termo de Fibonacci: "
CONST 26
GLOBAL c07ex09.%1
GLOBAL Out.String
CALL 2

! Leia limite
GLOBAL c07ex09.limite
GLOBAL In.Int
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Sequencia => "
CONST 14
GLOBAL c07ex09.%2
GLOBAL Out.String
CALL 2

! Leia limite
CONST 0
LDGW c07ex09.limite
GLOBAL Out.Int
CALL 2

! Escreva " = "
CONST 4
GLOBAL c07ex09.%3
GLOBAL Out.String
CALL 2

! Para i de 1 Até limite Faça
CONST 1
STGW c07ex09.i
LABEL REPETE_LOOP
LDGW c07ex09.i
LDGW c07ex09.limite
JGT FIM_LOOP

! Escreva Fibonacci(i)
CONST 0
LDGW c07ex09.i
GLOBAL c07ex09.Fibonacci
CALLW 1
GLOBAL Out.Int
CALL 2

! Escreva " "
CONST 2
GLOBAL c07ex09.%4
GLOBAL Out.String
CALL 2

! i := i + 1
LDGW c07ex09.i
INC
STGW c07ex09.i
JUMP REPETE_LOOP
LABEL FIM_LOOP

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex09.limite 4
GLOVAR c07ex09.i 4

! Texto "Qual termo de Fibonacci: "
DEFINE c07ex09.%1
STRING 5175616C207465726D6F206465204669626F6E616363693A2000

! Texto "Sequencia => "
DEFINE c07ex09.%2
STRING 53657175656E636961203D3E2000

! Texto " = "
DEFINE c07ex09.%3
STRING 203D2000

! Texto " "
DEFINE c07ex09.%4
STRING 2000
