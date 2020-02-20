unit u_gen;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_sem,
  u_gen_svm;

type
  TMashGenArch = (gaSVM);

procedure GenerateCode(Arch: TMashGenArch; sem: TMashSEM; outp: TStringList);

implementation

procedure GenerateCode(Arch: TMashGenArch; sem: TMashSEM; outp: TStringList);
var
  p: pointer;
begin
  case Arch of
    gaSVM:
     begin
       p := TMashGeneratorSVM.Create;
       TMashGeneratorSVM(p).Generate(Sem, Outp);
       FreeAndNil(p);
     end;
  end;
end;

end.

