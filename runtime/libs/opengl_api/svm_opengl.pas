library svm_opengl;

uses sysutils, gl, glut;

{$I ..\adp.inc}

procedure svmopengl_glutInit(Stack:PStack); cdecl;
var
  CmdCount: cardinal;
  CmdList: array of PChar;
  c: cardinal;
begin
  CmdCount := ParamCount+1;
  SetLength(CmdList, CmdCount);
  for c := 0 to CmdCount-1 do
   CmdList[c] := PChar(ParamStr(c));
  glutInit(@CmdCount, @CmdList);
end;

procedure svmopengl_glutInitDisplayMode(Stack:PStack); cdecl;
begin
  glutInitDisplayMode(Cardinal(PMem(Stack^.popv)^));
end;

procedure svmopengl_glutInitWindowSize(Stack:PStack); cdecl;
begin
  glutInitWindowSize(PMem(Stack^.popv)^, PMem(Stack^.popv)^);
end;

procedure svmopengl_glutInitWindowPosition(Stack:PStack); cdecl;
begin
  glutInitWindowPosition(PMem(Stack^.popv)^, PMem(Stack^.popv)^);
end;

procedure svmopengl_glutCreateWindow(Stack:PStack); cdecl;
begin
  glutCreateWindow(PChar(string(PMem(Stack^.popv)^)));
end;

procedure svmopengl_glMatrixMode(Stack:PStack); cdecl;
begin
  glMatrixMode(PMem(Stack^.popv)^);
end;

procedure svmopengl_glFrustum(Stack:PStack); cdecl;
begin
  glFrustum(PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^,
            PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^);
end;

procedure svmopengl_glTranslate(Stack:PStack); cdecl;
begin
  glTranslatef(PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^);
end;

procedure svmopengl_glRotate(Stack:PStack); cdecl;
begin
  glRotatef(PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^,
            PMem(Stack^.popv)^);
end;

procedure svmopengl_glEnable(Stack:PStack); cdecl;
begin
  glEnable(PMem(Stack^.popv)^);
end;

procedure svmopengl_glClear(Stack:PStack); cdecl;
begin
  glClear(PMem(Stack^.popv)^);
end;

procedure svmopengl_glBegin(Stack:PStack); cdecl;
begin
  glBegin(PMem(Stack^.popv)^);
end;

procedure svmopengl_glEnd(Stack:PStack); cdecl;
begin
  glEnd();
end;

procedure svmopengl_glutSwapBuffers(Stack:PStack); cdecl;
begin
  glutSwapBuffers();
end;

procedure svmopengl_glVertex3(Stack:PStack); cdecl;
begin
  glVertex3f(PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^);
end;

procedure svmopengl_glNormal3(Stack:PStack); cdecl;
begin
  glNormal3f(PMem(Stack^.popv)^, PMem(Stack^.popv)^, PMem(Stack^.popv)^);
end;

{EXPORTS DB}
exports svmopengl_glutInit                name 'SVM_OPENGL_GLUTINIT';
exports svmopengl_glutInitDisplayMode     name 'SVM_OPENGL_GLUTINITDISPLAYMODE';
exports svmopengl_glutInitWindowSize      name 'SVM_OPENGL_GLUTINITWINDOWSIZE';
exports svmopengl_glutInitWindowPosition  name 'SVM_OPENGL_GLUTINITWINDOWPOSITION';

exports svmopengl_glutCreateWindow        name 'SVM_OPENGL_GLUTCREATEWINDOW';
exports svmopengl_glMatrixMode            name 'SVM_OPENGL_GLMATRIXMODE';
exports svmopengl_glFrustum               name 'SVM_OPENGL_GLFRUSTUM';
exports svmopengl_glTranslate             name 'SVM_OPENGL_GLTRANSLATE';
exports svmopengl_glRotate                name 'SVM_OPENGL_GLROTATE';
exports svmopengl_glEnable                name 'SVM_OPENGL_GLENABLE';
exports svmopengl_glClear                 name 'SVM_OPENGL_GLCLEAR';
exports svmopengl_glBegin                 name 'SVM_OPENGL_GLBEGIN';
exports svmopengl_glEnd                   name 'SVM_OPENGL_GLEND';
exports svmopengl_glutSwapBuffers         name 'SVM_OPENGL_GLUTSWAPBUFFERS';
exports svmopengl_glVertex3               name 'SVM_OPENGL_GLVERTEX3';
exports svmopengl_glNormal3               name 'SVM_OPENGL_GLNORMAL3';

begin
end.
