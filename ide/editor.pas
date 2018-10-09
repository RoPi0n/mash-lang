unit Editor;

{$mode objfpc}{$H+}

interface

uses
  Classes, Windows, SysUtils, FileUtil, SynEdit, SynHighlighterAny,
  SynCompletion, Forms, Controls, ComCtrls, ExtCtrls,
  StdCtrls, Menus, Global, Dialogs, Types, LCLType, Graphics;

type

  { TEditorFrame }

  TEditorFrame = class(TFrame)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    ReplaceDlgPanel: TPanel;
    ImageList1: TImageList;
    FindDlgPanel: TPanel;
    PopupMenu1: TPopupMenu;
    SaveDialog1: TSaveDialog;
    SynAnySyn1: TSynAnySyn;
    SynCompletion: TSynCompletion;
    SelfTab: TTabSheet;
    SelfStates: TStatusBar;
    CWUpdateTimer: TTimer;
    SynEdit: TSynEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    constructor CreateEditor(TabSheet:TTabSheet; StatusBar:TStatusBar;
                             OpenOp:TOpenOp; OpenParam:string);
    procedure CWUpdateTimerTimer(Sender: TObject);
    destructor Destroy; override;
    procedure FindDlg;
    procedure MenuItem10Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure MenuItem9Click(Sender: TObject);
    procedure ReplaceDlg;
    procedure SynCompletionCodeCompletion(var Value: string;
      SourceValue: string; var SourceStart, SourceEnd: TPoint;
      KeyChar: TUTF8Char; Shift: TShiftState);
    function SynCompletionPaintItem(const AKey: string; ACanvas: TCanvas; X,
      Y: integer; Selected: boolean; Index: integer): boolean;
    procedure SynEditChange(Sender: TObject);
    procedure SynEditKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState
      );
    procedure SynEditMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure UpdateState;
    function  CW_MakeDescr(wrd, descr, infile:string):string;
    procedure CW_Add(s:string);
    procedure CW_Update;
    procedure CW_ParseFile(fp:string);
  private
    CW_ParsedFiles, CW_Lst:TStringList;
    CW_MaxWordLen, CW_MaxDescrLen, CW_LastMaxWordLen, CW_LastMaxDescrLen:word;
  public
    DefFile:string;
    Saved:boolean;
  end;

implementation

{$R *.lfm}

constructor TEditorFrame.CreateEditor(TabSheet:TTabSheet; StatusBar:TStatusBar;
                                      OpenOp:TOpenOp; OpenParam:string);
begin
  inherited Create(SelfTab);
  CW_ParsedFiles := TStringList.Create;
  CW_Lst := TStringList.Create;
  CW_MaxWordLen := 0;
  CW_MaxDescrLen := 0;
  CW_LastMaxWordLen := 0;
  CW_LastMaxDescrLen := 0;
  Self.Parent := SelfTab;
  SelfTab := TabSheet;
  SelfStates := StatusBar;
  Saved := False;
  case OpenOp of
    opopOpen: begin
                SynEdit.Lines.LoadFromFile(OpenParam);
                Saved := True;
                CW_ParseFile(OpenParam);
              end;
  end;
  DefFile := OpenParam;
  FindDlgPanel.Visible := False;
  ReplaceDlgPanel.Visible := False;
  SynEdit.SetFocus;
end;

procedure TEditorFrame.CWUpdateTimerTimer(Sender: TObject);
begin
  if FileExists(DefFile) then
   begin
     CW_ParsedFiles.Clear;
     CW_Lst.Clear;
     CW_MaxWordLen := 0;
     CW_MaxDescrLen := 0;
     CW_ParseFile(DefFile);
     CW_Update;
   end;
end;

destructor TEditorFrame.Destroy;
begin
  FreeAndNil(CW_ParsedFiles);
  FreeAndNil(CW_Lst);
  inherited;
end;

procedure TEditorFrame.Button2Click(Sender: TObject);
begin
  FindDlgPanel.Visible := False;
end;

procedure TEditorFrame.Button3Click(Sender: TObject);
begin
  if CheckBox2.Checked then
   SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text,[])
  else
   SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text,[rfIgnoreCase]);
end;

procedure TEditorFrame.Button1Click(Sender: TObject);
var
  p:cardinal;
  s:string;
begin
  if Edit1.Text <> SynEdit.SelText then
   begin //find first
     if CheckBox1.Checked then
      p := Pos(Edit1.Text, SynEdit.Text)
     else
      p := Pos(LowerCase(Edit1.Text), LowerCase(SynEdit.Text));
     if p<>0 then
      begin
        SynEdit.SelStart := p;
        SynEdit.SelEnd := p+Length(Edit1.Text);
      end
     else
      begin
        ShowMessage('No matches found.');
        SynEdit.SelEnd := SynEdit.SelStart;
      end;
   end
  else
   begin //find next
     s := SynEdit.Text;
     Delete(s,1,SynEdit.SelEnd);
     if CheckBox1.Checked then
      p := Pos(Edit1.Text, s)
     else
      p := Pos(LowerCase(Edit1.Text), LowerCase(s));
     if p<>0 then
      begin
        p := SynEdit.SelEnd+p;
        SynEdit.SelStart := p;
        SynEdit.SelEnd := p+Length(Edit1.Text);
      end
     else
      begin
        SynEdit.SelEnd := SynEdit.SelStart;
        Button1Click(Sender);
      end;
   end;
end;

procedure TEditorFrame.Button4Click(Sender: TObject);
begin
  ReplaceDlgPanel.Visible := False;
end;

procedure TEditorFrame.Button5Click(Sender: TObject);
begin
  if CheckBox2.Checked then
   SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text,[rfReplaceAll])
  else
   SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text,[rfIgnoreCase,rfReplaceAll]);
end;

procedure TEditorFrame.FindDlg;
begin
  ReplaceDlgPanel.Visible := False;
  FindDlgPanel.Visible := True;
  Edit1.SetFocus;
end;

procedure TEditorFrame.MenuItem10Click(Sender: TObject);
begin
  SynEdit.SelectAll;
end;

procedure TEditorFrame.MenuItem1Click(Sender: TObject);
begin
  SynEdit.Undo;;
end;

procedure TEditorFrame.MenuItem2Click(Sender: TObject);
begin
  SynEdit.Redo;
end;

procedure TEditorFrame.MenuItem4Click(Sender: TObject);
begin
  FindDlg;
end;

procedure TEditorFrame.MenuItem5Click(Sender: TObject);
begin
  ReplaceDlg;
end;

procedure TEditorFrame.MenuItem7Click(Sender: TObject);
begin
  SynEdit.CutToClipboard;
end;

procedure TEditorFrame.MenuItem8Click(Sender: TObject);
begin
  SynEdit.CopyToClipboard;
end;

procedure TEditorFrame.MenuItem9Click(Sender: TObject);
begin
  SynEdit.PasteFromClipboard;
end;

procedure TEditorFrame.ReplaceDlg;
begin
  FindDlgPanel.Visible := False;
  ReplaceDlgPanel.Visible := True;
  Edit2.SetFocus;
end;

procedure TEditorFrame.SynCompletionCodeCompletion(var Value: string;
  SourceValue: string; var SourceStart, SourceEnd: TPoint; KeyChar: TUTF8Char;
  Shift: TShiftState);
begin
  Delete(Value,Pos('`',Value),Length(Value));
end;

function TEditorFrame.SynCompletionPaintItem(const AKey: string;
  ACanvas: TCanvas; X, Y: integer; Selected: boolean; Index: integer): boolean;
var
  s,wrd,desc,infile:string;
begin
  s := SynCompletion.ItemList[Index];
  wrd := copy(s,1,pos('`',s)-1);
  delete(s,1,pos('`',s));
  desc := copy(s,1,pos('`',s)-1);
  delete(s,1,pos('`',s));
  infile := s;
  if Selected then
   begin
     ACanvas.Brush.Color := clHighlight;
     ACanvas.FillRect(X,Y,X+SynCompletion.Width,Y+ACanvas.TextHeight('|'));
     ACanvas.Font.Style := [fsBold];
     ACanvas.Font.Color := clWhite;
     ACanvas.TextOut(X+2,Y,wrd);
     ACanvas.Font.Style := [];
     ACanvas.Font.Color := clSilver;
     ACanvas.TextOut(X+2+ACanvas.TextWidth('_')*(CW_LastMaxWordLen+8),Y,desc);
     ACanvas.Font.Style := [];
     ACanvas.Font.Color := clSilver;
     ACanvas.TextOut(X+2+ACanvas.TextWidth('_')*(CW_LastMaxWordLen+8)
                        +ACanvas.TextWidth('_')*(CW_LastMaxDescrLen+8),Y,infile);
   end
  else
   begin
     ACanvas.Brush.Color := clWhite;
     ACanvas.FillRect(X,Y,X+SynCompletion.Width,Y+ACanvas.TextHeight('|'));
     ACanvas.Font.Style := [fsBold];
     ACanvas.Font.Color := clBlack;
     ACanvas.TextOut(X+2,Y,wrd);
     ACanvas.Font.Style := [];
     ACanvas.Font.Color := clBlue;
     if copy(desc,1,4) = 'proc' then
       ACanvas.Font.Color := clMaroon;
     if (desc[1] = '[') and (desc[2] <> '@') then
       ACanvas.Font.Color := clOlive;
     ACanvas.TextOut(X+2+ACanvas.TextWidth('_')*(CW_LastMaxWordLen+8),Y,desc);
     ACanvas.Font.Style := [];
     ACanvas.Font.Color := clGreen;
     ACanvas.TextOut(X+2+ACanvas.TextWidth('_')*(CW_LastMaxWordLen+8)
                        +ACanvas.TextWidth('_')*(CW_LastMaxDescrLen+8),Y,infile);
   end;
  Result := True;
end;

procedure TEditorFrame.SynEditChange(Sender: TObject);
begin
  Saved := False;
  UpdateState;
end;

procedure TEditorFrame.SynEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
   case Key of
     VK_S:    begin
                if FileExists(DefFile) then
                 begin
                   SynEdit.Lines.SaveToFile(DefFile);
                   Saved := True;
                   UpdateState;
                 end
                else
                if SaveDialog1.Execute then
                 begin
                   DefFile := SaveDialog1.FileName;
                   SelfTab.Caption := ExtractFileName(DefFile)+'  [X]';
                   SynEdit.Lines.SaveToFile(DefFile);
                   Saved := True;
                   UpdateState;
                 end;
              end;
     VK_F:    FindDlg;
     VK_R:    ReplaceDlg;
   end;
end;

procedure TEditorFrame.SynEditMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  UpdateState;
end;

procedure TEditorFrame.UpdateState;
begin
  SelfStates.Panels[0].Text := 'Lines: '+IntToStr(SynEdit.Lines.Count);
  SelfStates.Panels[1].Text := 'CaretXY: '+IntToStr(SynEdit.CaretX)+'/'+
                               IntToStr(SynEdit.CaretY);
  if Saved then
   SelfStates.Panels[2].Text := 'Status: Saved'
  else
   SelfStates.Panels[2].Text := 'Status: Modified';
  SelfStates.Panels[3].Text := 'File: "'+DefFile+'"';
end;

function CheckName(n:string):boolean;
var
  chars: set of char = ['a'..'z','0'..'9','_','.'];
begin
  result := false;
  if not (n[1] in ['0'..'9']) then
   begin
    delete(n,1,1);
    while Length(n)>0 do
     begin
       if not (n[1] in chars) then
        exit;
       delete(n,1,1);
     end;
    result := true;
   end;
end;

function TrimCodeStr(s:string):string;
var
  ConstStr: boolean;
begin
  s := Trim(s);
  ConstStr := false;
  Result := '';
  while Length(s)>0 do
   begin
     if s[1] = '"' then ConstStr := not ConstStr;
     if ConstStr then
      begin
        Result := Result+s[1];
        Delete(s,1,1);
      end
     else
      begin
        if s[1] = ';' then break;
        Result := Result+s[1];
        Delete(s,1,1);
      end;
   end;
end;

function Tk(s:string; w:word):string;
begin
  result := '';
  while (length(s)>0)and(w>0) do
   begin
    if s[1] = '"' then
     begin
      delete(s,1,1);
      result := copy(s,1,pos('"',s)-1);
      delete(s,1,pos('"',s));
      s := trim(s);
     end
    else
    if Pos(' ',s)>0 then
     begin
      result := copy(s,1,pos(' ',s)-1);
      delete(s,1,pos(' ',s));
      s := trim(s);
     end
    else
     begin
      result := s;
      s := '';
     end;
    dec(w);
   end;
end;

function TEditorFrame.CW_MakeDescr(wrd, descr, infile:string):string;
begin
  if CW_MaxWordLen < Length(wrd) then
   CW_MaxWordLen := Length(wrd);
  if CW_MaxDescrLen < Length(descr) then
   CW_MaxDescrLen := Length(descr);
  Result := wrd+'`'+descr+'`'+infile;
end;

procedure TEditorFrame.CW_Add(s:string);
begin
  if CW_Lst.IndexOf(s) = -1 then
   begin
     CW_Lst.Add(s);
   end;
end;

procedure TEditorFrame.CW_Update;
begin
  CW_LastMaxWordLen := CW_MaxWordLen;
  CW_LastMaxDescrLen := CW_MaxDescrLen;
  SynCompletion.ItemList.Text := CW_Lst.Text;
end;

procedure TEditorFrame.CW_ParseFile(fp:string);
var
  s,fp2:string;
  f:textfile;
begin
  AssignFile(f,fp);
  Reset(f);
  CW_ParsedFiles.Add(fp);
  while not Eof(f) do
   begin
    ReadLn(f,s);
    s := TrimCodeStr(s);
    if s <> '' then
     begin
       if Tk(s,1) = 'uses' then
        begin
          Delete(s,1,length('uses'));
          s := Trim(s);
          if s[1] = '<' then
           fp2 := ExtractFilePath(ParamStr(0))+'inc\'
          else
           if FileExists(fp) then
            fp2 := ExtractFilePath(fp);
          Delete(s,1,1);
          Delete(s,Length(s),1);
          fp2 := fp2 + s;
          if FileExists(fp2) and (CW_ParsedFiles.IndexOf(fp2) = -1) then
           CW_ParseFile(fp2);
        end;
       if Tk(s,1) = 'import' then
        begin
          CW_Add(CW_MakeDescr(Tk(s,2),'[@] "'+Tk(s,3)+'":"'+Tk(s,4)+'"',
                 '"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'proc' then
        begin
          delete(s,1,length('proc'));
          s := Trim(s);
          CW_Add(CW_MakeDescr(copy(s,1,pos('(',s)-1),'proc '+s,'"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'func' then
        begin
          delete(s,1,length('func'));
          s := Trim(s);
          CW_Add(CW_MakeDescr(copy(s,1,pos('(',s)-1),'func '+s,'"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'word' then
        begin
          CW_Add(CW_MakeDescr(Tk(s,2),'[word] '+Tk(s,3),'"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'int' then
        begin
          CW_Add(CW_MakeDescr(Tk(s,2),'[int] '+Tk(s,3),'"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'real' then
        begin
          CW_Add(CW_MakeDescr(Tk(s,2),'[real] '+Tk(s,3),'"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'str' then
        begin
          CW_Add(CW_MakeDescr(Tk(s,2),'[str] "'+Tk(s,3)+'"','"'+ExtractFileName(fp)+'"'));
        end;
       if Tk(s,1) = 'stream' then
        begin
          CW_Add(CW_MakeDescr(Tk(s,2),'[stream] "'+Tk(s,3)+'"','"'+ExtractFileName(fp)+'"'));
        end;
       {if s[Length(s)] = ':' then
        begin
         Delete(s,length(s),1);
         CW_Add(CW_MakeDescr(s,'[label] '+s+':','"'+ExtractFileName(fp)+'"'));
        end;}
     end;
   end;
  CloseFile(f);
end;

end.

