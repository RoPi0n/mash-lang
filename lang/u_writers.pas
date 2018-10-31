unit u_writers;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

procedure St_WriteWord(s: TStream; w: word);
procedure St_WriteCardinal(s: TStream; c: cardinal);
procedure St_WriteInt64(s: TStream; i: int64);
procedure St_WriteDouble(s: TStream; d: double);

implementation

procedure St_WriteWord(s: TStream; w: word);
begin
  s.WriteByte(PByte(cardinal(@w) + 1)^);
  s.WriteByte(PByte(@w)^);
end;

procedure St_WriteCardinal(s: TStream; c: cardinal);
begin
  s.WriteByte(PByte(cardinal(@c) + 3)^);
  s.WriteByte(PByte(cardinal(@c) + 2)^);
  s.WriteByte(PByte(cardinal(@c) + 1)^);
  s.WriteByte(PByte(@c)^);
end;

procedure St_WriteInt64(s: TStream; i: int64);
begin
  s.WriteByte(PByte(cardinal(@i) + 7)^);
  s.WriteByte(PByte(cardinal(@i) + 6)^);
  s.WriteByte(PByte(cardinal(@i) + 5)^);
  s.WriteByte(PByte(cardinal(@i) + 4)^);
  s.WriteByte(PByte(cardinal(@i) + 3)^);
  s.WriteByte(PByte(cardinal(@i) + 2)^);
  s.WriteByte(PByte(cardinal(@i) + 1)^);
  s.WriteByte(PByte(@i)^);
end;

procedure St_WriteDouble(s: TStream; d: double);
begin
  s.WriteByte(PByte(cardinal(@d) + 7)^);
  s.WriteByte(PByte(cardinal(@d) + 6)^);
  s.WriteByte(PByte(cardinal(@d) + 5)^);
  s.WriteByte(PByte(cardinal(@d) + 4)^);
  s.WriteByte(PByte(cardinal(@d) + 3)^);
  s.WriteByte(PByte(cardinal(@d) + 2)^);
  s.WriteByte(PByte(cardinal(@d) + 1)^);
  s.WriteByte(PByte(@d)^);
end;

end.

