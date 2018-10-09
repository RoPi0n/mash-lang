program mash_ide;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, lazcontrols, synuni, MainForm, Editor, global, aboutform, Debugger;

{$R *.res}

begin
  //Application.Scaled:=True;
  RequireDerivedFormResource:=True;
  Application.Initialize;
  Application.CreateForm(TMainFrm, MainFrm);
  Application.CreateForm(TAboutFrm, AboutFrm);
  Application.CreateForm(TDebuggerFrm, DebuggerFrm);
  Application.Run;
end.

