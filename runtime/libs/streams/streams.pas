library Streams;

uses SysUtils, Classes;

{$I '..\libapi.inc'}

{STREAM}

procedure _Stream_Create(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TStream.Create);
end;

procedure _Stream_Seek(pctx: pointer); stdcall;
var
  St:TStream;
  P: Cardinal;
begin
  St := TStream(__Next_Ref(pctx));
  P := __Next_Word(pctx);
  St.Seek(P, TSeekOrigin(__Next_Word(pctx)));
end;

procedure _Stream_GetCaretPos(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TStream(__Next_Ref(pctx)).Position);
end;

procedure _Stream_WriteFromMemoryStream(pctx: pointer); stdcall;
var
  Dest:TStream;
  Src:TMemoryStream;
begin
  Dest := TStream(__Next_Ref(pctx));
  Src := TMemoryStream(__Next_Ref(pctx));
  Dest.Write(PByte(Cardinal(Src.Memory) + Src.Position)^, __Next_Word(pctx));
end;

procedure _Stream_ReadFromMemoryStream(pctx: pointer); stdcall;
var
  Dest:TStream;
  Src:TMemoryStream;
begin
  Dest := TStream(__Next_Ref(pctx));
  Src := TMemoryStream(__Next_Ref(pctx));
  Dest.Read(PByte(Cardinal(Src.Memory) + Src.Position)^, __Next_Word(pctx));
end;

procedure _Stream_CopyFromStream(pctx: pointer); stdcall;
var
  St, From: TStream;
begin
  St := TStream(__Next_Ref(pctx));
  From := TStream(__Next_Ref(pctx));
  St.CopyFrom(From, __Next_Word(pctx));
end;

procedure _Stream_WriteByte(pctx: pointer); stdcall;
var
  Dest:TStream;
begin
  Dest := TStream(__Next_Ref(pctx));
  Dest.WriteByte(__Next_Word(pctx));
end;

procedure _Stream_WriteWord(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Cardinal;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := __Next_Word(pctx);
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteInt(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Int64;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := __Next_Int(pctx);
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteFloat(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Double;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := __Next_Float(pctx);
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteStr(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:String;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := '';
  __Next_String(pctx, @Val);
  Dest.Write(Val[1], Length(Val));
end;

procedure _Stream_ReadByte(pctx: pointer); stdcall;
var
  Dest:TStream;
begin
  Dest := TStream(__Next_Ref(pctx));
  __Return_Word(pctx, Dest.ReadByte);
end;

procedure _Stream_ReadWord(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Cardinal;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := 0;
  Dest.Read(Val, SizeOf(Val));
  __Return_Word(pctx, Val);
end;

procedure _Stream_ReadInt(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Int64;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := 0;
  Dest.Read(Val, SizeOf(Val));
  __Return_Int(pctx, Val);
end;

procedure _Stream_ReadFloat(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Double;
begin
  Dest := TStream(__Next_Ref(pctx));
  Val := 0;
  Dest.Read(Val, SizeOf(Val));
  __Return_Float(pctx, Val);
end;

procedure _Stream_ReadStr(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Pointer;
  Len:Cardinal;
  S:String;
begin
  Dest := TStream(__Next_Ref(pctx));
  Len := __Next_Word(pctx);
  SetLength(S, Len);
  Dest.Read(S[1], Len);
  __Return_String(pctx, @S);
end;

procedure _Stream_GetSize(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TStream(__Next_Ref(pctx)).Size);
end;

procedure _Stream_Clear(pctx: pointer); stdcall;
begin
  TStream(__Next_Ref(pctx)).Size := 0;
end;

procedure _Stream_Free(pctx: pointer); stdcall;
begin
  TStream(__Next_Ref(pctx)).Free;
end;

{MEMORYSTREAM}

procedure _MemoryStream_Create(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TMemoryStream.Create);
end;

procedure _MemoryStream_Free(pctx: pointer); stdcall;
begin
  TMemoryStream(__Next_Ref(pctx)).Free;
end;

procedure _MemoryStream_LoadFromStream(pctx: pointer); stdcall;
var
  Ms: TMemoryStream;
begin
  Ms := TMemoryStream(__Next_Ref(pctx));
  Ms.LoadFromStream(TStream(__Next_Ref(pctx)));
end;

procedure _MemoryStream_StoreToStream(pctx: pointer); stdcall;
var
  Ms: TMemoryStream;
begin
  Ms := TMemoryStream(__Next_Ref(pctx));
  Ms.SaveToStream(TStream(__Next_Ref(pctx)));
end;

procedure _MemoryStream_LoadFromFile(pctx: pointer); stdcall;
begin
  TMemoryStream(__Next_Ref(pctx)).LoadFromFile(__Next_String(pctx));
end;

procedure _MemoryStream_SaveToFile(pctx: pointer); stdcall;
begin
  TMemoryStream(__Next_Ref(pctx)).SaveToFile(__Next_String(pctx));
end;

{FILESTREAM}

procedure _FileStream_Create(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TFileStream.Create(__Next_String(pctx), __Next_Word(pctx)));
end;

procedure _FileStream_Free(pctx: pointer); stdcall;
begin
  TFileStream(__Next_Ref(pctx)).Free;
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
