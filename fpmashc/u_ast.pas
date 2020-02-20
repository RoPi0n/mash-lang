unit u_ast;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_tokens;

type
  TMashBaseAST = class
    protected
      lastTk: TMashToken;

    public
      tokens: TList;
      nodes: TList;

    constructor Create(_tokens: TList);
    destructor Destroy; override;

    // Routines for tokens
    function Token(index: cardinal): TMashToken; inline;
    function NextToken(var index: cardinal): TMashToken; inline;
    function TkNotNull(tk: TMashToken): TMashToken; inline;
    function TkValue(tk: TMashToken): string; inline;
    function TkID(tk: TMashToken): TMashTokenID; inline;
    function TkCheck(tk: TMashToken): string; inline;
    function TkCheckID(tk: TMashToken): TMashTokenID; inline;
    function TkCheckType(tk: TMashToken): TMashTokenType; inline;
    function TkTokenValue(tk: TMashToken): string; inline;
    function TkTokenID(tk: TMashToken): TMashTokenID; inline;
    function TkWordValue(tk: TMashToken): string; inline;
    function TkStrValue(tk: TMashToken): string; inline;
    function TkDigitValue(tk: TMashToken): string; inline;
  end;

implementation

constructor TMashBaseAST.Create(_tokens: TList);
begin
  self.tokens := _tokens;
  self.nodes := TList.Create;
  self.lastTk := nil;
end;

destructor TMashBaseAST.Destroy;
begin
  FreeAndNil(self.nodes);
end;


function TMashBaseAST.Token(index: cardinal): TMashToken;
begin
  if index < self.tokens.count then
   Result := TMashToken(self.tokens[index])
  else
   Result := nil;
end;

function TMashBaseAST.NextToken(var index: cardinal): TMashToken;
var
  tk: TMashToken;
begin
  tk := self.Token(index);

  while tk <> nil do
   begin
     if tk.info <> ttEndOfLine then
      break;

     Inc(index);
     tk := self.Token(index);
   end;

  Result := tk;
end;

function TMashBaseAST.TkNotNull(tk: TMashToken): TMashToken;
begin
  Result := tk;

  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + '''.'
   );
end;


function TMashBaseAST.TkValue(tk: TMashToken): string;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + '''.'
   );

  Result := tk.value;
end;


function TMashBaseAST.TkID(tk: TMashToken): TMashTokenID;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + '''.'
   );

  Result := tk.short;
end;


function TMashBaseAST.TkCheck(tk: TMashToken): string;
begin
  if tk <> nil then
   Result := tk.value
  else
   Result := '';
end;


function TMashBaseAST.TkCheckID(tk: TMashToken): TMashTokenID;
begin
  if tk <> nil then
   Result := tk.short
  else
   Result := tkNull;
end;


function TMashBaseAST.TkCheckType(tk: TMashToken): TMashTokenType;
begin
  if tk <> nil then
   Result := tk.info
  else
   Result := ttNull;
end;


function TMashBaseAST.TkTokenValue(tk: TMashToken): string;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + ''', here should be language token.'
   );

  if tk.info = ttToken then
   Result := tk.value
  else
   raise Exception.Create(
     'Invalid token (' + tk.value + ') at line ' + IntToStr(tk.line + 1) +
     ' at file ''' + tk.filep^ + ''', here should be language token.'
   );
end;


function TMashBaseAST.TkTokenID(tk: TMashToken): TMashTokenID;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + ''', here should be language token.'
   );

  if tk.info = ttToken then
   Result := tk.short
  else
   raise Exception.Create(
     'Invalid token (' + tk.value + ') at line ' + IntToStr(tk.line + 1) +
     ' at file ''' + tk.filep^ + ''', here should be language token.'
   );
end;


function TMashBaseAST.TkWordValue(tk: TMashToken): string;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + ''', here should be word.'
   );

  if tk.info = ttWord then
   Result := tk.value
  else
   raise Exception.Create(
     'Invalid token (' + tk.value + ') at line ' + IntToStr(tk.line + 1) +
     ' at file ''' + tk.filep^ + ''', here should be word.'
   );
end;

function TMashBaseAST.TkStrValue(tk: TMashToken): string;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + ''', here should be string constant.'
   );

  if tk.info = ttString then
   Result := tk.value
  else
   raise Exception.Create(
     'Invalid token (' + tk.value + ') at line ' + IntToStr(tk.line + 1) +
     ' at file ''' + tk.filep^ + ''', here should be string constant.'
   );
end;

function TMashBaseAST.TkDigitValue(tk: TMashToken): string;
begin
  if tk = nil then
   raise Exception.Create(
     'Invalid construction at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + ''', here should be digit constant.'
   );

  if tk.info = ttDigit then
   Result := tk.value
  else
   raise Exception.Create(
     'Invalid token (' + tk.value + ') at line ' + IntToStr(tk.line + 1) +
     ' at file ''' + tk.filep^ + ''', here should be digit constant.'
   );
end;

end.

