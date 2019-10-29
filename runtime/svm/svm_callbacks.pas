unit svm_callbacks;

{$mode objfpc}
{$H+}

interface

uses
  SysUtils,
  svm_common;

const
  CallBackStackBlockSize = 1024;

type
  TCallBackStack = object
  public
    items: array of TInstructionPointer;
    i_pos, size: cardinal;
    procedure init;
    procedure push(ip: TInstructionPointer);
    function peek: TInstructionPointer;
    function popv: TInstructionPointer;
    procedure pop;
  end;

  PCallBackStack = ^TCallBackStack;

implementation

procedure TCallBackStack.init;
begin
  SetLength(items, CallBackStackBlockSize);
  i_pos := 0;
  size := CallBackStackBlockSize;
  Push(High(TInstructionPointer));
end;

procedure TCallBackStack.push(ip: TInstructionPointer); inline;
begin
  items[i_pos] := ip;
  Inc(i_pos);
  if i_pos >= size then
  begin
    size := size + CallBackStackBlockSize;
    SetLength(items, size);
  end;
end;

function TCallBackStack.popv: TInstructionPointer; inline;
begin
  Dec(i_pos);
  Result := items[i_pos];
end;

function TCallBackStack.peek: TInstructionPointer; inline;
begin
  Result := items[i_pos - 1];
end;

procedure TCallBackStack.pop; inline;
begin
  Dec(i_pos);
  if size - i_pos > CallBackStackBlockSize then
  begin
    size := size - CallBackStackBlockSize;
    SetLength(items, size);
  end;
end;

end.

