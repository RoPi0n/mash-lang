unit svm_grabber;

{$mode objfpc}
{$inline on}

interface

uses
   SysUtils, Classes, svm_common;

const
   GrabberStackBlockSize = 1024 * 8;

type
   TGrabberStack = object
   public
      items: array of pointer;
      size, i_pos: cardinal;
      procedure init;
      procedure push(p: pointer); inline;
      procedure pop; inline;
      procedure drop; inline;
      procedure free; inline;
   end;

   TGrabber = class
   public
      Stack: TGrabberStack;
      ChkCnt: byte;
      LastChk: cardinal;
      Delta: cardinal;
      Skipped: word;

      constructor Create;
      destructor Destroy; override;

      procedure Reg(value: pointer);
      procedure Run(offset: word = 32);
      procedure RunFull(GlobalLocked: boolean = false);
      procedure Term;
   end;

implementation

uses svm_mem;

{***** stack *****}

procedure TGrabberStack.init;
begin
   SetLength(items, GrabberStackBlockSize);
   i_pos := 0;
   size := GrabberStackBlockSize;
end;

procedure TGrabberStack.push(p: pointer); inline;
begin

   items[i_pos] := p;
   Inc(i_pos);
   if i_pos >= size then
    begin
      size := size + GrabberStackBlockSize;
      SetLength(items, size);
    end;
end;

procedure TGrabberStack.pop; inline;
begin
   Dec(i_pos);
   if size - i_pos > GrabberStackBlockSize then
    begin
      size := size - GrabberStackBlockSize;
      SetLength(items, size);
    end;
end;

procedure TGrabberStack.drop; inline;
begin
   SetLength(items, GrabberStackBlockSize);
   size := GrabberStackBlockSize;
   i_pos := 0;
end;

procedure TGrabberStack.free; inline;
begin
  SetLength(items, 0);
  size := 0;
  i_pos := 0;
end;

{***** grabber *****}

constructor TGrabber.Create;
begin
  Stack.Init;
  ChkCnt := 0;
  LastChk := 0;
  Delta := 0;
  Skipped := 0;
end;

destructor TGrabber.Destroy;
begin
  Stack.Free;
  inherited;
end;

procedure TGrabber.Reg(value: pointer);
begin
  if (Delta > 1024) and (Stack.i_pos > 1024*8) or (Skipped > 1024*8) then
   begin
     Delta := Stack.i_pos;
     Run;
     Delta := Delta - Stack.i_pos;
     Skipped := 0;
   end
  else
   Inc(Skipped);

  Stack.push(value);
end;

procedure TGrabber.Run(offset: word = 32);
var
  i: integer;
  c, l, tm: cardinal;
  r: TSVMMem;
begin
  tm := GetTickCount;

  if ChkCnt < 32 then
   begin
     i := stack.i_pos * 2 div 3;
     Inc(ChkCnt);
   end
  else
   begin
     i := 0;
     ChkCnt := 0;
   end;

  //i := 0;

  while i < stack.i_pos - offset do
   begin
     r := TSVMMem(stack.items[i]);

     if (r.m_rcnt < 1) {and (tm - r.t_created > 10)} then
      begin
        stack.items[i] := stack.items[stack.i_pos - offset];

        c := stack.i_pos - offset;
        while (c < stack.i_pos - 1) and (offset > 0) do
         begin
           stack.items[c] := stack.items[c + 1];
           Inc(c);
         end;

        stack.pop;

        if r.m_type in [svmtArr, svmtClass] then
         begin
           c := 0;
           l := Length(PMemArray(r.m_val)^);
           while c < l do
            begin
              InterlockedDecrement(TSVMMem(PMemArray(r.m_val)^[c]).m_rcnt);

              Inc(c);
            end;
         end;

        FreeAndNil(r);
        Dec(i);
      end;

     inc(i);
   end;
end;

procedure TGrabber.RunFull(GlobalLocked: boolean = false);
var
  i: integer;
  c, l, tm: cardinal;
  r: TSVMMem;
begin
  tm := GetTickCount;

  if not GlobalLocked then
   GlobalLock.Acquire;

  i := 0;

  while i < stack.i_pos do
   begin
     r := TSVMMem(stack.items[i]);

     if (r.m_rcnt < 1) {and (tm - r.t_created > 10)} then
      begin
        stack.items[i] := stack.items[stack.i_pos - 1];
        stack.pop;

        if r.m_type in [svmtArr, svmtClass] then
         begin
           c := 0;
           l := Length(PMemArray(r.m_val)^);
           while c < l do
            begin
              InterlockedDecrement(TSVMMem(PMemArray(r.m_val)^[c]).m_rcnt);

              Inc(c);
            end;
         end;

        FreeAndNil(r);
        Dec(i);
      end;

     inc(i);
   end;

  if not GlobalLocked then
   GlobalLock.Release;
end;

procedure TGrabber.Term;
var
  c: cardinal;
  r: TSVMMem;
begin
  c := 0;
  while c < stack.i_pos do
   begin
     r := TSVMMem(stack.items[c]);
     FreeAndNil(r);
     Inc(c);
   end;
end;

end.

