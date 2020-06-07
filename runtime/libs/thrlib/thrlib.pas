library thrlib;

{$mode objfpc}{$H+}

uses
  SysUtils,
  syncobjs;

{$I '..\svm.inc'}


type
  TMashCriticalSection = class
    public
      lock_flag: cardinal;

      constructor Create;

      procedure Enter;
      function  TryEnter: boolean;
      procedure Leave;
  end;


constructor TMashCriticalSection.Create;
begin
  lock_flag := 0;
end;

procedure TMashCriticalSection.Enter;
begin
  while InterlockedCompareExchange(lock_flag, 1, 0) = 1 do
   sleep(1);
end;

function TMashCriticalSection.TryEnter: boolean;
begin
  Result := InterlockedCompareExchange(lock_flag, 1, 0) = 0;
end;

procedure TMashCriticalSection.Leave;
begin
  InterlockedCompareExchange(lock_flag, 0, 1);
end;



procedure CRITSECT_DESTRUCTOR(pCritSect: pointer); stdcall;
begin
  TMashCriticalSection(pCritSect).Free;
end;

procedure CRITSECT_CREATE(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TMashCriticalSection.Create, @CRITSECT_DESTRUCTOR);
end;

procedure CRITSECT_ENTER(pctx: pointer); stdcall;
begin
  TMashCriticalSection(__Next_Ref(pctx)).Enter;
end;

procedure CRITSECT_LEAVE(pctx: pointer); stdcall;
begin
  TMashCriticalSection(__Next_Ref(pctx)).Leave;
end;

procedure CRITSECT_TRYENTER(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, TMashCriticalSection(__Next_Ref(pctx)).TryEnter);
end;

{EXPORTS DB}
exports CRITSECT_CREATE        name 'CRITICAL_SECTION_CREATE';
exports CRITSECT_ENTER         name 'CRITICAL_SECTION_ENTER';
exports CRITSECT_LEAVE         name 'CRITICAL_SECTION_LEAVE';
exports CRITSECT_TRYENTER      name 'CRITICAL_SECTION_TRYENTER';

begin
end.
