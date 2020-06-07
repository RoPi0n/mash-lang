unit MainForm;

{$mode objfpc}{$H+}

interface

uses
   Classes, SysUtils, FileUtil, SynCompletion, Forms, Controls, Graphics,
   Dialogs, Menus, ComCtrls, ExtCtrls, StdCtrls, Buttons, Editor, Global,
   AboutForm, dbgframe, Process, LazUTF8, debugger, Windows;

type

   { TMainFrm }

   TMainFrm = class(TForm)
      Button1: TButton;
      Button2: TButton;
      Button3: TButton;
      DbgMakeDumpButton: TButton;
      DbgStartStopButton: TButton;
      Button4: TButton;
      DebuggerFrame1: TDebuggerFrame;
      Image1: TImage;
      Image2: TImage;
      ImageList1: TImageList;
      Label2: TLabel;
      Label3: TLabel;
      LogsPanel: TPanel;
      MainMenu1: TMainMenu;
      LogMemo: TMemo;
      MenuItem1: TMenuItem;
      MenuItem10: TMenuItem;
      MenuItem11: TMenuItem;
      MenuItem12: TMenuItem;
      MenuItem13: TMenuItem;
      MenuItem14: TMenuItem;
      MenuItem15: TMenuItem;
      MenuItem16: TMenuItem;
      MenuItem17: TMenuItem;
      MenuItem18: TMenuItem;
      MenuItem19: TMenuItem;
      MenuItem2: TMenuItem;
      MenuItem20: TMenuItem;
      MenuItem21: TMenuItem;
      MenuItem22: TMenuItem;
      MenuItem23: TMenuItem;
      MenuItem24: TMenuItem;
      MenuItem25: TMenuItem;
      MenuItem26: TMenuItem;
      MenuItem27: TMenuItem;
      MenuItem28: TMenuItem;
      MenuItem29: TMenuItem;
      MenuItem3: TMenuItem;
      MenuItem30: TMenuItem;
      MenuItem31: TMenuItem;
      MenuItem32: TMenuItem;
      MenuItem33: TMenuItem;
      MenuItem34: TMenuItem;
      MenuItem4: TMenuItem;
      MenuItem5: TMenuItem;
      MenuItem6: TMenuItem;
      MenuItem7: TMenuItem;
      MenuItem8: TMenuItem;
      MenuItem9: TMenuItem;
      OpenDialog: TOpenDialog;
      PageControl: TPageControl;
      DebuggerPanel: TPanel;
      Panel4: TPanel;
      PreviewControlsPanel: TPanel;
      PreviewPanel: TPanel;
      Panel2: TPanel;
      Panel3: TPanel;
      SaveDialog: TSaveDialog;
      Splitter1: TSplitter;
      Splitter2: TSplitter;
      StatusBar: TStatusBar;
      PreviewPanelTimer: TTimer;
      procedure Button1Click(Sender: TObject);
      procedure Button2Click(Sender: TObject);
      procedure Button3Click(Sender: TObject);
      procedure Button4Click(Sender: TObject);
      procedure FormCreate(Sender: TObject);
      procedure FormResize(Sender: TObject);
      procedure MenuItem10Click(Sender: TObject);
      procedure MenuItem12Click(Sender: TObject);
      procedure MenuItem13Click(Sender: TObject);
      procedure MenuItem14Click(Sender: TObject);
      procedure MenuItem17Click(Sender: TObject);
      procedure MenuItem18Click(Sender: TObject);
      procedure MenuItem19Click(Sender: TObject);
      procedure MenuItem22Click(Sender: TObject);
      procedure MenuItem23Click(Sender: TObject);
      procedure MenuItem25Click(Sender: TObject);
      procedure MenuItem26Click(Sender: TObject);
      procedure MenuItem28Click(Sender: TObject);
      procedure MenuItem29Click(Sender: TObject);
      procedure MenuItem2Click(Sender: TObject);
      procedure MenuItem30Click(Sender: TObject);
      procedure MenuItem31Click(Sender: TObject);
      procedure MenuItem32Click(Sender: TObject);
      procedure MenuItem33Click(Sender: TObject);
      procedure MenuItem34Click(Sender: TObject);
      procedure MenuItem3Click(Sender: TObject);
      procedure MenuItem5Click(Sender: TObject);
      procedure MenuItem6Click(Sender: TObject);
      procedure MenuItem7Click(Sender: TObject);
      procedure MenuItem9Click(Sender: TObject);
      procedure OpenTab(FilePath, TabName: string; Operation: TOpenOp);
      procedure PageControlChange(Sender: TObject);
      procedure PageControlMouseDown(Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: integer);
      procedure BuildFile(fp, flags: string);
      procedure BuildFileAndRun(fp, flags, svm: string);
      procedure PreviewPanelClick(Sender: TObject);
      procedure PreviewPanelTimerTimer(Sender: TObject);
      procedure ShowPreviewPanel;
   private
      { private declarations }
   public
      { public declarations }
   end;

var
   MainFrm: TMainFrm;
   NewTabsCnt: cardinal = 0;
   ActivePageIndex: cardinal;

implementation

{$R *.lfm}

procedure TMainFrm.ShowPreviewPanel;
begin
   PreviewPanel.Left := PageControl.Left;
   PreviewPanel.Top := PageControl.Top;
   PreviewPanel.Width := PageControl.Width;
   PreviewPanel.Height := PageControl.Height;
   PreviewControlsPanel.Left := (PreviewPanel.Width - PreviewControlsPanel.Width) div 2;
   PreviewControlsPanel.Top := (PreviewPanel.Height - PreviewControlsPanel.Height) div 2;
   PreviewPanel.Visible := True;
end;

function GetEditor(Tab: TTabSheet): TEditorFrame;
var
   j: cardinal;
begin
   j := 0;
   Result := nil;
   while j < Tab.ControlCount do
    begin
      if (Tab.Controls[j] is TEditorFrame) then
       begin
         Result := TEditorFrame(Tab.Controls[j]);
         break;
       end;
      Inc(j);
    end;
end;

procedure TMainFrm.OpenTab(FilePath, TabName: string; Operation: TOpenOp);
var
   Editor: TEditorFrame;
   Tab: TTabSheet;
begin
   Tab := TTabSheet.Create(PageControl);
   Tab.Caption := TabName + '  [X]';
   if LowerCase(Trim(ExtractFileExt(TabName))) = '.mash' then
      Tab.ImageIndex := 0
   else
      Tab.ImageIndex := 2;
   Tab.PageControl := PageControl;
   Editor := TEditorFrame.CreateEditor(Tab, StatusBar, Operation, FilePath);
   Editor.Visible := True;
   Editor.Parent := Tab;
   ActivePageIndex := PageControl.PageCount - 1;
   PageControl.ActivePageIndex := ActivePageIndex;
end;

procedure TMainFrm.PageControlChange(Sender: TObject);
begin
   PageControl.ActivePageIndex := ActivePageIndex;
end;

function InRect(R: TRect; P: TPoint): boolean;
begin
   Result := (R.Left <= P.X) and (R.Right >= P.X) and (R.Top <= P.Y) and
      (R.Bottom >= P.Y);
end;

procedure TMainFrm.PageControlMouseDown(Sender: TObject; Button: TMouseButton;
   Shift: TShiftState; X, Y: integer);
var
   TabIndex: integer;
   TabRect: TRect;
begin
   if Button = mbLeft then
    begin
      TabIndex := PageControl.IndexOfTabAt(X, Y);
      ActivePageIndex := TabIndex;
      TabRect := PageControl.TabRect(TabIndex);
      if InRect(Classes.Rect(TabRect.Right - 16 - 2, TabRect.Top + 2,
         TabRect.Right - 6, TabRect.Bottom - 4), Classes.Point(X, Y))
      then
       begin
         ActivePageIndex := PageControl.ActivePageIndex;
         PageControl.Pages[TabIndex].Free;
         if PageControl.PageCount > 0 then
          begin
            if ActivePageIndex > TabIndex then
               Dec(ActivePageIndex);
            if ActivePageIndex >= 0 then
               PageControl.ActivePageIndex := ActivePageIndex;
          end;
       end;
      PageControl.ActivePageIndex := ActivePageIndex;
    end;
end;

procedure TMainFrm.MenuItem2Click(Sender: TObject);
begin
   Inc(NewTabsCnt);
   OpenTab('', 'New ' + IntToStr(NewTabsCnt), opopNew);
end;

procedure TMainFrm.MenuItem30Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).SynEdit.PasteFromClipboard;
end;

procedure TMainFrm.MenuItem31Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).SynEdit.SelectAll;
end;

procedure TMainFrm.MenuItem32Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if LogsPanel.Height = 0 then
      LogsPanel.Height := 196;
   Self.Repaint;
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
         BuildFileAndRun(EdtFrm.DefFile, 'console', 'svmc.exe');
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption := ExtractFilePath(SaveDialog.FileName);
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
            BuildFileAndRun(EdtFrm.DefFile, 'console', 'svmc.exe');
          end;
       end;
    end;
end;

procedure TMainFrm.MenuItem33Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if LogsPanel.Height = 0 then
      LogsPanel.Height := 196;
   Self.Repaint;
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
         BuildFile(EdtFrm.DefFile, '/bin /mdbg+ /o+ /olvl 3');
         DebugFile(MainFrm, ChangeFileExt(EdtFrm.DefFile, '.vmc'),
            ChangeFileExt(EdtFrm.DefFile, '.mdbg'));
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption := ExtractFilePath(SaveDialog.FileName);
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
            BuildFile(EdtFrm.DefFile, '/bin /mdbg+ /o+ /olvl 3');
            DebugFile(MainFrm, ChangeFileExt(EdtFrm.DefFile, '.vmc'),
               ChangeFileExt(EdtFrm.DefFile, '.mdbg'));
          end;
       end;
    end;
end;

procedure TMainFrm.MenuItem34Click(Sender: TObject);
begin
   DebuggerPanel.Width := 385;
end;

procedure TMainFrm.MenuItem3Click(Sender: TObject);
begin
   if OpenDialog.Execute then
    begin
      OpenTab(OpenDialog.FileName, ExtractFileName(OpenDialog.FileName), opopOpen);
    end;
end;

procedure TMainFrm.MenuItem5Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption :=
               ExtractFileName(SaveDialog.FileName) + '  [X]';
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
          end;
       end;
    end;
end;

procedure TMainFrm.MenuItem6Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if SaveDialog.Execute then
       begin
         EdtFrm.DefFile := SaveDialog.FileName;
         PageControl.ActivePage.Caption := ExtractFileName(SaveDialog.FileName) + '  [X]';
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
       end;
    end;
end;

procedure TMainFrm.MenuItem7Click(Sender: TObject);
var
   j: cardinal;
begin
   j := 0;
   while j < PageControl.PageCount do
    begin
      PageControl.ActivePageIndex := j;
      MenuItem5Click(Sender);
      Inc(j);
    end;
   PageControl.ActivePageIndex := ActivePageIndex;
end;

procedure TMainFrm.MenuItem9Click(Sender: TObject);
begin
   Close;
end;

procedure TMainFrm.FormCreate(Sender: TObject);
begin
   DebuggerPanel.Width := 0;
   LogsPanel.Height := 0;
   ShowPreviewPanel;
end;

procedure TMainFrm.FormResize(Sender: TObject);
begin
   if PageControl.PageCount = 0 then
      ShowPreviewPanel;
end;

function BuildThread(p: pointer): Int64;
begin
   Result := 0;
   TProcess(p).Execute;
end;

procedure TMainFrm.BuildFile(fp, flags: string);
var
   AProcess: TProcess;
   sl: TStringList;
   thr: QWord;
   s: string;
begin
   LogMemo.Lines.Clear;
   LogMemo.Repaint;
   sl := TStringList.Create;
   s := fp;
   if Pos(ExtractFilePath(ParamStr(0)), s) > 0 then
    Delete(s, 1, length(ExtractFilePath(ParamStr(0))));

   LogMemo.Lines.Add('Start building file: "' + s + '"');
    try
      AProcess := TProcess.Create(Self);

      AProcess.Executable := 'mashc.exe';
      AProcess.Parameters.Add(UTF8ToWinCP(s));
      AProcess.Parameters.Add(UTF8ToWinCP(ChangeFileExt(s, '.asm')));

      {while pos(' ', flags) > 0 do
       begin
         AProcess.Parameters.Add(copy(flags, 1, pos(' ', flags) - 1));
         Delete(flags, 1, pos(' ', flags));
       end;

      if Length(flags) > 0 then
         AProcess.Parameters.Add(flags);}

      AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes, poNoConsole, poStderrToOutPut];
      AProcess.PipeBufferSize := 1024 * 1024;
      BeginThread(nil, 0, @BuildThread, Pointer(AProcess), 0, thr);
      Sleep(10);
      while AProcess.Running do
       begin
         Application.ProcessMessages;
         Sleep(10);
       end;
      sl.LoadFromStream(AProcess.Output);
      LogMemo.Lines.AddStrings(sl);
      FreeAndNil(AProcess);

      AProcess := TProcess.Create(Self);

      AProcess.Executable := 'asm.exe';
      AProcess.Parameters.Add(UTF8ToWinCP(flags));
      AProcess.Parameters.Add(UTF8ToWinCP(ChangeFileExt(s, '.asm')));
      AProcess.Parameters.Add(UTF8ToWinCP(ChangeFileExt(s, '.vmc')));

      AProcess.Options := AProcess.Options + [poWaitOnExit, poUsePipes, poNoConsole, poStderrToOutPut];
      AProcess.PipeBufferSize := 1024 * 1024;
      BeginThread(nil, 0, @BuildThread, Pointer(AProcess), 0, thr);
      Sleep(10);
      while AProcess.Running do
       begin
         Application.ProcessMessages;
         Sleep(10);
       end;
      sl.LoadFromStream(AProcess.Output);
      LogMemo.Lines.AddStrings(sl);
      FreeAndNil(AProcess);
    except
      on E: Exception do
       begin
         LogMemo.Lines.Add('Building failed, exception: "' + E.Message + '".');
       end;
    end;
   FreeAndNil(AProcess);
   FreeAndNil(sl);
end;

procedure TMainFrm.BuildFileAndRun(fp, flags, svm: string);
var
   fp_vmc: string;
   AProcess: TProcess;
begin
   fp_vmc := ExtractFilePath(fp) + ChangeFileExt(ExtractFileName(fp), '.vmc');

   if FileExists(fp_vmc) then
      SysUtils.DeleteFile(fp_vmc);

   BuildFile(fp, flags);

   Sleep(300);
   if FileExists(fp_vmc) then
    begin
       try
         AProcess := TProcess.Create(Self);
         AProcess.Executable := svm;
         AProcess.Parameters.Add(UTF8ToWinCP(fp_vmc));
         AProcess.Execute;
       except
         on E: Exception do
          begin
            LogMemo.Lines.Add('Failed to launch, exception: "' + E.Message + '".');
          end;
       end;
      FreeAndNil(AProcess);
    end
   else
      LogMemo.Lines.Add('Failed to launch .vmc file.');
end;

procedure TMainFrm.PreviewPanelClick(Sender: TObject);
begin

end;

procedure TMainFrm.PreviewPanelTimerTimer(Sender: TObject);
begin
   //show it
   if (PageControl.PageCount = 0) and (not PreviewPanel.Visible) then
      ShowPreviewPanel;

   //hide it
   if PreviewPanel.Visible and (PageControl.PageCount > 0) then
      PreviewPanel.Visible := False;
end;

procedure TMainFrm.MenuItem10Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if LogsPanel.Height = 0 then
      LogsPanel.Height := 196;
   Self.Repaint;
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
         BuildFile(EdtFrm.DefFile, 'console');
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption := ExtractFilePath(SaveDialog.FileName);
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
            BuildFile(EdtFrm.DefFile, 'console');
          end;
       end;
    end;
end;

procedure TMainFrm.Button1Click(Sender: TObject);
begin
   LogsPanel.Height := 0;
end;

procedure TMainFrm.Button2Click(Sender: TObject);
begin
   MenuItem2Click(Sender);
end;

procedure TMainFrm.Button3Click(Sender: TObject);
begin
   MenuItem3Click(Sender);
end;

procedure TMainFrm.Button4Click(Sender: TObject);
begin
   DebuggerPanel.Width := 0;
end;

procedure TMainFrm.MenuItem12Click(Sender: TObject);
begin
   LogsPanel.Height := 196;
end;

procedure TMainFrm.MenuItem13Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if LogsPanel.Height = 0 then
      LogsPanel.Height := 196;
   Self.Repaint;
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
         BuildFileAndRun(EdtFrm.DefFile, 'gui', 'svmg.exe');
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption := ExtractFilePath(SaveDialog.FileName);
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
            BuildFileAndRun(EdtFrm.DefFile, 'gui', 'svmg.exe');
          end;
       end;
    end;
end;

procedure TMainFrm.MenuItem14Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if LogsPanel.Height = 0 then
      LogsPanel.Height := 196;
   Self.Repaint;
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
         BuildFile(EdtFrm.DefFile, 'gui');
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption := ExtractFilePath(SaveDialog.FileName);
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
            BuildFile(EdtFrm.DefFile, 'gui');
          end;
       end;
    end;
end;

procedure TMainFrm.MenuItem17Click(Sender: TObject);
var
   EdtFrm: TEditorFrame;
begin
   if LogsPanel.Height = 0 then
      LogsPanel.Height := 196;
   Self.Repaint;
   if PageControl.ActivePageIndex >= 0 then
    begin
      EdtFrm := GetEditor(PageControl.ActivePage);
      if FileExists(EdtFrm.DefFile) then
       begin
         EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
         EdtFrm.Saved := True;
         EdtFrm.UpdateState;
         BuildFile(EdtFrm.DefFile, '/bin /o-');
         DebugFile(MainFrm, ChangeFileExt(EdtFrm.DefFile, '.vmc'),
            ChangeFileExt(EdtFrm.DefFile, '.mdbg'));
       end
      else
       begin
         if SaveDialog.Execute then
          begin
            EdtFrm.DefFile := SaveDialog.FileName;
            PageControl.ActivePage.Caption := ExtractFilePath(SaveDialog.FileName);
            EdtFrm.SynEdit.Lines.SaveToFile(EdtFrm.DefFile);
            EdtFrm.Saved := True;
            EdtFrm.UpdateState;
            BuildFile(EdtFrm.DefFile, '/bin /mdbg+ /o-');
            DebugFile(MainFrm, ChangeFileExt(EdtFrm.DefFile, '.vmc'),
               ChangeFileExt(EdtFrm.DefFile, '.mdbg'));
          end;
       end;
    end;
end;

procedure TMainFrm.MenuItem18Click(Sender: TObject);
var
   dest, inf: string;
begin
   if OpenDialog.Execute then
    begin
      dest := OpenDialog.FileName;
      inf := '';
      case MessageBox(0, 'Is have debug information file?',
            'Prepare debugger...', MB_YESNO) of
         idYes: if OpenDialog.Execute then
               inf := OpenDialog.FileName;
         idNo: ;
       end;
      DebugFile(MainFrm, dest, inf);
    end;
end;

procedure TMainFrm.MenuItem19Click(Sender: TObject);
begin
   AboutFrm.ShowModal;
end;

procedure TMainFrm.MenuItem22Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).SynEdit.Undo;
end;

procedure TMainFrm.MenuItem23Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).SynEdit.Redo;
end;

procedure TMainFrm.MenuItem25Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).FindDlg;
end;

procedure TMainFrm.MenuItem26Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).ReplaceDlg;
end;

procedure TMainFrm.MenuItem28Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).SynEdit.CutToClipboard;
end;

procedure TMainFrm.MenuItem29Click(Sender: TObject);
begin
   if PageControl.ActivePageIndex >= 0 then
      GetEditor(PageControl.ActivePage).SynEdit.CopyToClipboard;
end;

end.
