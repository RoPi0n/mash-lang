library Streams;

uses
  SysUtils,
  Classes,
  svm in '..\svm.pas';

{STREAM}

type
  TStreamContainer = class
    public
      stream: TStream;

      constructor Create(s: TStream);
  end;

constructor TStreamContainer.Create(s: TStream);
begin
  self.stream := s;
end;

procedure _Stream_Destructor(pStreamContainer: pointer); stdcall;
var
  sct: TStreamContainer;
begin
  sct := TStreamContainer(pStreamContainer);
  sct.stream.Free;
  sct.Free;
end;

procedure _Stream_Create(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TStreamContainer.Create(TStream.Create), @_Stream_Destructor);
end;

procedure _Stream_Seek(pctx: pointer); stdcall;
var
  St:TStream;
  P: Cardinal;
begin
  St := TStream(TStreamContainer(__Next_Ref(pctx)).stream);
  P := __Next_Word(pctx);
  St.Seek(P, TSeekOrigin(__Next_Word(pctx)));
end;

procedure _Stream_GetCaretPos(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TStreamContainer(__Next_Ref(pctx)).stream.Position);
end;

procedure _Stream_WriteFromMemoryStream(pctx: pointer); stdcall;
var
  Dest:TStream;
  Src:TMemoryStream;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Src := TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream);
  Dest.Write(PByte(Cardinal(Src.Memory) + Src.Position)^, __Next_Word(pctx));
end;

procedure _Stream_ReadFromMemoryStream(pctx: pointer); stdcall;
var
  Dest:TStream;
  Src:TMemoryStream;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Src := TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream);
  Dest.Read(PByte(Cardinal(Src.Memory) + Src.Position)^, __Next_Word(pctx));
end;

procedure _Stream_CopyFromStream(pctx: pointer); stdcall;
var
  St, From: TStream;
begin
  St := TStreamContainer(__Next_Ref(pctx)).stream;
  From := TStreamContainer(__Next_Ref(pctx)).stream;
  St.CopyFrom(From, __Next_Word(pctx));
end;

procedure _Stream_WriteByte(pctx: pointer); stdcall;
var
  Dest:TStream;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Dest.WriteByte(__Next_Word(pctx));
end;

procedure _Stream_WriteWord(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Cardinal;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Val := __Next_Word(pctx);
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteInt(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Int64;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Val := __Next_Int(pctx);
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteFloat(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Double;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Val := __Next_Float(pctx);
  Dest.Write(Val, SizeOf(Val));
end;

procedure _Stream_WriteStr(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:String;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Val := '';
  __Next_String(pctx, @Val);
  Dest.Write(Val[1], Length(Val));
end;

procedure _Stream_ReadByte(pctx: pointer); stdcall;
var
  Dest:TStream;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  __Return_Word(pctx, Dest.ReadByte);
end;

procedure _Stream_ReadWord(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Cardinal;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Val := 0;
  Dest.Read(Val, SizeOf(Val));
  __Return_Word(pctx, Val);
end;

procedure _Stream_ReadInt(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Int64;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Val := 0;
  Dest.Read(Val, SizeOf(Val));
  __Return_Int(pctx, Val);
end;

procedure _Stream_ReadFloat(pctx: pointer); stdcall;
var
  Dest:TStream;
  Val:Double;
begin
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
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
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Len := __Next_Word(pctx);
  SetLength(S, Len);
  Dest.Read(S[1], Len);
  __Return_StringA(pctx, S);
end;

procedure _Stream_CopyBuffer(pctx: pointer); stdcall;
var
  From, Dest:TStream;
  Buf:TBytes;
  Len:Cardinal;
  S:String;
begin
  From := TStreamContainer(__Next_Ref(pctx)).stream;
  Dest := TStreamContainer(__Next_Ref(pctx)).stream;
  Len := __Next_Word(pctx);

  try
    SetLength(Buf, Len);
    From.Read(Buf, Len);
    Dest.Write(Buf, Len);
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;

  SetLength(Buf, 0);
end;

procedure _Stream_GetSize(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TStreamContainer(__Next_Ref(pctx)).stream.Size);
end;

procedure _Stream_Clear(pctx: pointer); stdcall;
begin
  TStreamContainer(__Next_Ref(pctx)).stream.Size := 0;
end;

procedure _Stream_UnPack(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TStreamContainer(__Next_Ref(pctx)).stream, nil);
end;

{MEMORYSTREAM}

procedure _MemoryStream_Destructor(pStreamContainer: pointer); stdcall;
var
  sct: TStreamContainer;
begin
  sct := TStreamContainer(pStreamContainer);
  TMemoryStream(sct.stream).Free;
  sct.Free;
end;

procedure _MemoryStream_Create(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TStreamContainer.Create(TMemoryStream.Create), @_MemoryStream_Destructor);
end;

procedure _MemoryStream_LoadFromResource(pctx: pointer); stdcall;
var
  Ms: TMemoryStream;
begin
  Ms := TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream);
  Ms.LoadFromStream(TStream(__Next_Ref(pctx)));
end;

procedure _MemoryStream_LoadFromStream(pctx: pointer); stdcall;
var
  Ms: TMemoryStream;
begin
  Ms := TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream);
  Ms.LoadFromStream(TStreamContainer(__Next_Ref(pctx)).stream);
end;

procedure _MemoryStream_StoreToStream(pctx: pointer); stdcall;
var
  Ms: TMemoryStream;
begin
  Ms := TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream);
  Ms.SaveToStream(TStreamContainer(__Next_Ref(pctx)).stream);
end;

procedure _MemoryStream_LoadFromFile(pctx: pointer); stdcall;
var
  fp: string;
begin
  try
    fp := __Next_StringA(pctx);

    if not (Pos(':', fp) > 0) then
      fp := ExtractFilePath(ParamStr(1)) + fp;

    TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream).LoadFromFile(fp);
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

procedure _MemoryStream_SaveToFile(pctx: pointer); stdcall;
var
  fp: string;
begin
  try
    fp := __Next_StringA(pctx);

    if not (Pos(':', fp) > 0) then
      fp := ExtractFilePath(ParamStr(1)) + fp;

    TMemoryStream(TStreamContainer(__Next_Ref(pctx)).stream).SaveToFile(fp);
    __Return_Bool(pctx, true);
  except
    __Return_Bool(pctx, false);
  end;
end;

{FILESTREAM}

procedure _FileStream_Destructor(pStreamContainer: pointer); stdcall;
var
  sct: TStreamContainer;
begin
  sct := TStreamContainer(pStreamContainer);
  if sct.stream <> nil then
   TFileStream(sct.stream).Free;
  sct.Free;
end;

procedure _FileStream_Create(pctx: pointer); stdcall;
var
  fp: string;
begin
  try
    fp := __Next_StringA(pctx);

    if not (Pos(':', fp) > 0) then
      fp := ExtractFilePath(ParamStr(1)) + fp;

    __Return_Ref(pctx,
                 TStreamContainer.Create(TFileStream.Create(fp, __Next_Word(pctx))),
                 @_FileStream_Destructor);
  except
    __Return_Null(pctx);
  end;
end;

procedure _FileStream_Close(pctx: pointer); stdcall;
var
  sct: TStreamContainer;
begin
  sct := TStreamContainer(__Next_Ref(pctx));
  TFileStream(sct.stream).Free;
  sct.stream := nil;
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
exports _Stream_CopyBuffer             name '_Stream_CopyBuffer';
exports _Stream_GetSize                name '_Stream_GetSize';
exports _Stream_Clear                  name '_Stream_Clear';
exports _Stream_UnPack                 name '_Stream_UnPack';

exports _MemoryStream_Create           name '_MemoryStream_Create';
exports _MemoryStream_LoadFromResource name '_MemoryStream_LoadFromResource';
exports _MemoryStream_LoadFromStream   name '_MemoryStream_LoadFromStream';
exports _MemoryStream_StoreToStream    name '_MemoryStream_StoreToStream';
exports _MemoryStream_LoadFromFile     name '_MemoryStream_LoadFromFile';
exports _MemoryStream_SaveToFile       name '_MemoryStream_SaveToFile';

exports _FileStream_Create             name '_FileStream_Create';
exports _FileStream_Close              name '_FileStream_Close';

begin
end.
