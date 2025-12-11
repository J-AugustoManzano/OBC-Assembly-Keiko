MODULE listcs;

IMPORT Out, Files;

CONST
  TamMaxLinha = 256;

VAR
  arq: Files.File;
  car: CHAR;
  linha: ARRAY TamMaxLinha OF CHAR;
  indice: INTEGER;

PROCEDURE LerLinha(VAR sucesso: BOOLEAN);
BEGIN
  indice := 0;
  WHILE (indice < TamMaxLinha - 1) DO
    IF Files.Eof(arq) THEN
      sucesso := (indice # 0);
      linha[indice] := 0X;
      RETURN
    END;
    Files.ReadChar(arq, car);
    IF (car = CHR(10)) THEN
      IF (indice > 0) & (linha[indice-1] = CHR(13)) THEN 
        DEC(indice) 
      END;
      linha[indice] := 0X;
      sucesso := TRUE;
      RETURN
    END;
    linha[indice] := car;
    INC(indice)
  END;
  linha[indice] := 0X;
  sucesso := TRUE
END LerLinha;

PROCEDURE ComecaComImport(VAR resultado: BOOLEAN);
BEGIN
  resultado := (linha[0] = 'I') & 
               (linha[1] = 'M') & 
               (linha[2] = 'P') &
               (linha[3] = 'O') & 
               (linha[4] = 'R') & 
               (linha[5] = 'T') &
               (linha[6] = ' ')
END ComecaComImport;

PROCEDURE ImprimirInfoImportacao;
VAR
  j, k: INTEGER;
  nome: ARRAY 32 OF CHAR;
  hex: ARRAY 12 OF CHAR;
BEGIN
  j := 7; k := 0;

  WHILE (linha[j] # ' ') & (linha[j] # 0X) & (k < LEN(nome)-1) DO
    nome[k] := linha[j];
    INC(j); INC(k)
  END;
  nome[k] := 0X;

  WHILE (linha[j] = ' ') & (linha[j] # 0X) DO 
    INC(j) 
  END;

  k := 0;
  WHILE (linha[j] # 0X) & (k < LEN(hex)-1) DO
    hex[k] := linha[j];
    INC(j); INC(k)
  END;
  hex[k] := 0X;

  Out.String("Checksum: "); Out.String(hex);
  Out.String(" | Modulo: "); Out.String(nome); Out.Ln;
END ImprimirInfoImportacao;

VAR
  ok, ehImportacao: BOOLEAN;

BEGIN
  Out.String("Lendo 'checksum.k'..."); Out.Ln;
  arq := Files.Open("checksum.k", "r");

  IF arq = NIL THEN
    Out.String("Arquivo nao encontrado."); Out.Ln
  ELSE
    LerLinha(ok);
    WHILE (ok) DO
      ComecaComImport(ehImportacao);
      IF (ehImportacao) THEN
        ImprimirInfoImportacao
      END;
      LerLinha(ok)
    END;
    Files.Close(arq)
  END
END listcs.
