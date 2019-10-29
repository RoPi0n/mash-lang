library mcl;

uses
  SysUtils, Forms, Interfaces, mclform, classes, graphics;

{$I '..\svm.inc'}

// Application

procedure _mcl_Application_Initialize(pctx: pointer); stdcall;
begin
  Application.Initialize;
  Application.ShowMainForm := True;
end;

procedure _mcl_Application_Run(pctx: pointer); stdcall;
begin
  Application.Run;
end;

procedure _mcl_Application_Terminate(pctx: pointer); stdcall;
begin
  Application.Terminate;
end;

// Forms

procedure _mcl_Form_Destructor(p: pointer); stdcall;
begin
  TMCLFormClass(p).Free;
end;

procedure _mcl_Form_Create(pctx: pointer); stdcall;
var
  Frm: TForm;
begin
  Application.CreateForm(TMCLFormClass, Frm);
  __Return_Ref(pctx, Frm, @_mcl_Form_Destructor);
end;

{** Getters **}

procedure _mcl_Form_Get_Width(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TMCLFormClass(__Next_Ref(pctx)).Width);
end;

procedure _mcl_Form_Get_Height(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TMCLFormClass(__Next_Ref(pctx)).Height);
end;

procedure _mcl_Form_Get_Left(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TMCLFormClass(__Next_Ref(pctx)).Left);
end;

procedure _mcl_Form_Get_Top(pctx: pointer); stdcall;
begin
  __Return_Word(pctx, TMCLFormClass(__Next_Ref(pctx)).Top);
end;

procedure _mcl_Form_Get_Caption(pctx: pointer); stdcall;
begin
  __Return_String(pctx, TMCLFormClass(__Next_Ref(pctx)).Caption);
end;

{** Setters **}

procedure _mcl_Form_Set_Width(pctx: pointer); stdcall;
begin
  TMCLFormClass(__Next_Ref(pctx)).Width := __Next_Word(pctx);
end;

procedure _mcl_Form_Set_Height(pctx: pointer); stdcall;
begin
  TMCLFormClass(__Next_Ref(pctx)).Height := __Next_Word(pctx);
end;

procedure _mcl_Form_Set_Left(pctx: pointer); stdcall;
begin
  TMCLFormClass(__Next_Ref(pctx)).Left := __Next_Word(pctx);
end;

procedure _mcl_Form_Set_Top(pctx: pointer); stdcall;
begin
  TMCLFormClass(__Next_Ref(pctx)).Top := __Next_Word(pctx);
end;

procedure _mcl_Form_Set_Caption(pctx: pointer); stdcall;
begin
  TMCLFormClass(__Next_Ref(pctx)).Caption := __Next_String(pctx);
end;

{** Actions **}

procedure _mcl_Form_Focus(pctx: pointer); stdcall;
begin
  TMCLFormClass(__Next_Ref(pctx)).SetFocus;
end;

procedure _mcl_Form_GetCanvas(pctx: pointer); stdcall;
begin
  __Return_Ref(pctx, TMCLFormClass(__Next_Ref(pctx)).Canvas, nil);
end;

{** Events **}

procedure _mcl_Form_Reg_Handler(pctx: pointer); stdcall;
var
  Frm: TMCLFormClass;
  HT : byte;
begin
  Frm := TMCLFormClass(__Next_Ref(pctx));
  HT := __Next_Word(pctx);
  Frm.RegHandler(__Next_Word(pctx),
                 __Next_Object(pctx),
                 TMCLFormHandlerType(HT));
end;

procedure _mcl_Form_Handle(pctx: pointer); stdcall;
var
  Frm : TMCLFormClass;
  Ev  : TMCLFormEvent;
  Args: TList;
  i   : Integer;
begin
  Frm := TMCLFormClass(__Next_Ref(pctx));

  Ev := Frm.PopEvent;
  if Ev <> nil then
   begin
     Args := Ev.Args;

     i := Args.Count - 1;
     while i >= 0 do
      begin
        __Return_Word(pctx, LongWord(Args[i]));

        Dec(i);
      end;

     __Return_Object(pctx, Frm.EventHandlers[Ev.HandlerType].Arg);
     __Return_Word(pctx, Frm.EventHandlers[Ev.HandlerType].Addr);

     FreeAndNil(Ev);
   end
  else
   begin
     __Return_Word(pctx, 0)
   end;
end;

{** Canvas **}

procedure _mcl_Canvas_MoveTo(pctx: pointer); stdcall;
var
  cnv: TCanvas;
  x, y: LongWord;
begin
  Cnv := TCanvas(__Next_Ref(pctx));
  x := __Next_Word(pctx);
  y := __Next_Word(pctx);
  Cnv.MoveTo(x, y);
end;

procedure _mcl_Canvas_LineTo(pctx: pointer); stdcall;
var
  cnv: TCanvas;
  x, y: LongWord;
begin
  Cnv := TCanvas(__Next_Ref(pctx));
  x := __Next_Word(pctx);
  y := __Next_Word(pctx);
  Cnv.LineTo(x, y);
end;

{** EXPORTS **}
exports _mcl_Application_Initialize      name '_MCL_APP_INIT',
        _mcl_Application_Run             name '_MCL_APP_RUN',
        _mcl_Application_Terminate       name '_MCL_APP_TERM',

        _mcl_Form_Create                 name '_MCL_FRM_CREATE',

        _mcl_Form_Get_Width              name '_MCL_FRM_GET_WIDTH',
        _mcl_Form_Get_Height             name '_MCL_FRM_GET_HEIGHT',
        _mcl_Form_Get_Left               name '_MCL_FRM_GET_LEFT',
        _mcl_Form_Get_Top                name '_MCL_FRM_GET_TOP',
        _mcl_Form_Get_Caption            name '_MCL_FRM_GET_CAPTION',

        _mcl_Form_Set_Width              name '_MCL_FRM_SET_WIDTH',
        _mcl_Form_Set_Height             name '_MCL_FRM_SET_HEIGHT',
        _mcl_Form_Set_Left               name '_MCL_FRM_SET_LEFT',
        _mcl_Form_Set_Top                name '_MCL_FRM_SET_TOP',
        _mcl_Form_Set_Caption            name '_MCL_FRM_SET_CAPTION',

        _mcl_Form_Focus                  name '_MCL_FRM_FOCUS',
        _mcl_Form_GetCanvas              name '_MCL_FRM_GET_CANVAS',

        _mcl_Form_Reg_Handler            name '_MCL_FRM_REG_HANDLER',
        _mcl_Form_Handle                 name '_MCL_FRM_HANDLE',

        _mcl_Canvas_MoveTo               name '_MCL_CNV_MOVETO',
        _mcl_Canvas_LineTo               name '_MCL_CNV_LINETO';

begin
  Application.Scaled:=True;
end.
