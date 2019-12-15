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
    procedure push(p: pointer);
    function peek: pointer;
    procedure pop;
    function popv: pointer;
    procedure swp;
    procedure drop;
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
begin
  c := 0;
  while c < i_pos do
  begin
    if items[c] <> nil then
      //if TObject(items[c]) is TSVMMem then
      Dec(TSVMMem(items[c]).m_refc);

    Inc(c);
  end;

  SetLength(items, StackBlockSize);
  size := StackBlockSize;
  i_pos := 0;
end;

end.

