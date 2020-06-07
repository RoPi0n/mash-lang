unit u_parser;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_tokens;

const
  AlphaChars: set of char = ['a'..'z', '_'];
  DigitChars: set of char = ['0'..'9'];
  HexChars:   set of char = ['0'..'9', 'a'..'f'];

type
  TMashParser = class
    public
      fp: string;
      code: TStringList;
      tokens: TList;
      line: Cardinal;
      commentGoing: boolean;

      constructor Create(_code: TStringList; _fp: string);
      destructor Destroy;
      procedure Parse;

    private
      procedure ParseLine(s: string);
      procedure Preprocess;
  end;

implementation

constructor TMashParser.Create(_code: TStringList; _fp: string);
begin
  self.code := _code;
  self.fp := _fp;
  self.line := 0;
  self.commentGoing := false;

  self.tokens := TList.Create;
end;



destructor TMashParser.Destroy;
begin
  FreeAndNil(self.tokens);
end;



procedure TMashParser.Parse;
var
  s: string;
  tk: TMashToken;
begin
  while self.code.count > self.line do
   begin
     s := trim(code[self.line]);

     if Length(s) > 0 then
      begin
        self.ParseLine(s);

        if self.tokens.count > 0 then
         begin
           tk := TMashToken(self.tokens[self.tokens.count - 1]);
           if tk.info <> ttEndOfLine then
            self.tokens.add(
              TMashToken.Create('', ttEndOfLine, self.line, self.fp)
            );
         end;
      end;

     inc(self.line);
   end;

  self.Preprocess;
end;

procedure TMashParser.Preprocess;
var
  i:  Cardinal;
  tk, tkL, tkR: TMashToken;
begin
  i := 1;
  while i < (self.tokens.count - 1) do
   begin
     tk := TMashToken(self.tokens[i]);

     if tk.info = ttEndOfLine then
      begin
        tkL := TMashToken(self.tokens[i - 1]);
        tkR := TMashToken(self.tokens[i + 1]);

        if (tkR.info = ttEndOfLine) or
           (tkR.short in MashOperatorsTokens) or
           (tkL.short in MashOperatorsTokens) or
           (tkR.short in [tkComma, tkCBr, tkCRBr, tkByPtr]) or
           (tkL.short in [tkComma, tkOBr, tkORBr, tkByPtr]) then
         begin
           self.tokens.Delete(i);
           i := 0;
         end;
      end;

     inc(i);
   end;
end;


function IsToken(s: string): boolean;
var
  i: TMashTokenID;
begin
  Result := false;
  for i := tkProc to tkReturn do
   if s = MashTokens[i] then
    begin
      Result := true;
      break;
    end;
end;

procedure TMashParser.ParseLine(s: string);
var
  st: string;
  line_ended: boolean;
  ch: char;

  // For token/word
  wrd: string;
  tt: TMashTokenType;

  // For digit/float/hex
  dig: string;
  dot: boolean;

  // Operator search
  t, op, ts: string;
  founded, brk: boolean;
  spaces: word;
  tk: TMashTokenID;
begin
  while Length(s) > 0 do
   begin
     if (copy(s, 1, 2) = '//') and (not self.commentGoing) then
      break;

     if copy(s, 1, 2) = '/*' then
      begin
        self.commentGoing := true;
        Delete(s, 1, 2);
      end;

     while (copy(s, 1, 1) = '"') and (not self.commentGoing) do
      begin
        Delete(s, 1, 1);
        line_ended := false;

        st := '';
        while Length(s) > 0 do
         begin
           if s[1] = '"' then
            begin
              line_ended := true;
              Delete(s, 1, 1);
              break;
            end
           else
            begin
              st := st + s[1];
              Delete(s, 1, 1);
            end;
         end;

        self.tokens.add(
          TMashToken.Create(st, ttString, self.line, self.fp)
        );

        if not line_ended then
          raise Exception.Create(
            'Missed string end ''"'' symbol at line ' +
            IntToStr(self.line + 1) + ' at file ''' + self.fp + '''.'
          );

        s := trim(s);
      end;

     if not self.commentGoing then
      begin
        s := trim(s);

        if Length(s) > 0 then
         begin
           // Searching for word or token
           if LowerCase(s[1]) in AlphaChars then
            begin
              wrd := '';

              while Length(s) > 0 do
               begin
                 ch := LowerCase(s[1]);
                 if (ch in AlphaChars) or (ch in DigitChars) then
                  begin
                    wrd += ch;
                    Delete(s, 1, 1);
                  end
                 else
                   break;
               end;

              if wrd = 'init' then
               begin
                 self.tokens.add(
                   TMashToken.Create('proc', ttToken, self.line, self.fp)
                 );
                 self.tokens.add(
                   TMashToken.Create('create', ttWord, self.line, self.fp)
                 );
               end
              else
               begin
                 if IsToken(wrd) then
                   tt := ttToken
                 else
                   tt := ttWord;

                 self.tokens.add(
                   TMashToken.Create(wrd, tt, self.line, self.fp)
                 );
               end;
            end
           else
            begin
              // Searching for digit|float|hex
              if s[1] in DigitChars then
               begin
                 dig := '';
                 dot := false;

                 if copy(s, 1, 2) = '0x' then
                  begin
                    dig := '$';
                    Delete(s, 1, 2);

                    while (Length(s) > 0) and
                          (LowerCase(copy(s, 1, 1))[1] in HexChars) do
                     begin
                       dig += LowerCase(s[1]);
                       Delete(s, 1, 1);
                     end;
                  end
                 else
                  begin
                    while Length(s) > 0 do
                     begin
                       if s[1] in DigitChars then
                        begin
                          dig += s[1];
                          Delete(s, 1, 1);
                        end
                       else
                        begin
                          if (s[1] = '.') and
                             (not dot) and
                             (copy(s, 2, 1)[1] in DigitChars) then
                           begin
                             dig += s[1];
                             Delete(s, 1, 1);
                             dot := true;
                           end
                          else
                           break;
                        end;
                     end;
                  end;

                 if Length(dig) = 0 then
                   raise Exception.Create(
                     'Invalid token (digit?) at line ' +
                     IntToStr(self.line + 1) + ' at file ''' + self.fp + '''.'
                   );

                 self.tokens.add(
                   TMashToken.Create(dig, ttDigit, self.line, self.fp)
                 );
               end
              // Searching for operator
              else
               begin
                 t := '';
                 op := '';
                 founded := false;
                 brk := false;
                 spaces := 0;

                 ts := s;

                 while (Length(ts) > 0) and (not brk) do
                  begin
                    if ts[1] <> ' ' then
                     t += ts[1]
                    else
                     Inc(spaces);

                    Delete(ts, 1, 1);

                    if IsToken(t) then
                     begin
                       op := t;
                       founded := true;
                     end;

                    brk := true;
                    for tk := tkProc to tkReturn do
                     begin
                       if Pos(t, MashTokens[tk]) > 0 then
                        begin
                          brk := false;
                          break;
                        end;
                     end;
                  end;

                 Delete(s, 1, Length(op) + spaces);

                 if op = '$' then
                  begin
                    self.tokens.add(
                      TMashToken.Create('this', ttWord, self.line, self.fp)
                    );
                    self.tokens.add(
                      TMashToken.Create('->', ttToken, self.line, self.fp)
                    );
                  end
                 else
                  if founded then
                   self.tokens.add(
                     TMashToken.Create(op, ttToken, self.line, self.fp)
                   )
                  else
                   raise Exception.Create(
                     'Unknown operator ''' + op + ''' at line ' +
                     IntToStr(self.line + 1) + ' at file ''' + self.fp + '''.'
                   );
               end;
            end; // strlower(s[0]) in AlphaChars
         end; // len(s) > 0
      end;

     if self.commentGoing then
      begin
        if copy(s, 1, 2) = '*/' then
         begin
           self.commentGoing := false;
           Delete(s, 1, 2);
         end
        else
         if Length(s) > 0 then
          Delete(s, 1, 1);
      end;

     s := trim(s);
   end;
end;

end.

