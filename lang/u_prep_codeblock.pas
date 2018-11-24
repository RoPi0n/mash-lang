unit u_prep_codeblock;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TBlockEntryType = (btProc, btFunc, btIf, btFor, btWhile, btUntil, btTry, btClass,
                     btSwitch, btCase);

  TCodeBlock = class(TObject)
  public
    bType: TBlockEntryType;
    mName, bMeta, bMCode, bEndCode: string;
    constructor Create(bt: TBlockEntryType; MT, MC, EC: string);
  end;

implementation

constructor TCodeBlock.Create(bt: TBlockEntryType; MT, MC, EC: string);
begin
  inherited Create;
  self.bType := bt;
  self.bMeta := MT;
  self.bMCode := MC;
  self.bEndCode := EC;
end;

end.

