library thrlib;

{$mode objfpc}{$H+}

uses
  SysUtils,
  DateUtils,
  {Windows,}
  syncobjs;

{$I '..\svm.inc'}


function GetTempDir: string;
begin
  __Get_Temp_Path(@Result);
end;


{type
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
  while System.InterlockedCompareExchange(lock_flag, 1, 0) = 1 do
   sleep(1);
end;

function TMashCriticalSection.TryEnter: boolean;
begin
  Result := System.InterlockedCompareExchange(lock_flag, 1, 0) = 0;
end;

procedure TMashCriticalSection.Leave;
begin
  System.InterlockedCompareExchange(lock_flag, 0, 1);
end;}


type
  TMashCriticalSection = class
    public
      cs: TCriticalSection;

      constructor Create;
      destructor Destroy; override;

      procedure Enter;
      function  TryEnter: boolean;
      procedure Leave;
  end;


constructor TMashCriticalSection.Create;
begin
  cs := TCriticalSection.Create;
end;

destructor TMashCriticalSection.Destroy;
begin
  FreeAndNil(cs);
  inherited;
end;

procedure TMashCriticalSection.Enter;
begin
  cs.Acquire;
end;

function TMashCriticalSection.TryEnter: boolean;
begin
  Result := cs.TryEnter;
end;

procedure TMashCriticalSection.Leave;
begin
  cs.Leave;
end;


type
  TMashMutex = class
    public
      FFileHandle: Integer;
      LockFileName: string;

      constructor Create;
      destructor  Destroy; override;

      procedure Enter;
      function  TryEnter: boolean;
      procedure Leave;
  end;


constructor TMashMutex.Create;
begin
  Randomize;
  __Get_Temp_Path(@LockFileName);
  LockFileName := LockFileName + IntToStr(Random(MaxInt)) + IntToStr(Random(MaxInt)) + IntToStr(Random(MaxInt)) + '.mutex';
end;

destructor TMashMutex.Destroy;
begin
  if FFileHandle <> -1 then
   FileClose(FFileHandle);

  if FileExists(LockFileName) then
   DeleteFile(LockFileName);
  inherited;
end;

procedure TMashMutex.Enter;
begin
  repeat
    if FileExists(LockFileName) then
      FFileHandle := FileOpen(LockFileName, fmShareExclusive)
    else
      FFileHandle := FileCreate(LockFileName, fmShareExclusive);

    if FFileHandle = -1 then
     Sleep(1);
  until FFileHandle <> -1;
end;

function TMashMutex.TryEnter: boolean;
  function NextAttempt(const MaxTime: TDateTime): boolean;
  begin
    Sleep(1);
    Result := Now < MaxTime;
  end;

var
  MaxTime: TDateTime;
begin
  MaxTime := IncMillisecond(Now, 10);
  repeat
    if FileExists(LockFileName) then
     FFileHandle := FileOpen(LockFileName, fmShareExclusive)
    else
     FFileHandle := FileCreate(LockFileName, fmShareExclusive);
  until (FFileHandle <> -1) or not NextAttempt(MaxTime);

  Result := FFileHandle <> -1;
end;

procedure TMashMutex.Leave;
begin
  if FFileHandle <> -1 then
   FileClose(FFileHandle);

  if FileExists(LockFileName) then
   DeleteFile(LockFileName);
end;


{type
  TMashMutex = class
    public
      FFileHandle: Integer;
      LockFileName: string;

      constructor Create;
      destructor  Destroy; override;

      procedure Enter;
      function  TryEnter: boolean;
      procedure Leave;
  end;


constructor TMashMutex.Create;
begin
  Randomize;
  FFileHandle := -1;
  LockFileName := IntToStr(Random(MaxInt)) + IntToStr(Random(MaxInt)) + IntToStr(Random(MaxInt)) + '.mutex';
end;

destructor TMashMutex.Destroy;
begin
  if FFileHandle <> -1 then
   begin
     ReleaseMutex(FFileHandle);
     CloseHandle(FFileHandle);
   end;

  inherited;
end;

procedure TMashMutex.Enter;
var
  ok: boolean;
begin
  ok := false;
  repeat
    if FFileHandle = -1 then
     begin
       FFileHandle := CreateMutex(nil, False, PChar(LockFileName));
       ok := true;
     end
    else
    if WaitForSingleObject(FFileHandle, INFINITE) <> WAIT_OBJECT_0 then
     ok := true
    else
     Sleep(1);
  until not ok;
end;

function TMashMutex.TryEnter: boolean;
  function NextAttempt(const MaxTime: TDateTime): boolean;
  begin
    Sleep(1);
    Result := Now < MaxTime;
  end;

var
  MaxTime: TDateTime;
  ok: boolean;
begin
  ok := false;
  repeat
    if FFileHandle = -1 then
     begin
       FFileHandle := CreateMutex(nil, False, PChar(LockFileName));
       ok := true;
     end
    else
    if WaitForSingleObject(FFileHandle, INFINITE) <> WAIT_OBJECT_0 then
     ok := true
    else
     Sleep(1);
  until (not ok) or (not NextAttempt(MaxTime));

  Result := ok;
end;

procedure TMashMutex.Leave;
begin
  if FFileHandle <> -1 then
   begin
     ReleaseMutex(FFileHandle);
   end;
end;}


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


procedure MUTEX_DESTRUCTOR(pMutex: pointer); stdcall;
begin
  TMashMutex(pMutex).Free;
end;

procedure MUTEX_CREATE(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TMashMutex.Create, @MUTEX_DESTRUCTOR);
end;

procedure MUTEX_ENTER(pctx: pointer); stdcall;
begin
  TMashMutex(__Next_Ref(pctx)).Enter;
end;

procedure MUTEX_LEAVE(pctx: pointer); stdcall;
begin
  TMashMutex(__Next_Ref(pctx)).Leave;
end;

procedure MUTEX_TRYENTER(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, TMashMutex(__Next_Ref(pctx)).TryEnter);
end;


{EXPORTS DB}
exports CRITSECT_CREATE        name 'CRITICAL_SECTION_CREATE';
exports CRITSECT_ENTER         name 'CRITICAL_SECTION_ENTER';
exports CRITSECT_LEAVE         name 'CRITICAL_SECTION_LEAVE';
exports CRITSECT_TRYENTER      name 'CRITICAL_SECTION_TRYENTER';

exports MUTEX_CREATE           name 'MUTEX_SECTION_CREATE';
exports MUTEX_ENTER            name 'MUTEX_SECTION_ENTER';
exports MUTEX_LEAVE            name 'MUTEX_SECTION_LEAVE';
exports MUTEX_TRYENTER         name 'MUTEX_SECTION_TRYENTER';

begin
end.
