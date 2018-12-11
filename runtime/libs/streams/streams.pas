library Streams;

uses SysUtils, Classes, svm_api in '..\svm_api.pas';

{STREAM}

procedure _Stream_Create(Stack:PStack); cdecl;
begin
  Stack^.push(TStream.Create);
end;

procedure _Stream_Seek(Stack:PStack); cdecl;
begin
  TStream(Stack^.popv).Seek(TSVMMem(Stack^.popv).GetW, TSeekOrigin(TSVMMem(Stack^.popv).GetW));
end;

procedure _Stream_GetCaretPos(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TStream(Stack^.popv).Position));
end;

procedure _Stream_WriteFromMemoryStream(Stack:PStack); cdecl;
var
  Dest:TStream;
  Src:TMemoryStream;
begin
  Dest := TStream(Stack^.popv);
  Src := TMemoryStream(Stack^.popv);
  Dest.Write(PByte(Cardinal(Src.Memory) + Src.Position)^, TSVMMem(Stack^.popv).GetW);
end;

procedure _Stream_ReadFromMemoryStream(Stack:PStack); cdecl;
var
  Dest:TStream;
  Src:TMemoryStream;
begin
  Dest := TStream(Stack^.popv);
  Src := TMemoryStream(Stack^.popv);
  Dest.Read(PByte(Cardinal(Src.Memory) + Src.Position)^, TSVMMem(Stack^.popv).GetW);
end;

procedure _Stream_CopyFromStream(Stack:PStack); cdecl;
begin
  TStream(Stack^.popv).CopyFrom(TStream(Stack^.popv), TSVMMem(Stack^.popv).GetW);
end;

procedure _Stream_WriteByte(Stack:PStack); cdecl;
var
  Dest:TStream;
begin
  Dest := TStream(Stack^.popv);
  Dest.WriteByte(TSVMMem(Stack^.popv).GetW);
end;

procedure _Stream_WriteWord(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Cardinal;
begin
  Dest := TStream(Stack^.popv);
  Val := TSVMMem(Stack^.popv).GetW;
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteInt(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Int64;
begin
  Dest := TStream(Stack^.popv);
  Val := TSVMMem(Stack^.popv).GetI;
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteFloat(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Double;
begin
  Dest := TStream(Stack^.popv);
  Val := TSVMMem(Stack^.popv).GetD;
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteStr(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:String;
begin
  Dest := TStream(Stack^.popv);
  Val := TSVMMem(Stack^.popv).GetS;
  Dest.Write(Val[1], Length(Val));
end;

procedure _Stream_ReadByte(Stack:PStack); cdecl;
var
  Dest:TStream;
begin
  Dest := TStream(Stack^.popv);
  TSVMMem(Stack^.popv).SetW(Dest.ReadByte);
end;

procedure _Stream_ReadWord(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Cardinal;
begin
  Dest := TStream(Stack^.popv);
  Dest.Read(Val, SizeOf(Val));
  TSVMMem(Stack^.popv).SetW(Val);
end;

procedure _Stream_ReadInt(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Int64;
begin
  Dest := TStream(Stack^.popv);
  Dest.Read(Val, SizeOf(Val));
  TSVMMem(Stack^.popv).SetI(Val);
end;

procedure _Stream_ReadFloat(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Double;
begin
  Dest := TStream(Stack^.popv);
  Dest.Read(Val, SizeOf(Val));
  TSVMMem(Stack^.popv).SetD(Val);
end;

procedure _Stream_ReadStr(Stack:PStack); cdecl;
var
  Dest:TStream;
  Val:Pointer;
  Len:Cardinal;
  S:String;
begin
  Dest := TStream(Stack^.popv);
  Val := Stack^.popv;
  Len := TSVMMem(Stack^.popv).GetW;
  SetLength(S, Len);
  Dest.Read(S[1], Len);
  TSVMMem(Stack^.popv).SetS(S);
end;

procedure _Stream_GetSize(Stack:PStack); cdecl;
begin
  Stack^.push(TSVMMem.CreateFW(TStream(Stack^.popv).Size));
end;

procedure _Stream_Clear(Stack:PStack); cdecl;
begin
  TStream(Stack^.popv).Size := 0;
end;

procedure _Stream_Free(Stack:PStack); cdecl;
begin
  TStream(Stack^.popv).Free;
end;

{MEMORYSTREAM}

procedure _MemoryStream_Create(Stack:PStack); cdecl;
begin
  Stack^.push(TMemoryStream.Create);
end;

procedure _MemoryStream_Free(Stack:PStack); cdecl;
begin
  TMemoryStream(Stack^.popv).Free;
end;

procedure _MemoryStream_LoadFromStream(Stack:PStack); cdecl;
begin
  TMemoryStream(Stack^.popv).LoadFromStream(TStream(Stack^.popv));
end;

procedure _MemoryStream_StoreToStream(Stack:PStack); cdecl;
begin
  TMemoryStream(Stack^.popv).SaveToStream(TStream(Stack^.popv));
end;

procedure _MemoryStream_LoadFromFile(Stack:PStack); cdecl;
begin
  TMemoryStream(Stack^.popv).LoadFromFile(TSVMMem(Stack^.popv).GetS);
end;

procedure _MemoryStream_SaveToFile(Stack:PStack); cdecl;
begin
  TMemoryStream(Stack^.popv).SaveToFile(TSVMMem(Stack^.popv).GetS);
end;

{FILESTREAM}

procedure _FileStream_Create(Stack:PStack); cdecl;
var
  p:TSVMMem;
begin
  p := TSVMMem(Stack^.popv);
  Stack^.push(TFileStream.Create(p.GetS, TSVMMem(Stack^.popv).GetW));
end;

procedure _FileStream_Free(Stack:PStack); cdecl;
begin
  TFileStream(Stack^.popv).Free;
end;

{EXPORTS DB}
exports _Stream_Create                 name '_Stream_Create';
exports _Stream_Seek                   name '_Stream_Seek';
exports _Stream_GetCaretPos            name '_Stream_GetCaretPos';
exports _Stream_WriteFromMemoryStream  name '_Stream_WriteFromMemoryStream';
exports _Stream_ReadFromMemoryStream   name '_Stream_ReadFromMemoryStream';
exports _Stream_CopyFromStream         name '_Stream_CopyFromStream';
exports _Stream_WriteByte              name '_Stream_WriteByte';
exports _Stream_WriteWord              name '_Stream_WriteWord';
exports _Stream_WriteInt               name '_Stream_WriteInt';
exports _Stream_WriteFloat             name '_Stream_WriteFloat';
exports _Stream_WriteStr               name '_Stream_WriteStr';
exports _Stream_ReadByte               name '_Stream_ReadByte';
exports _Stream_ReadWord               name '_Stream_ReadWord';
exports _Stream_ReadInt                name '_Stream_ReadInt';
exports _Stream_ReadFloat              name '_Stream_ReadFloat';
exports _Stream_ReadStr                name '_Stream_ReadStr';
exports _Stream_GetSize                name '_Stream_GetSize';
exports _Stream_Clear                  name '_Stream_Clear';
exports _Stream_Free                   name '_Stream_Free';
exports _MemoryStream_Create           name '_MemoryStream_Create';
exports _MemoryStream_Free             name '_MemoryStream_Free';
exports _MemoryStream_LoadFromStream   name '_MemoryStream_LoadFromStream';
exports _MemoryStream_StoreToStream    name '_MemoryStream_StoreToStream';
exports _MemoryStream_LoadFromFile     name '_MemoryStream_LoadFromFile';
exports _MemoryStream_SaveToFile       name '_MemoryStream_SaveToFile';
exports _FileStream_Create             name '_FileStream_Create';
exports _FileStream_Free               name '_FileStream_Free';
begin
end.
