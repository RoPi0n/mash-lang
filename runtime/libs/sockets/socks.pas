library Socks;

uses SysUtils,
     Classes,
     blcksock;

{$I '..\svm.inc'}

type
  TMashSocket = class
    public
      sock: TBlockSocket;
      constructor Create;
      destructor Destroy; override;

      procedure Close;

      procedure Connect(host: string; port: cardinal);
      procedure Bind(host: string; port: cardinal);
      procedure Listen;
      function  Accept: TMashSocket;
      procedure SetTimeOut(ms: integer);
      procedure SetBlockingMode(bool: integer);

      procedure SendStream(Stream: TStream);
      procedure SendString(Str: string);
      procedure ReceiveStream(Stream: TStream; TimeOut: integer);
      function  Receive(Stream: TStream; Len: integer): integer;
      function  ReceiveString(TimeOut: integer): string;
  end;

constructor TMashSocket.Create;
begin
  sock := TBlockSocket.Create;
end;

destructor TMashSocket.Destroy;
begin
  sock.Free;
  inherited Destroy;
end;

procedure TMashSocket.Close;
begin
  sock.CloseSocket;
end;

procedure TMashSocket.Connect(host: string; port: cardinal);
begin
  sock.Connect(host, IntToStr(port));
end;

procedure TMashSocket.Bind(host: string; port: cardinal);
begin
  sock.Bind(host, IntToStr(port));
end;

procedure TMashSocket.Listen;
begin
  sock.Listen;
end;

function TMashSocket.Accept: TMashSocket;
begin
  Result := TMashSocket.Create;
  Result.sock.Socket := sock.Accept;
end;

procedure TMashSocket.SetTimeOut(ms: integer);
begin
  sock.SetTimeout(ms);
end;

procedure TMashSocket.SetBlockingMode(bool: integer);
begin
  // true  - block
  // false - no block
  sock.NonBlockMode := bool <> -1;
end;

procedure TMashSocket.SendStream(Stream: TStream);
begin
  Stream.Seek(0, soFromBeginning);
  sock.SendStreamRaw(Stream);
end;

procedure TMashSocket.SendString(Str: string);
begin
  sock.SendString(Str + CRLF);
end;

procedure TMashSocket.ReceiveStream(Stream: TStream; TimeOut: integer);
begin
  sock.RecvStream(Stream, TimeOut);
end;

function TMashSocket.Receive(Stream: TStream; Len: integer): integer;
var
  Buf: TBytes;
begin
  SetLength(Buf, Len);
  Result := sock.RecvBuffer(@Buf, Len);
  Stream.Write(Buf, Result);
  SetLength(Buf, 0);
end;

function TMashSocket.ReceiveString(TimeOut: integer): string;
begin
  Result := sock.RecvString(TimeOut);
end;

// Exports

procedure SockDestroy(obj: pointer); stdcall;
begin
  TMashSocket(obj).Free;
end;

procedure _Socket_Create(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TMashSocket.Create, @SockDestroy);
end;

procedure _Socket_Close(pctx: pointer); stdcall;
begin
  TMashSocket(__Next_Ref(pctx)).Close;
end;

procedure _Socket_Connect(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  host: string;
  port: cardinal;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  host := __Next_String(pctx);
  port := __Next_Word(pctx);
  sock.Connect(host, port);
  try
    sock.sock.ExceptCheck;
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

procedure _Socket_Bind(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  host: string;
  port: cardinal;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  host := __Next_String(pctx);
  port := __Next_Word(pctx);
  sock.Bind(host, port);
  try
    sock.sock.ExceptCheck;
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

procedure _Socket_Listen(pctx: pointer); stdcall;
begin
  TMashSocket(__Next_Ref(pctx)).Listen;
end;

procedure _Socket_Accept(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TMashSocket(__Next_Ref(pctx)).Accept, @SockDestroy);
end;

procedure _Socket_SetTimeOut(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  tm: integer;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  tm := __Next_Int(pctx);
  sock.SetTimeOut(tm);
end;

procedure _Socket_SetBlockingMode(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  bm: integer;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  bm := __Next_Int(pctx);
  sock.SetBlockingMode(bm);
end;

procedure _Socket_SendStream(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  stream: TStream;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  stream := TStream(__Next_Ref(pctx));
  sock.SendStream(stream);
  try
    sock.sock.ExceptCheck;
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

procedure _Socket_SendString(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  str: string;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  str := __Next_String(pctx);
  sock.SendString(str);
  try
    sock.sock.ExceptCheck;
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

procedure _Socket_ReceiveStream(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  stream: TStream;
  tm: integer;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  stream := TStream(__Next_Ref(pctx));
  tm := __Next_Int(pctx);
  sock.ReceiveStream(stream, tm);
  try
    sock.sock.ExceptCheck;
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

procedure _Socket_ReceiveBuffer(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  stream: TStream;
  len, gt: integer;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  stream := TStream(__Next_Ref(pctx));
  len := __Next_Int(pctx);
  gt := sock.Receive(stream, len);
  try
    sock.sock.ExceptCheck;
    __Return_Int(pctx, gt);
  except
    __Return_Null(pctx);
  end;
end;

procedure _Socket_ReceiveString(pctx: pointer); stdcall;
var
  sock: TMashSocket;
  tm: integer;
  s: string;
begin
  sock := TMashSocket(__Next_Ref(pctx));
  tm := __Next_Int(pctx);
  s := sock.ReceiveString(tm);
  try
    sock.sock.ExceptCheck;
    __Return_String(pctx, s);
  except
    __Return_Null(pctx);
  end;
end;



{  EXPORTS  }
exports  _Socket_Create             name '_Socket_Create';
exports  _Socket_Close              name '_Socket_Close';
exports  _Socket_Connect            name '_Socket_Connect';
exports  _Socket_Bind               name '_Socket_Bind';
exports  _Socket_Listen             name '_Socket_Listen';
exports  _Socket_Accept             name '_Socket_Accept';
exports  _Socket_SetTimeOut         name '_Socket_SetTimeOut';
exports  _Socket_SetBlockingMode    name '_Socket_SetBlockingMode';
exports  _Socket_SendStream         name '_Socket_SendStream';
exports  _Socket_SendString         name '_Socket_SendString';
exports  _Socket_ReceiveStream      name '_Socket_ReceiveStream';
exports  _Socket_ReceiveBuffer      name '_Socket_ReceiveBuffer';
exports  _Socket_ReceiveString      name '_Socket_ReceiveString';

begin
end.
