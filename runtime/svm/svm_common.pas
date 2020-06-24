unit svm_common;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  syncobjs;

type
  TMemory = array of pointer;
  PMemory = ^TMemory;
  TInstructionPointer = cardinal;
  PInstructionPointer = ^TInstructionPointer;
  TByteArr = array of byte;
  PByteArr = ^TByteArr;
  TDbgCallBack = procedure(p: pointer); stdcall;
  PDbgCallBack = ^TDbgCallBack;
  TAppType = (atBin, atCns, atGUI);

var
  DbgCallBack: PDbgCallBack = nil;
  AppType: TAppType = atBin;
  GlobalLock: TCriticalSection;

procedure VMError(m: string);
procedure CutLeftBytes(pb: PByteArr; cnt: cardinal);

implementation

{***** Some functions *********************************************************}

procedure VMError(m: string);
begin
  case AppType of
    atCns:
    begin
      writeln(m);
      halt;
    end;
    else
      raise Exception.Create(m);
  end;
end;

procedure CutLeftBytes(pb: PByteArr; cnt: cardinal);
var
  i: cardinal;
begin
  i := 0;
  while i <= cardinal(length(pb^)) - cnt do
  begin
    pb^[i] := pb^[i + cnt];
    Inc(i);
  end;
  setlength(pb^, cardinal(length(pb^)) - cnt);
end;

end.
