library Socks;

uses SysUtils, Classes, Sockets, Winsock2;

{$I ..\adp.inc}

{FUNCTIONS}

procedure _WSAStartup(Stack:PStack); cdecl;
var
  WSAD:PWSAData;
begin
  new(WSAD);
  WSAStartup(PMem(Stack^.popv)^, WSAD^);
  Stack^.push(WSAD);
end;

procedure _WSACleanup(Stack:PStack); cdecl;
begin
  WSACleanup;
end;

procedure _Socket(Stack:PStack); cdecl;
begin
  Stack^.push(new_svmval(socket(PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^)));
end;

procedure _Connect(Stack:PStack); cdecl;
begin
  connect(TSocket(PMem(Stack^.popv)^), PSockAddr(Stack^.popv)^, PMem(Stack^.popv)^);
end;

procedure _SendMemoryStream(Stack:PStack); cdecl;
var
  Sock:TSocket;
  Strm:TMemoryStream;
begin
  Sock := TSocket(PMem(Stack^.popv)^);
  Strm := TMemoryStream(Stack^.popv);
  send(Sock, Strm.Memory, Strm.Size, PMem(Stack^.popv)^);
end;

procedure _RecvMemoryStream(Stack:PStack); cdecl;
begin
  Stack^.push(new_svmval(recv(TSocket(PMem(Stack^.popv)^), TMemoryStream(Stack^.popv).Memory,
                         PMem(Stack^.popv)^, PMem(Stack^.popv)^)));
end;

procedure _CloseSocket(Stack:PStack); cdecl;
begin
  closesocket(PMem(Stack^.popv)^);
end;

{EXPORTS DB}
exports _WSAStartup           name 'WSAStartup';
exports _WSACleanup           name 'WSACleanup';
exports _Socket               name 'Socket';
exports _Connect              name 'Connect';
exports _SendMemoryStream     name 'SendMemoryStream';
exports _RecvMemoryStream     name 'RecvMemoryStream';
exports _CloseSocket          name 'CloseSocket';

begin
end.
