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
    FindDlgPanel: TPanel;
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
    EditorPanel: TPanel;
    CodeSchemeImageList: TImageList;
    CodeSchemePanel: TPanel;
    Panel1: TPanel;
    PopupMenu1: TPopupMenu;
    ReplaceDlgPanel: TPanel;
    SaveDialog1: TSaveDialog;
    Splitter1: TSplitter;
    SynAnySyn1: TSynAnySyn;
    SynCompletion: TSynCompletion;
    SelfTab: TTabSheet;
    SelfStates: TStatusBar;
    CWUpdateTimer: TTimer;
    SynEdit: TSynEdit;
    CodeSchemeTimer: TTimer;
    SchemeTreeView: TTreeView;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure CodeSchemeTimerTimer(Sender: TObject);
    constructor CreateEditor(TabSheet: TTabSheet; StatusBar: TStatusBar;
      OpenOp: TOpenOp; OpenParam: string);
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
    procedure SchemeTreeViewSelectionChanged(Sender: TObject);
    procedure SynCompletionCodeCompletion(var Value: string;
      SourceValue: string; var SourceStart, SourceEnd: TPoint;
      KeyChar: TUTF8Char; Shift: TShiftState);
    function SynCompletionPaintItem(const AKey: string; ACanvas: TCanvas;
      X, Y: integer; Selected: boolean; Index: integer): boolean;
    procedure SynEditChange(Sender: TObject);
    procedure SynEditKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure SynEditKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
    procedure SynEditMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: integer);
    procedure SynEditMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure SynEditMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: boolean);
    procedure UpdateState;
    function CW_MakeDescr(wrd, descr, infile: string): string;
    procedure CW_Add(s: string);
    procedure CW_Update;
    procedure CW_ParseFile(fp: string);
  private
    CW_ParsedFiles, CW_Lst: TStringList;
    CW_MaxWordLen, CW_MaxDescrLen, CW_LastMaxWordLen, CW_LastMaxDescrLen: word;
    KeyUpCnt, LastKeyUp: cardinal;
  public
    DefFile: string;
    Saved: boolean;
  end;

implementation

{$R *.lfm}

constructor TEditorFrame.CreateEditor(TabSheet: TTabSheet; StatusBar: TStatusBar;
  OpenOp: TOpenOp; OpenParam: string);
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
  KeyUpCnt := 1;
  LastKeyUp := 0;
  case OpenOp of
    opopOpen:
    begin
      SynEdit.Lines.LoadFromFile(OpenParam);
      Saved := True;
      CW_ParseFile(OpenParam);
    end;
  end;
  DefFile := OpenParam;
  FindDlgPanel.Visible := False;
  ReplaceDlgPanel.Visible := False;
  SynEdit.SetFocus;
  CodeSchemeTimerTimer(nil);
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
    SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text, [])
  else
    SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text, [rfIgnoreCase]);
end;

procedure TEditorFrame.Button1Click(Sender: TObject);
var
  p: cardinal;
  s: string;
begin
  if Edit1.Text <> SynEdit.SelText then
  begin //find first
    if CheckBox1.Checked then
      p := Pos(Edit1.Text, SynEdit.Text)
    else
      p := Pos(LowerCase(Edit1.Text), LowerCase(SynEdit.Text));
    if p <> 0 then
    begin
      SynEdit.SelStart := p;
      SynEdit.SelEnd := p + Length(Edit1.Text);
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
    Delete(s, 1, SynEdit.SelEnd);
    if CheckBox1.Checked then
      p := Pos(Edit1.Text, s)
    else
      p := Pos(LowerCase(Edit1.Text), LowerCase(s));
    if p <> 0 then
    begin
      p := SynEdit.SelEnd + p;
      SynEdit.SelStart := p;
      SynEdit.SelEnd := p + Length(Edit1.Text);
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
    SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text, [rfReplaceAll])
  else
    SynEdit.Text := StringReplace(SynEdit.Text, Edit2.Text, Edit3.Text,
      [rfIgnoreCase, rfReplaceAll]);
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
  SynEdit.Undo;
  ;
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

procedure TEditorFrame.SchemeTreeViewSelectionChanged(Sender: TObject);
begin
  SchemeTreeView.Selected := nil;
end;

procedure TEditorFrame.SynCompletionCodeCompletion(var Value: string;
  SourceValue: string; var SourceStart, SourceEnd: TPoint; KeyChar: TUTF8Char;
  Shift: TShiftState);
begin
  Delete(Value, Pos('`', Value), Length(Value));
end;

function TEditorFrame.SynCompletionPaintItem(const AKey: string;
  ACanvas: TCanvas; X, Y: integer; Selected: boolean; Index: integer): boolean;
var
  s, wrd, desc, infile: string;
begin
  s := SynCompletion.ItemList[Index];
  wrd := copy(s, 1, pos('`', s) - 1);
  Delete(s, 1, pos('`', s));
  desc := copy(s, 1, pos('`', s) - 1);
  Delete(s, 1, pos('`', s));
  infile := s;
  if Selected then
  begin
    ACanvas.Brush.Color := clHighlight;
    ACanvas.FillRect(X, Y, X + SynCompletion.Width, Y + ACanvas.TextHeight('|'));
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Color := clWhite;
    ACanvas.TextOut(X + 2, Y, wrd);
    ACanvas.Font.Style := [];
    ACanvas.Font.Color := clSilver;
    ACanvas.TextOut(X + 2 + ACanvas.TextWidth('_') * (CW_LastMaxWordLen + 8), Y, desc);
    ACanvas.Font.Style := [];
    ACanvas.Font.Color := clSilver;
    ACanvas.TextOut(X + 2 + ACanvas.TextWidth('_') * (CW_LastMaxWordLen + 8) +
      ACanvas.TextWidth('_') * (CW_LastMaxDescrLen + 8), Y, infile);
  end
  else
  begin
    ACanvas.Brush.Color := clWhite;
    ACanvas.FillRect(X, Y, X + SynCompletion.Width, Y + ACanvas.TextHeight('|'));
    ACanvas.Font.Style := [fsBold];
    ACanvas.Font.Color := clBlack;
    ACanvas.TextOut(X + 2, Y, wrd);
    ACanvas.Font.Style := [];
    ACanvas.Font.Color := clBlue;
    if copy(desc, 1, 4) = 'proc' then
      ACanvas.Font.Color := clMaroon;
    if (desc[1] = '[') and (desc[2] <> '@') then
      ACanvas.Font.Color := clOlive;
    ACanvas.TextOut(X + 2 + ACanvas.TextWidth('_') * (CW_LastMaxWordLen + 8), Y, desc);
    ACanvas.Font.Style := [];
    ACanvas.Font.Color := clGreen;
    ACanvas.TextOut(X + 2 + ACanvas.TextWidth('_') * (CW_LastMaxWordLen + 8) +
      ACanvas.TextWidth('_') * (CW_LastMaxDescrLen + 8), Y, infile);
  end;
  Result := True;
end;

procedure TEditorFrame.SynEditChange(Sender: TObject);
begin
  Saved := False;
  UpdateState;
end;

procedure TEditorFrame.SynEditKeyDown(Sender: TObject; var Key: word;
  Shift: TShiftState);
begin
  if ssCtrl in Shift then
    case Key of
      VK_S:
      begin
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
          SelfTab.Caption := ExtractFileName(DefFile) + '  [X]';
          SynEdit.Lines.SaveToFile(DefFile);
          Saved := True;
          UpdateState;
        end;
      end;
      VK_F: FindDlg;
      VK_R: ReplaceDlg;
    end;
end;

procedure TEditorFrame.SynEditKeyUp(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  Inc(KeyUpCnt);
end;

procedure TEditorFrame.SynEditMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: integer);
begin
  UpdateState;
end;

procedure TEditorFrame.SynEditMouseWheelDown(Sender: TObject;
  Shift: TShiftState; MousePos: TPoint; var Handled: boolean);
begin
  if (GetAsyncKeyState(VK_CONTROL) <> 0) and (GetAsyncKeyState(VK_CONTROL) <> 0) then
  begin
    if SynEdit.Font.Size > 1 then
      SynEdit.Font.Size := SynEdit.Font.Size - 1;
    Handled := True;
  end;
end;

procedure TEditorFrame.SynEditMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: boolean);
begin
  if (GetAsyncKeyState(VK_CONTROL) <> 0) and (GetAsyncKeyState(VK_CONTROL) <> 0) then
  begin
    SynEdit.Font.Size := SynEdit.Font.Size + 1;
    Handled := True;
  end;
end;

procedure TEditorFrame.UpdateState;
begin
  SelfStates.Panels[0].Text := 'Lines: ' + IntToStr(SynEdit.Lines.Count);
  SelfStates.Panels[1].Text :=
    'CaretXY: ' + IntToStr(SynEdit.CaretX) + '/' + IntToStr(SynEdit.CaretY);
  if Saved then
    SelfStates.Panels[2].Text := 'Status: Saved'
  else
    SelfStates.Panels[2].Text := 'Status: Modified';
  SelfStates.Panels[3].Text := 'File: "' + DefFile + '"';
end;

function CheckName(n: string): boolean;
var
  chars: set of char = ['a'..'z', '0'..'9', '_', '.'];
begin
  Result := False;
  if not (n[1] in ['0'..'9']) then
  begin
    Delete(n, 1, 1);
    while Length(n) > 0 do
    begin
      if not (n[1] in chars) then
        exit;
      Delete(n, 1, 1);
    end;
    Result := True;
  end;
end;

function TrimCodeStr(s: string): string;
var
  ConstStr: boolean;
begin
  s := Trim(s);
  ConstStr := False;
  Result := '';
  while Length(s) > 0 do
  begin
    if s[1] = '"' then
      ConstStr := not ConstStr;
    if ConstStr then
    begin
      Result := Result + s[1];
      Delete(s, 1, 1);
    end
    else
    begin
      if copy(s, 1, 2) = '//' then
        break;
      Result := Result + s[1];
      Delete(s, 1, 1);
    end;
  end;
end;

function Tk(s: string; w: word): string;
begin
  Result := '';
  while (length(s) > 0) and (w > 0) do
  begin
    if s[1] = '"' then
    begin
      Delete(s, 1, 1);
      Result := copy(s, 1, pos('"', s) - 1);
      Delete(s, 1, pos('"', s));
      s := trim(s);
    end
    else
    if Pos(' ', s) > 0 then
    begin
      Result := copy(s, 1, pos(' ', s) - 1);
      Delete(s, 1, pos(' ', s));
      s := trim(s);
    end
    else
    begin
      Result := s;
      s := '';
    end;
    Dec(w);
  end;
end;

function TEditorFrame.CW_MakeDescr(wrd, descr, infile: string): string;
begin
  if CW_MaxWordLen < Length(wrd) then
    CW_MaxWordLen := Length(wrd);
  if CW_MaxDescrLen < Length(descr) then
    CW_MaxDescrLen := Length(descr);
  Result := wrd + '`' + descr + '`' + infile;
end;

procedure TEditorFrame.CW_Add(s: string);
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

procedure TEditorFrame.CW_ParseFile(fp: string);
var
  s, fp2: string;
  f: textfile;
begin
  AssignFile(f, fp);
  Reset(f);
  CW_ParsedFiles.Add(fp);
  while not EOF(f) do
  begin
    ReadLn(f, s);
    s := TrimCodeStr(s);
    if s <> '' then
    begin
      if Tk(s, 1) = 'uses' then
      begin
        Delete(s, 1, length('uses'));
        s := Trim(s);
        if s[1] = '<' then
          fp2 := ExtractFilePath(ParamStr(0)) + 'inc\'
        else
        if FileExists(fp) then
          fp2 := ExtractFilePath(fp);
        Delete(s, 1, 1);
        Delete(s, Length(s), 1);
        fp2 := fp2 + s;

        if not FileExists(fp2) then
        begin
          if FileExists(fp2 + '.mash') then
            fp2 := fp2 + '.mash';
          if FileExists(fp2 + '.h') then
            fp2 := fp2 + '.h';
          if FileExists(fp2 + '.inc') then
            fp2 := fp2 + '.inc';
        end;

        if FileExists(fp2) and (CW_ParsedFiles.IndexOf(fp2) = -1) then
          CW_ParseFile(fp2);
      end;
      if Tk(s, 1) = 'import' then
      begin
        CW_Add(CW_MakeDescr(Tk(s, 2), '[@] "' + Tk(s, 3) + '":"' +
          Tk(s, 4) + '"', '"' + ExtractFileName(fp) + '"'));
      end;
      if Tk(s, 1) = 'proc' then
      begin
        Delete(s, 1, length('proc'));
        s := Trim(s);
        if Length(s) > 0 then
        begin
          if s[length(s)] = ':' then
            Delete(s, length(s), 1);
          s := Trim(s);
          if (pos('::', s) = 0) and (pos('(', s) <> 0) then
            CW_Add(CW_MakeDescr(copy(s, 1, pos('(', s) - 1), 'proc ' +
              s, '"' + ExtractFileName(fp) + '"'));

        end;
      end;
      if Tk(s, 1) = 'func' then
      begin
        Delete(s, 1, length('func'));
        s := Trim(s);
        if length(s) > 0 then
        begin
          if s[length(s)] = ':' then
            Delete(s, length(s), 1);
          s := Trim(s);
          if (pos('::', s) = 0) and (pos('(', s) <> 0) then
            CW_Add(CW_MakeDescr(copy(s, 1, pos('(', s) - 1), 'func ' +
              s, '"' + ExtractFileName(fp) + '"'));

        end;
      end;
      if Tk(s, 1) = 'word' then
      begin
        CW_Add(CW_MakeDescr(Tk(s, 2), '[word] ' + Tk(s, 3), '"' +
          ExtractFileName(fp) + '"'));
      end;
      if Tk(s, 1) = 'int' then
      begin
        CW_Add(CW_MakeDescr(Tk(s, 2), '[int] ' + Tk(s, 3), '"' +
          ExtractFileName(fp) + '"'));
      end;
      if Tk(s, 1) = 'real' then
      begin
        CW_Add(CW_MakeDescr(Tk(s, 2), '[real] ' + Tk(s, 3), '"' +
          ExtractFileName(fp) + '"'));
      end;
      if Tk(s, 1) = 'str' then
      begin
        CW_Add(CW_MakeDescr(Tk(s, 2), '[str] "' + Tk(s, 3) + '"',
          '"' + ExtractFileName(fp) + '"'));
      end;
      if Tk(s, 1) = 'stream' then
      begin
        CW_Add(CW_MakeDescr(Tk(s, 2), '[stream] "' + Tk(s, 3) + '"',
          '"' + ExtractFileName(fp) + '"'));
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

procedure TEditorFrame.CodeSchemeTimerTimer(Sender: TObject);
var
  c, x: cardinal;
  s, bf: string;
  classopned: boolean;
  Nodes, Vars, Extends, Procs: TTreeNode;
  ExtendsLst: TStringList;
begin
  if KeyUpCnt <> LastKeyUp then
  begin
    SchemeTreeView.BeginUpdate;
    c := 0;
    while c < SchemeTreeView.Items.Count do
    begin
      SchemeTreeView.Items.Item[c].Free;
      Inc(c);
    end;
    SchemeTreeView.Items.Clear;

    c := 0;
    while c < SynEdit.Lines.Count do
    begin
      s := TrimCodeStr(SynEdit.Lines[c]);
      if length(s) > 0 then
        if tk(s, 1) = 'class' then
        begin
          Delete(s, 1, 5);
          s := Trim(s);
          if s[Length(s)] = ':' then
          begin
            Delete(s, length(s), 1);
            s := Trim(s);
          end;

          ExtendsLst := TStringList.Create;
          if pos('(', s) > 0 then
          begin
            bf := s;
            Delete(s, pos('(', s), length(s));
            Delete(bf, 1, pos('(', bf));
            Delete(bf, length(bf), 1);
            bf := Trim(bf);
            while pos(',', bf) > 0 do
            begin
              ExtendsLst.Add(Trim(Copy(bf, 1, pos(',', bf) - 1)));
              Delete(bf, 1, pos(',', bf));
              bf := Trim(bf);
            end;
            bf := Trim(bf);
            if Length(bf) > 0 then
              ExtendsLst.Add(bf);
          end;

          Nodes := SchemeTreeView.Items.AddFirst(SchemeTreeView.Items.GetFirstNode, s);
          Nodes.ImageIndex := 0;

          Extends := SchemeTreeView.Items.AddChild(Nodes, 'extends');
          Extends.ImageIndex := 4;
          while ExtendsLst.Count > 0 do
          begin
            SchemeTreeView.Items.AddChild(Extends, ExtendsLst[0]).ImageIndex := 0;
            ExtendsLst.Delete(0);
          end;
          FreeAndNil(ExtendsLst);

          Vars := SchemeTreeView.Items.AddChild(Nodes, 'variables');
          Vars.ImageIndex := 4;
          Procs := SchemeTreeView.Items.AddChild(Nodes, 'methods');
          Procs.ImageIndex := 4;

          while c < SynEdit.Lines.Count do
          begin
            Inc(c);
            s := TrimCodeStr(SynEdit.Lines[c]);
            if s = 'end' then
              break;

            if tk(s, 1) = 'var' then
            begin
              Delete(s, 1, 3);
              s := Trim(s);
              while pos(',', s) > 0 do
              begin
                SchemeTreeView.Items.AddChild(Vars,
                  Trim(Copy(s, 1, pos(',', s) - 1))).ImageIndex := 3;
                Delete(s, 1, pos(',', s));
                s := Trim(s);
              end;
              s := Trim(s);
              if Length(s) > 0 then
              begin
                SchemeTreeView.Items.AddChild(Vars, s).ImageIndex := 3;
              end;
            end;

            if (tk(s, 1) = 'proc') or (tk(s, 1) = 'func') then
            begin
              bf := tk(s, 1);
              if bf = 'func' then
                x := 1
              else
                x := 2;
              Delete(s, 1, 4);
              s := Trim(s);
              if Length(s) > 0 then
              begin
                while pos(',', s) > 0 do
                begin
                  SchemeTreeView.Items.AddChild(Procs,
                    Trim(Copy(s, 1, pos(',', s) - 1))).ImageIndex := x;
                  Delete(s, 1, pos(',', s));
                  s := Trim(s);
                end;
                s := Trim(s);
                if Length(s) > 0 then
                  SchemeTreeView.Items.AddChild(Procs, s).ImageIndex := x;
              end;
            end;
          end;
        end;
      Inc(c);
    end;

    Nodes := SchemeTreeView.Items.Add(SchemeTreeView.Items.GetFirstNode, 'methods');
    Nodes.ImageIndex := 4;

    c := 0;
    while c < SynEdit.Lines.Count do
    begin
      s := TrimCodeStr(SynEdit.Lines[c]);
      if (tk(s, 1) = 'proc') or (tk(s, 1) = 'func') then
      begin
        bf := tk(s, 1);
        if bf = 'func' then
          x := 1
        else
          x := 2;
        Delete(s, 1, 4);
        s := Trim(s);
        if Length(s) > 0 then
        begin
          if s[length(s)] = ':' then
            Delete(s, length(s), 1);
          s := Trim(s);
          if pos('(', s) > 0 then
            SchemeTreeView.Items.AddChild(Nodes, s).ImageIndex := x;

        end;
      end;
      Inc(c);
    end;

    Nodes := SchemeTreeView.Items.Add(Nodes, 'imports');
    Nodes.ImageIndex := 4;

    c := 0;
    while c < SynEdit.Lines.Count do
    begin
      s := TrimCodeStr(SynEdit.Lines[c]);
      if tk(s, 1) = 'import' then
      begin
        Delete(s, 1, 6);
        s := Trim(s);
        Delete(s, pos('"', s), length(s));
        s := Trim(s);
        SchemeTreeView.Items.AddChild(Nodes, s).ImageIndex := 5;
      end;
      Inc(c);
    end;

    SchemeTreeView.EndUpdate;
    SchemeTreeView.Update;
    LastKeyUp := KeyUpCnt;
  end;
end;

end.
