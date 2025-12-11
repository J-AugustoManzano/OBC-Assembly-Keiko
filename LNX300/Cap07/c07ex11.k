MODULE c07ex11 0xFFFFFFFF 0
IMPORT In  0x5d1e568e
IMPORT Out 0x66adaa46
ENDHDR

! Função: FibonacciBase(n, x, y) => resp
PROC c07ex11.FibonacciBase 4 0 0

! Se (n = 0) Então
LDLW 12
JNEQZ CASO_BASE_1

! resp := x
LDLW 16
STLW -4
JUMP FIM_FIBONACCI_BASE
LABEL CASO_BASE_1

! Senão Se (n = 1) Então
LDLW 12
CONST 1
JNEQ CASO_BASE_2

! resp := y
LDLW 20
STLW -4
JUMP FIM_FIBONACCI_BASE
LABEL CASO_BASE_2

! resp := FibonacciBase(n - 1, y, x + y)
LDLW 16
LDLW 20
PLUS
LDLW 20
LDLW 12
DEC
GLOBAL c07ex11.FibonacciBase
CALLW 3
STLW -4
LABEL FIM_FIBONACCI_BASE

! Retorna resp
LDLW -4
RETURN
END

! Função: Fibonacci(n) => fib
PROC c07ex11.Fibonacci 0 0 0

CONST 1
CONST 0
LDLW 12
GLOBAL c07ex11.FibonacciBase
CALLW 3

! Retorna FibonacciBase(n, 0, 1)
RETURN
END

PROC c07ex11.%main 0 0 0

! Escreva "Qual termo de Fibonacci: "
CONST 26
GLOBAL c07ex11.%1
GLOBAL Out.String
CALL 2

! Leia limite
GLOBAL c07ex11.limite
GLOBAL In.Int
CALL 1

! Salta linha
GLOBAL Out.Ln
CALL 0

! Escreva "Sequencia => "
CONST 14
GLOBAL c07ex11.%2
GLOBAL Out.String
CALL 2

! Escreva limite
CONST 0
LDGW c07ex11.limite
GLOBAL Out.Int
CALL 2

! Escreva " = "
CONST 4
GLOBAL c07ex11.%3
GLOBAL Out.String
CALL 2

! Para i de 1 Até limite Faça
CONST 1
STGW c07ex11.i
LABEL INICIO_LOOP_FIBONACCI
LDGW c07ex11.i
LDGW c07ex11.limite
JGT FIM_LOOP_FIBONACCI

! Escreva Fibonacci(i)
CONST 0
LDGW c07ex11.i
GLOBAL c07ex11.Fibonacci
CALLW 1
GLOBAL Out.Int
CALL 2

! Escreva " "
CONST 2
GLOBAL c07ex11.%4
GLOBAL Out.String
CALL 2

! i := i + 1
LDGW c07ex11.i
INC
STGW c07ex11.i
JUMP INICIO_LOOP_FIBONACCI
LABEL FIM_LOOP_FIBONACCI

! Salta linha
GLOBAL Out.Ln
CALL 0

RETURN
END

! Variáveis globais
GLOVAR c07ex11.limite 4
GLOVAR c07ex11.i 4

! Texto "Qual termo de Fibonacci: "
DEFINE c07ex11.%1
STRING 5175616C207465726D6F206465204669626F6E616363693A2000

! Texto "Sequencia => "
DEFINE c07ex11.%2
STRING 53657175656E636961203D3E2000

! Texto " = "
DEFINE c07ex11.%3
STRING 203D2000

! Texto " "
DEFINE c07ex11.%4
STRING 2000
