unit dbgframe;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, ExtCtrls, StdCtrls, Dialogs;

type

  { TDebuggerFrame }

  TDebuggerFrame = class(TFrame)
    DbgMakeDumpButton: TButton;
    DbgStartStopButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    DbgVarsLB: TListBox;
    DbgStackLB: TListBox;
    Label8: TLabel;
    Label9: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    Panel7: TPanel;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    procedure DbgMakeDumpButtonClick(Sender: TObject);
  private

  public

  end;

implementation

{$R *.lfm}

{ TDebuggerFrame }

procedure TDebuggerFrame.DbgMakeDumpButtonClick(Sender: TObject);
var
  f: textfile;
begin
  if SaveDialog1.Execute then
   begin
     AssignFile(f, SaveDialog1.FileName);
     Rewrite(f);
     writeln(f, 'Mash IDE debugger dump.');
     writeln(f, 'Date/Time: ', DateTimeToStr(Now));
     writeln(f, '');
     writeln(f, '*** VM memory table dump ***');
     writeln(f, '');
     writeln(f, DbgVarsLB.Items.Text);
     writeln(f, '');
     writeln(f, '*** VM main stack dump ***');
     writeln(f, '');
     writeln(f, DbgStackLB.Items.Text);
     writeln(f, '');
     writeln(f, '*** VM thread dump ***');
     writeln(f, '');
     writeln(f, Label9.Caption);
     writeln(f, Label1.Caption);
     writeln(f, Label2.Caption);
     writeln(f, Label3.Caption);
     writeln(f, Label6.Caption);
     writeln(f, Label4.Caption);
     writeln(f, Label5.Caption);
     writeln(f, Label8.Caption);
     CloseFile(f);
   end;
end;

end.

