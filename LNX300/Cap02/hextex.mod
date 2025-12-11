MODULE hextex;

IMPORT In, Out;

CONST
  tamHex = 512;
  tamTexto = 256;

VAR
  entraHex: ARRAY tamHex OF CHAR;
  saidaTex: ARRAY tamTexto OF CHAR;
  i, j, valCarac: INTEGER;
  digitoHex1, digitoHex2: CHAR;
  continua: BOOLEAN;

PROCEDURE HexToInt(c: CHAR): INTEGER;
VAR
  resultado: INTEGER;
BEGIN
  IF (c >= '0') & (c <= '9') THEN
    resultado := ORD(c) - ORD('0')
  ELSIF (c >= 'A') & (c <= 'F') THEN
    resultado := ORD(c) - ORD('A') + 10
  ELSIF (c >= 'a') & (c <= 'f') THEN
    resultado := ORD(c) - ORD('a') + 10
  ELSE
    resultado := 0
  END;
  RETURN resultado
END HexToInt;

BEGIN
  Out.String("Entre sequencia hexadecimal (ex: 414243 ou 41424300): ");
  In.Line(entraHex); Out.Ln;

  Out.String("Texto decodificado: ");
  Out.Ln; Out.Ln;

  i := 0;
  j := 0;

  continua := TRUE;
  WHILE continua DO
    IF (entraHex[i] = 0X) OR (entraHex[i + 1] = 0X) OR (j >= tamTexto) THEN
      continua := FALSE;
    ELSE
      digitoHex1 := entraHex[i];
      digitoHex2 := entraHex[i + 1];

      valCarac := HexToInt(digitoHex1) * 16 + HexToInt(digitoHex2);

      IF valCarac = 0 THEN
        continua := FALSE;
      ELSE
        saidaTex[j] := CHR(valCarac);
        INC(j);
        INC(i, 2);
      END;
      
    END;
  END;

  saidaTex[j] := 0X;

  Out.String(saidaTex);
  Out.Ln;

END hextex.
