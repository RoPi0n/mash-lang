unit svm_utils;

{$mode objfpc}
{$H+}

interface

uses
  Classes,
  SysUtils,
  svm_mem,
  svm_grabber,
  svm_stack,
  svm_common
  {$IfDef Windows}
   , Windows
  {$EndIf};

type
  TSizeArr = array of cardinal;
  PSizeArr = ^TSizeArr;

function NewArr_Sub(size_arr: PSizeArr; lvl: word; Grabber: TGrabber): TSVMMem; inline;
function NewArr(stk: PStack; lvl: word; Grabber: TGrabber): TSVMMem; inline;

var
  GrabbersStorage: TThreadList = nil;

procedure GlobalGC;
procedure GlobalTerm;

procedure CheckHeader(pb:PByteArr);

implementation

function NewArr_Sub(size_arr: PSizeArr; lvl: word; Grabber: TGrabber): TSVMMem; inline;
var
  i, l: cardinal;
  r: TSVMMem;
begin
  Result := NewSVMM_Arr(size_arr^[length(size_arr^) - lvl], Grabber);
  if lvl > 0 then
  begin
    i := 0;
    l := size_arr^[length(size_arr^) - lvl];
    while i < l do
    begin
      if lvl - 1 > 0 then
      begin
        r := NewArr_Sub(size_arr, lvl - 1, Grabber);
        r.m_refc := 1;
        Result.ArrSet(i, r);
      end
      else
        Result.ArrSet(i, nil);
      Inc(i);
    end;
  end;
end;

function NewArr(stk: PStack; lvl: word; Grabber: TGrabber): TSVMMem; inline;
var
  size_arr: TSizeArr;
  i: word;
  r: TSVMMem;
begin
  SetLength(size_arr, lvl);
  i := 0;
  while i < lvl do
  begin
    r := TSVMMem(stk^.popv);
    Dec(r.m_refc);
    size_arr[i] := r.GetW;
    Inc(i);
  end;
  Result := NewArr_Sub(@size_arr, lvl, Grabber);
  //Result := TSVMMem.CreateArr(TSVMMem(stk^.popv).GetW);
end;

procedure GlobalGC;
var
  lst: TList;
  c, l: cardinal;
begin
  try
    lst := GrabbersStorage.LockList;
    c := 0;
    l := lst.count;

    while c < l do
     begin
       if TGrabber(lst[c]).Stack.i_pos = 0 then
        begin
          TGrabber(lst[c]).Free;
          lst[c] := lst[l - 1];
          lst.delete(l - 1);
          dec(l);
          dec(c);
        end
       else
        TGrabber(lst[c]).Run;

       inc(c);
     end;
  finally
    GrabbersStorage.UnlockList;
  end;
end;

procedure GlobalTerm;
var
  lst: TList;
  l: cardinal;
begin
  try
    lst := GrabbersStorage.LockList;
    l := lst.count;

    while l > 0 do
     begin
       TGrabber(lst[l - 1]).Term;
       TGrabber(lst[l - 1]).Free;
       lst.delete(l - 1);

       dec(l);
     end;
  finally
    GrabbersStorage.UnlockList;
  end;
end;

procedure CheckHeader(pb:PByteArr);
begin
  if Length(pb^) >= 10 then
   begin
     if (chr(pb^[0]) = 'S') and (chr(pb^[1]) = 'V') and (chr(pb^[2]) = 'M') and
        (chr(pb^[3]) = 'E') and (chr(pb^[4]) = 'X') and (chr(pb^[5]) = 'E') and
        (chr(pb^[6]) = '_') and (chr(pb^[7]) = 'C') and (chr(pb^[8]) = 'N') and
        (chr(pb^[9]) = 'S') then
         begin
           {$IfDef Windows}
             {$IfDef BuildGUI}
               AllocConsole;
             {$EndIf}
           {$EndIf}
           AppType := atCns;
           Exit;
         end;
     if (chr(pb^[0]) = 'S') and (chr(pb^[1]) = 'V') and (chr(pb^[2]) = 'M') and
        (chr(pb^[3]) = 'E') and (chr(pb^[4]) = 'X') and (chr(pb^[5]) = 'E') and
        (chr(pb^[6]) = '_') and (chr(pb^[7]) = 'G') and (chr(pb^[8]) = 'U') and
        (chr(pb^[9]) = 'I') then
         begin
           {$IfDef Windows}
             {$IfNDef BuildGUI}
               FreeConsole;
             {$EndIf}
           {$EndIf}
           AppType := atGUI;
           Exit;
         end;
   end;
  raise Exception.Create('Error: Invalid SVMEXE-file header!');
  halt;
end;

end.
