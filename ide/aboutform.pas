unit aboutform;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls;

type

  { TAboutFrm }

  TAboutFrm = class(TForm)
    Button1: TButton;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure Button1Click(Sender: TObject);
  private

  public

  end;

var
  AboutFrm: TAboutFrm;

implementation

{$R *.lfm}

{ TAboutFrm }

procedure TAboutFrm.Button1Click(Sender: TObject);
begin
  Close;
end;

end.

