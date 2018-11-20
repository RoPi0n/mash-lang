unit u_variables;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, u_global;

type
  TVarManager = class(TObject)
  public
    DefinedVars: TStringList;
    constructor Create;
    destructor Destroy; override;
    procedure DefVar(Name: string);
    function Get(Name: string): cardinal;
  end;

implementation

{** Variables **}

constructor TVarManager.Create;
begin
  DefinedVars := TStringList.Create;
  inherited Create;
end;

destructor TVarManager.Destroy;
begin
  FreeAndNil(DefinedVars);
  inherited Destroy;
end;

procedure TVarManager.DefVar(Name: string);
begin
  if not CheckName(Name) then
    AsmError('Invalid variable name "' + Name + '".');
  if DefinedVars.IndexOf(Name) = -1 then
    DefinedVars.Add(Name);
  //else
  // AsmError('Trying to redefine variable "'+name+'".');
end;

function TVarManager.Get(Name: string): cardinal;
begin
  Result := DefinedVars.IndexOf(Name);
  if Result = -1 then
    AsmError('Invalid variable call "' + Name + '".');
end;

end.

