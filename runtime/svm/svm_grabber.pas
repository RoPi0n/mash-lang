unit svm_grabber;

{$inline on}

interface

uses
   SysUtils;

const
   GrabberStackBlockSize = 1024 * 8;

type
   TGrabberStack = object
   public
      items: array of pointer;
      size, i_pos: cardinal;
      procedure init;
      procedure push(p: pointer);
      procedure pop;
      procedure drop;
      procedure free;
   end;

   TGrabber = class
   public
      Stack: TGrabberStack;
      ChkCnt: byte;

      constructor Create;
      destructor Destroy; override;

      procedure Reg(value: pointer);
      procedure Run;
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
end;

destructor TGrabber.Destroy;
begin
  Stack.Free;
  inherited;
end;

procedure TGrabber.Reg(value: pointer);
begin
  Stack.push(value);
end;

procedure TGrabber.Run;
var
  i: integer;
  c, l: cardinal;
  r: TSVMMem;
  p: pointer;
begin
  if (ChkCnt < 16) and (stack.i_pos > 1) then
   begin
     i := stack.i_pos div 2;
     Inc(ChkCnt);
   end
  else
   begin
     i := 0;
     ChkCnt := 0;
   end;

  while i < stack.i_pos do
   begin
     r := TSVMMem(stack.items[i]);

     if r.m_refc < 1 then
      begin
        stack.items[i] := stack.items[stack.i_pos - 1];
        stack.pop;

        if r.m_type in [svmtArr, svmtClass] then
         begin
           c := 0;
           l := Length(PMemArray(r.m_val)^);
           while c < l do
            begin
              p := PMemArray(r.m_val)^[c];
              try
                if p <> nil then
                 Dec(TSVMMem(p).m_refc);
              finally
                Inc(c);
              end;
            end;
         end;

        FreeAndNil(r);
        dec(i);
      end;

     inc(i);
   end;

  //writeln(stack.i_pos);
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

