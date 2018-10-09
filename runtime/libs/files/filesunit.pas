library filesunit;

uses SysUtils,Classes,Windows;

{$I ..\crlib.h}

function MatchesMask(s,m:string):boolean;
var b,mm:string;
begin
 MatchesMask:=false;
 repeat
  if pos('.',m)<>0 then
   begin
    mm:=copy(m,1,pos('.',m)-1);
	delete(m,1,pos('.',m));
   end
  else
  begin
   mm:=m;
   m:='';
  end;

  if pos('.',s)<>0 then
   begin
    b:=copy(s,1,pos('.',s)-1);
	delete(s,1,pos('.',s));
   end
  else
  begin
   b:=s;
   s:='';
  end;

  if not ((mm=b)or(mm='*')) then exit;
 until (length(m)=0)or(length(s)=0);
 MatchesMask:=true;
end;

function FileSetReadOnly(const FileName: ansistring; ReadOnly: Boolean): Boolean;
{$IFDEF MSWINDOWS}
var
  Flags: Integer;
begin
  FileSetReadOnly := False;
  Flags := GetFileAttributes(PChar(FileName));
  if Flags = -1 then Exit;
  if ReadOnly then
    Flags := Flags or faReadOnly
  else
    Flags := Flags and not faReadOnly;
  FileSetReadOnly := SetFileAttributes(PChar(FileName), Flags);
end;
{$ENDIF}
{$IFDEF LINUX}
var
  st: TStatBuf;
  Flags: Integer;
begin
  FileSetReadOnly := False;
  if stat(PChar(FileName), st) <> 0 then Exit;
  if ReadOnly then
    Flags := st.st_mode and not (S_IWUSR or S_IWGRP or S_IWOTH)
  else
    Flags := st.st_mode or (S_IWUSR or S_IWGRP or S_IWOTH);
  FileSetReadOnly := chmod(PChar(FileName), Flags) = 0;
end;
{$ENDIF}



{FUNCTIONS}
procedure _FileExists(Stack:PStack); cdecl;
begin
 Stack^.push(Fileexists(ExtractStr(Stack^.pop)));
end;

procedure _CreateFile(Stack:PStack); cdecl;
var F:File;
begin
   Assign(F,ExtractStr(Stack^.pop));
   Rewrite(F);
   Close(F);
end;

procedure _CreateDir(Stack:PStack); cdecl;
begin
   ForceDirectories(ExtractStr(Stack^.pop));
end;

procedure _DeleteFile(Stack:PStack); cdecl;
var s:ansistring;
begin
  s:=ExtractStr(Stack^.pop);
  DeleteFile(PChar(s));
end;





function KillDir (Dir: AnsiString; all: boolean): boolean;
var
  Sr: SysUtils.TSearchRec;
begin
{$I-}
  if (Dir <> '') and (Dir[length(Dir)] = '\') then
    Delete(Dir, length(dir), 1);
  if FindFirst(Dir + '\*.*',  faAnyFile, Sr) = 0 then
    repeat
      if (Sr.Name = '.') or (Sr.Name = '..') then
        continue;
      if (Sr.Attr and faDirectory <> faDirectory) then
   begin

        FileSetReadOnly(Dir + '\' + sr.Name, False);
        DeleteFile(PChar(Dir + '\' + sr.Name));

   end
      else
        if all then KillDir(Dir + '\' + sr.Name, all);
    until FindNext(sr) <> 0;
  //FindClose(sr);
//  RemoveDir(Dir);
  KillDir := (FileGetAttr(Dir) = -1);
end;

procedure _DeleteDir(Stack:PStack); cdecl;
begin
   if Stack^.pop=false then
    KillDir(ExtractStr(Stack^.pop),false)
   else
    KillDir(ExtractStr(Stack^.pop),true);
end;

procedure _RemoveDir(Stack:PStack); cdecl;
begin
   RemoveDir(ExtractStr(Stack^.pop));
end;


procedure _RenameFile(Stack:PStack); cdecl;
begin
   RenameFile(ExtractStr(Stack^.pop), ExtractStr(Stack^.pop));
end;

procedure _MoveFile(Stack:PStack); cdecl;
var p1,p2:ansistring;
begin
   p1:=ExtractStr(Stack^.pop);
   p2:=ExtractStr(Stack^.pop);
   MoveFile(PChar(p1), PChar(p2));
end;

procedure _FileSize(Stack:PStack); cdecl;
var F:File of byte;
begin
  Assign(F,ExtractStr(Stack^.pop));
    Reset(f);
    Stack^.push(filesize(F));
    Close(f);
end;

////////////////////////////////////////////////////////////////////////////////////////////////////////
//Dir scanner
procedure FindFiles(StartFolder, Mask: string; List: TStrings;ScanSubFolders: Boolean);
  var
     SearchRec: TSearchRec;
     FindResult: Integer;

     begin
          List.BeginUpdate;
          StartFolder := IncludeTrailingPathDelimiter(StartFolder);
          FindResult := FindFirst(StartFolder + '*.*', faAnyFile, SearchRec);
          while FindResult = 0 do
          with SearchRec do

               begin
                    if (Attr and faDirectory) <> 0 then
                         begin
                              if ScanSubFolders and (Name <> '.') and (Name <> '..') then
                              FindFiles(StartFolder + Name, Mask, List, ScanSubFolders);
                         end
                    else
                              begin
                                   if MatchesMask(Name, Mask) then
                                   List.Add(StartFolder + Name);
                              end;
                    FindResult := FindNext(SearchRec);
               end;
                    //FindClose(SearchRec);
                         List.EndUpdate;
end;

procedure _ScanMD(Stack:PStack); cdecl;
var Lst:TStringList;
begin
  Lst:=TStringList.Create;
   FindFiles(ExtractStr(Stack^.pop),ExtractStr(Stack^.pop),Lst,true);
  Stack^.push(Lst.Text);
end;

procedure _FScanMD(Stack:PStack); cdecl;
var SR:TSearchRec; Lst:TStringList;
begin
  if FindFirst(ExtractStr(Stack^.pop), faAnyFile, sr)=0  then
   repeat
     Lst.Add(sr.Name);
   until FindNext(sr)<>0;
   //FindClose(sr);
  Stack^.push(Lst.Text);
end;

procedure _DScanMD(Stack:PStack); cdecl;
var SR:TSearchRec;Lst:TStringList;
begin
  if FindFirst(ExtractStr(Stack^.pop), faDirectory, sr)=0  then
   repeat
     Lst.Add(sr.Name);
   until FindNext(sr)<>0;
   //FindClose(sr);
  Stack^.push(Lst.Text);
end;
/////////////////////////////////////////////////////////////////////////////////////////////////////////
//I/O procedures
procedure _RewriteFile(Stack:PStack); cdecl;
var F:textfile;
begin
 Assign(F,ExtractStr(Stack^.pop));
 Rewrite(F);
 Close(F);
end;

procedure _WriteFile(Stack:PStack); cdecl;
var F:textfile;S:string;
begin
 Assign(F,ExtractStr(Stack^.pop));
 Rewrite(F);
 S:=Stack^.pop;
 if isStr(s) then s:=ExtractStr(s);
 Write(F,s);
 Close(F);
end;

procedure _AppendFile(Stack:PStack); cdecl;
var F:textfile;S:string;
begin
 Assign(F,ExtractStr(Stack^.pop));
 Append(F);
 S:=Stack^.pop;
 if isStr(s) then s:=ExtractStr(s);
 Write(F,Stack^.pop);
 Close(F);
end;

procedure _ReadFile(Stack:PStack); cdecl;
var F:textfile;
    C:char;
	R:string;
begin
 R:='';
 Assign(F,ExtractStr(Stack^.pop));
 Reset(F);
 repeat
  Read(F,C);
  R:=R+C;
 until Eof(F);
 Stack^.push('"'+R+'"');
 Close(F);
end;

{EXPORTS DB}
exports _AppendFile                name 'APPENDFILE';
exports _ReadFile                  name 'READFILE';
exports _RewriteFile               name 'REWRITEFILE';
exports _WriteFile                 name 'WRITEFILE';

exports _FileExists                name 'FILEEXISTS';
exports _CreateDir                 name 'CREATEDIR';
exports _CreateFile                name 'CREATEFILE';
exports _DScanMD                   name 'DSCANMD';
exports _FScanMD                   name 'FSCANMD';
exports _ScanMD                    name 'SCANMD';
exports _DeleteDir                 name 'DELETEDIR';
exports _DeleteFile                name 'DELETEFILE';
exports _FileSize                  name 'FILESIZE';
exports _MoveFile                  name 'MOVEFILE';
exports _RemoveDir                 name 'REMOVEDIR';
exports _RenameFile                name 'RENAMEFILE';


begin
end.
