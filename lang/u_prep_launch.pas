unit u_prep_launch;

interface
  uses SysUtils, u_prep_global, u_globalvars, u_variables,
       u_local_variables, u_prep_codeblock;

function IsLaunch(s:string):boolean;
function ParseLaunch(s:string; varmgr:TVarManager):string;
function IsAsync(s:string):boolean;
function ParseAsync(s:string; varmgr:TVarManager):string;
function IsWait(s:string):boolean;
function ParseWait(s:string; varmgr:TVarManager):string;

implementation

function IsLaunch(s:string):boolean;
begin
  s := Trim(s);
  Result := (s = 'launch:') or (s = 'launch :');
end;

function ParseLaunch(s:string; varmgr:TVarManager):string;
var
  BlockName, Pops, Marks: string;
begin
  BlockName := '__gen_launch_' + IntToStr(LaunchBlCounter);
  Inc(LaunchBlCounter);

  Pops := PopLocalVariables(varmgr);
  Marks := MarkLocalVariables(varmgr);

  Result := sLineBreak + DublicateLocalVariablesAndPushOrigins(varmgr) +
            sLineBreak + 'pushn' + sLineBreak + 'pushcp ' + BlockName + '_entry' +
            sLineBreak + 'cthr' + sLineBreak + 'rthr' +
            sLineBreak + Pops +
            sLineBreak + 'pushcp ' + BlockName + '_end' + sLineBreak + 'jp' +
            sLineBreak + BlockName + '_entry:' +
            sLineBreak + 'pop' +
            sLineBreak + Marks;

  BlockStack.Add(TCodeBlock.Create(btLaunch, '',
                                   'threxit' + sLineBreak + BlockName + '_end:',
                                   'threxit'));
end;

function IsAsync(s:string):boolean;
begin
  s := Trim(s);
  Result := (copy(s, 1, 6) = 'async ') and (copy(s, length(s), 1) = ':');
end;

function ParseAsync(s:string; varmgr:TVarManager):string;
var
  BlockName, Pops, Marks, Method: string;
begin
  s := Trim(s);
  Delete(s, 1, 6);
  Delete(s, length(s), 1);
  s := Trim(s);

  BlockName := '__gen_async_' + IntToStr(LaunchBlCounter);
  Inc(LaunchBlCounter);

  if ProcEnterList.Count > 0 then
   Method := '__' + ProcEnterList[ProcEnterList.Count - 1]
  else
   Method := '__global';

  Pops := PopLocalVariables(varmgr);
  Marks := MarkLocalVariables(varmgr);

  Result := sLineBreak + DublicateLocalVariablesAndPushOrigins(varmgr) +
            sLineBreak + 'pushc ' + GetConst('1', varmgr) +
            sLineBreak + 'gpm' +
            sLineBreak + 'peek ' + GetVar(Method + '__async_flag_' + s, varmgr) +
            sLineBreak + 'pushcp ' + BlockName + '_entry' +
            sLineBreak + 'cthr' + sLineBreak + 'rthr' +
            sLineBreak + Pops +
            sLineBreak + 'pushcp ' + BlockName + '_end' + sLineBreak + 'jp' +
            sLineBreak + BlockName + '_entry:' +
            sLineBreak + 'pop' +
            sLineBreak + Marks;

  BlockStack.Add(TCodeBlock.Create(btAsync, '',
                                   BlockName + '_exit:' + sLineBreak +
                                   'pushc ' + GetConst('0', varmgr) + sLineBreak +
                                   'gpm' + sLineBreak +
                                   'push ' + GetVar(Method + '__async_flag_' + s, varmgr) +
                                   sLineBreak + 'mov' + sLineBreak +
                                   'threxit' + sLineBreak + BlockName + '_end:',
                                   BlockName + '_exit'));
end;

function IsWait(s:string):boolean;
begin
  s := Trim(s);
  Result := Copy(s, 1, 5) = 'wait ';
end;

function ParseWait(s:string; varmgr:TVarManager):string;
var
  Method, AsyncFlag: string;
begin
  s := Trim(s);
  Delete(s, 1, 5);
  s := Trim(s);

  if ProcEnterList.Count > 0 then
   Method := '__' + ProcEnterList[ProcEnterList.Count - 1]
  else
   Method := '__global';

  Result := '';

  while Length(s) > 0 do
   begin
     AsyncFlag := CutNextArg(s);
     s := Trim(s);

     Result := Result + sLineBreak +
               '__async_await_loop_for_flag_' + AsyncFlag + ':' + sLineBreak +
               'pushcp ' + GetConst('1', varmgr) + sLineBreak +
               'pushcp sleep' + sLineBreak +
               'invoke' + sLineBreak +
               'pushcp __async_await_loop_for_flag_' + AsyncFlag + sLineBreak +
               'push ' + GetVar(Method + '__async_flag_' + AsyncFlag, varmgr) +
               sLineBreak + 'jn' + sLineBreak + 'pop' + sLineBreak;
   end;
end;

end.
