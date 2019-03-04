unit u_prep_codeblock;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TBlockEntryType = (btProc, btFunc, btIf, btFor, btWhile, btWhilst, btTry, btClass,
                     btSwitch, btCase, btLaunch, btAsync);

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
  bType := bt;
  bMeta := MT;
  bMCode := MC;
  bEndCode := EC;
end;

end.

