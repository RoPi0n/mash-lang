library forms_api;

{$mode objfpc}{$H+}

uses
  SysUtils, Classes, Forms, Graphics, Interfaces, lform_class, SyncObjs, svm_api in '..\svm_api.pas';


{** TApplication **}

procedure _Application_Initialize(Stack:PStack); cdecl;
begin
  Application.Initialize;
  Application.ShowMainForm := False;
end;
exports  _Application_Initialize name  '_Application_Initialize';


procedure _Application_Run(Stack:PStack); cdecl;
begin
  Application.Run;
end;
exports  _Application_Run name  '_Application_Run';


procedure _Application_CreateForm(Stack:PStack); cdecl;
var
  F:TLForm;
begin
  Application.CreateForm(TLForm, F);
  Stack^.push(F);
end;
exports  _Application_CreateForm name  '_Application_CreateForm';


procedure _Application_Terminate(Stack:PStack); cdecl;
var
  F:TLForm;
begin
  Application.CreateForm(TLForm, F);
  Stack^.push(F);
end;
exports  _Application_Terminate name  '_Application_Terminate';

procedure _Application_LoadIconFromStream(Stack:PStack); cdecl;
begin
  Application.Icon.LoadFromStream(TMemoryStream(Pointer(Cardinal(TSVMMem(Stack^.popv).GetW))));
end;
exports  _Application_LoadIconFromStream name  '_Application_LoadIconFromStream';

{** TLForm **}

procedure _Form_SetWidth(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Width := TSVMMem(Stack^.popv).GetW;
end;
exports  _Form_SetWidth name  '_Form_SetWidth';


procedure _Form_SetHeight(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Height := TSVMMem(Stack^.popv).GetW;
end;
exports  _Form_SetHeight name  '_Form_SetHeight';


procedure _Form_GetWidth(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TLForm(Stack^.popv).Width));
end;
exports  _Form_GetWidth name  '_Form_GetWidth';


procedure _Form_GetHeight(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TLForm(Stack^.popv).Height));
end;
exports  _Form_GetHeight name  '_Form_GetHeight';


procedure _Form_SetLeft(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Left := TSVMMem(Stack^.popv).GetW;
end;
exports  _Form_SetLeft name  '_Form_SetLeft';


procedure _Form_SetTop(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Top := TSVMMem(Stack^.popv).GetW;
end;
exports  _Form_SetTop name  '_Form_SetTop';


procedure _Form_GetLeft(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TLForm(Stack^.popv).Left));
end;
exports  _Form_GetLeft name  '_Form_GetLeft';


procedure _Form_GetTop(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TLForm(Stack^.popv).Top));
end;
exports  _Form_GetTop name  '_Form_GetTop';


procedure _Form_SetColor(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Color := TSVMMem(Stack^.popv).GetW;
end;
exports  _Form_SetColor name  '_Form_SetColor';


procedure _Form_GetColor(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TLForm(Stack^.popv).Color));
end;
exports  _Form_GetColor name  '_Form_GetColor';


procedure _Form_SetCaption(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Caption := string(TSVMMem(Stack^.popv).GetS);
end;
exports  _Form_SetCaption name  '_Form_SetCaption';


procedure _Form_GetCaption(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFS(TLForm(Stack^.popv).Caption));
end;
exports  _Form_GetCaption name  '_Form_GetCaption';


procedure _Form_Show(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Show;
end;
exports  _Form_Show name  '_Form_Show';


procedure _Form_Hide(Stack:PStack); cdecl;
begin
  TLForm(Stack^.popv).Hide;
end;
exports  _Form_Hide name  '_Form_Hide';


procedure _Form_CheckEvent(Stack:PStack); cdecl;
var
  F:TLForm;
  E:TLFEvent;
begin
  F := TLForm(Stack^.popv);
  E := F.GetEv;
  if E <> nil then
   Stack^.push(TSVMMem.CreateFW(E.GetEvType))
  else
   Stack^.push(TSVMMem.CreateFW(EVT_Null));
end;
exports  _Form_CheckEvent name  '_Form_CheckEvent';


procedure _Form_GetLastEvent(Stack:PStack); cdecl;
var
  F:TLForm;
begin
  F := TLForm(Stack^.popv);
  if F.LastEv = nil then
   Stack^.push(TSVMMem.CreateFW(EVT_Null))
  else
   Stack^.push(TSVMMem.CreateFW(F.LastEv.GetEvType));
end;
exports  _Form_GetLastEvent name  '_Form_GetLastEvent';


procedure _Form_LastEventArgCount(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TLForm(Stack^.popv).LastEv.ArgCount));
end;
exports  _Form_LastEventArgCount name  '_Form_LastEventArgCount';


procedure _Form_LastEventArgAt(Stack:PStack); cdecl;
begin
  Stack^.push(TLForm(Stack^.popv).LastEv.GetArg(TSVMMem(Stack^.popv).GetW));
end;
exports  _Form_LastEventArgAt name  '_Form_LastEventArgAt';


procedure _Form_GetCanvas(Stack:PStack); cdecl;
begin
  Stack^.push(TLForm(Stack^.popv).Canvas);
end;
exports  _Form_GetCanvas name  '_Form_GetCanvas';

procedure _Form_LoadIconFromStream(Stack:PStack); cdecl;
var
  Stream:TStream;
  p:Pointer;
begin
  p := Stack^.popv;
  Stream := TMemoryStream(Pointer(Cardinal(TSVMMem(Stack^.popv).GetW)));
  Stream.Position := 0;
  TLForm(p).Icon.LoadFromStream(Stream);
end;
exports  _Form_LoadIconFromStream name  '_Form_LoadIconFromStream';

{** Canvas **}

procedure _Canvas_MoveTo(Stack:PStack); cdecl;
begin
  TCanvas(Stack^.popv).MoveTo(TSVMMem(Stack^.popv).GetW,TSVMMem(Stack^.popv).GetW);
end;
exports  _Canvas_MoveTo name  '_Canvas_MoveTo';


procedure _Canvas_LineTo(Stack:PStack); cdecl;
begin
  TCanvas(Stack^.popv).LineTo(TSVMMem(Stack^.popv).GetW,TSVMMem(Stack^.popv).GetW);
end;
exports  _Canvas_LineTo name  '_Canvas_LineTo';


procedure _Canvas_SetPenColor(Stack:PStack); cdecl;
begin
  TCanvas(Stack^.popv).Pen.Color := TSVMMem(Stack^.popv).GetW;
end;
exports  _Canvas_SetPenColor name  '_Canvas_SetPenColor';


procedure _Canvas_GetPenColor(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TCanvas(Stack^.popv).Pen.Color));
end;
exports  _Canvas_GetPenColor name  '_Canvas_GetPenColor';

begin
end.
