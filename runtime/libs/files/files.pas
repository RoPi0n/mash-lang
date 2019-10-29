library files;

{$mode objfpc}{$H+}

uses SysUtils;

{$I '..\svm.inc'}

procedure _FileExists(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, FileExists(__Next_String(pctx)) );
end;

procedure _DirExists(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, DirectoryExists(__Next_String(pctx)) );
end;

procedure _CreateDir(pctx: pointer); stdcall;
begin
  ForceDirectories(__Next_String(pctx));
end;

procedure _DeleteFile(pctx: pointer); stdcall;
begin
  DeleteFile(__Next_String(pctx));
end;

function DelDir(dir: string; all: boolean): boolean;
var
  Sr: SysUtils.TSearchRec;
begin
  {$I-}
  if (Dir <> '') and (Dir[length(Dir)] = '\') then
   Delete(Dir, length(dir), 1);

  if FindFirst(Dir + DirectorySeparator + '*.*',  faAnyFile, Sr) = 0 then
   repeat
     if (Sr.Name = '.') or (Sr.Name = '..') then continue;

     if (Sr.Attr and faDirectory <> faDirectory) then
      begin
        DeleteFile(PChar(Dir + DirectorySeparator + sr.Name));
      end
     else
      if all then
       DelDir(Dir + DirectorySeparator + sr.Name, all);
   until FindNext(sr) <> 0;

  FindClose(sr);
  RemoveDir(Dir);

  Result := FileGetAttr(Dir) = -1;
end;

procedure _DeleteDir(pctx: pointer); stdcall;
begin
  __Return_Bool(pctx, DelDir(__Next_String(pctx), true) );
end;

function ScanDir(dir: string; recursive: boolean): string;
var
  Sr: SysUtils.TSearchRec;
begin
  Result := '';

  {$I-}
  if (Dir <> '') and (Dir[length(Dir)] = '\') then
   Delete(Dir, length(dir), 1);

  if FindFirst(Dir + DirectorySeparator + '*.*',  faAnyFile, Sr) = 0 then
   repeat
     if (Sr.Name = '.') or (Sr.Name = '..') then continue;

     if (Sr.Attr and faDirectory <> faDirectory) then
      begin
        if Length(Result) > 0 then
         Result := Result + sLineBreak;

        Result := Result + Dir + DirectorySeparator + sr.Name;
      end
     else
      if recursive then
       Result := Result + sLineBreak + ScanDir(Dir + DirectorySeparator + sr.Name, recursive);
   until FindNext(sr) <> 0;

  FindClose(sr);
  RemoveDir(Dir);
end;

procedure _ScanDir(pctx: pointer); stdcall;
begin
  __Return_String(pctx, ScanDir(__Next_String(pctx), true));
end;

procedure _ScanDirFirst(pctx: pointer); stdcall;
begin
  __Return_String(pctx, ScanDir(__Next_String(pctx), false));
end;

{EXPORTS DB}
exports _FileExists           name 'FILEEXISTS';
exports _DirExists            name 'DIREXISTS';
exports _CreateDir            name 'CREATEDIR';
exports _DeleteFile           name 'DELETEFILE';
exports _DeleteDir            name 'DELETEDIR';
exports _ScanDir              name 'SCANDIR';
exports _ScanDirFirst         name 'SCANDIRFIRST';

begin
end.
