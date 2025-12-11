MODULE texhex;

IMPORT In, Out;

CONST
  tamTexto = 256;

VAR
  texto: ARRAY tamTexto OF CHAR;
  i: INTEGER;
  carac: CHAR;
  hexCaracBuffer: ARRAY 3 OF CHAR;

PROCEDURE IntToHex(val: INTEGER; VAR hexStr: ARRAY OF CHAR);
VAR
  digito: INTEGER;
BEGIN
  digito := val DIV 16;
  
  IF digito < 10 THEN
    hexStr[0] := CHR(ORD('0') + digito)
  ELSE
    hexStr[0] := CHR(ORD('A') + digito - 10)
  END;

  digito := val MOD 16;
  IF digito < 10 THEN
    hexStr[1] := CHR(ORD('0') + digito)
  ELSE
    hexStr[1] := CHR(ORD('A') + digito - 10)
  END;

  hexStr[2] := 0X;
END IntToHex;


BEGIN
  Out.String("Entre texto para convercao em HEX: ");
  In.Line(texto); Out.Ln;

  Out.String("Texto em hexadecimal (ASCII):"); Out.Ln;
  Out.Ln;

  i := 0;
  WHILE (texto[i] # 0X) & (i < tamTexto) DO
    carac := texto[i];
    
    IntToHex(ORD(carac), hexCaracBuffer);
    
    Out.Char(hexCaracBuffer[0]);
    Out.Char(hexCaracBuffer[1]);
    
    INC(i)
  END;
  Out.Char('0'); Out.Char('0');
  
  Out.Ln;
END texhex.
