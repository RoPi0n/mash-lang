library thrlib;

{$mode objfpc}{$H+}

uses
  SysUtils,
  syncobjs;

{$I '..\libapi.inc'}

procedure CRITSECT_DESTRUCTOR(pCritSect: pointer); stdcall;
begin
  TCriticalSection(pCritSect).Free;
end;

procedure CRITSECT_CREATE(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TCriticalSection.Create, @CRITSECT_DESTRUCTOR);
end;

procedure CRITSECT_ENTER(pctx: pointer); stdcall;
begin
  TCriticalSection(__Next_Ref(pctx)).Enter;
end;

procedure CRITSECT_LEAVE(pctx: pointer); stdcall;
begin
  TCriticalSection(__Next_Ref(pctx)).Leave;
end;

procedure CRITSECT_TRYENTER(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, TCriticalSection(__Next_Ref(pctx)).TryEnter);
end;

{EXPORTS DB}
exports CRITSECT_CREATE        name 'CRITICAL_SECTION_CREATE';
exports CRITSECT_ENTER         name 'CRITICAL_SECTION_ENTER';
exports CRITSECT_LEAVE         name 'CRITICAL_SECTION_LEAVE';
exports CRITSECT_TRYENTER      name 'CRITICAL_SECTION_TRYENTER';

begin
end.
