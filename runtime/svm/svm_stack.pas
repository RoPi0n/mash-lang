unit svm_stack;

{$mode objfpc}
{$H+}

interface

uses
  SysUtils,
  svm_mem;

const
  StackBlockSize = 256;

type
  TStack = object
  public
    items: array of pointer;
    size, i_pos: cardinal;
    procedure init;
    procedure push(p: pointer); inline;
    function peek: pointer; inline;
    procedure pop; inline;
    function popv: pointer; inline;
    procedure swp; inline;
    procedure drop; inline;
    procedure free; inline;
  end;

  PStack = ^TStack;

implementation

procedure TStack.init;
begin
  SetLength(items, StackBlockSize);
  i_pos := 0;
  size := StackBlockSize;
end;

procedure TStack.push(p: pointer); inline;
begin
  items[i_pos] := p;
  Inc(i_pos);
  if i_pos >= size then
  begin
    size := size + StackBlockSize;
    SetLength(items, size);
  end;
end;

function TStack.peek: pointer; inline;
begin
  Result := items[i_pos - 1];
end;

procedure TStack.pop; inline;
begin
  Dec(i_pos);
  if size - i_pos > StackBlockSize then
  begin
    size := size - StackBlockSize;
    SetLength(items, size);
  end;
end;

function TStack.popv: pointer; inline;
begin
  Dec(i_pos);
  Result := items[i_pos];
  if size - i_pos > StackBlockSize then
  begin
    size := size - StackBlockSize;
    SetLength(items, size);
  end;
end;

procedure TStack.swp; inline;
var
  p: pointer;
begin
  p := items[i_pos - 2];
  items[i_pos - 2] := items[i_pos - 1];
  items[i_pos - 1] := p;
end;

procedure TStack.drop; inline;
var
  c: cardinal;
  m: TSVMMem;
begin
  c := 0;
  while c < i_pos do
  begin
    m := TSVMMem(items[c]);
    if m.m_type <> svmtNull then
     InterlockedDecrement(m.m_rcnt);

    Inc(c);
  end;

  SetLength(items, StackBlockSize);
  size := StackBlockSize;
  i_pos := 0;
end;

procedure TStack.free; inline;
begin
  drop;
  SetLength(items, 0);
  size := 0;
end;

end.

