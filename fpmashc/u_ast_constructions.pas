unit u_ast_constructions;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_tokens,
  u_ast,
  u_ast_blocks,
  u_ast_expression,
  u_ast_expression_blocks,
  u_ast_constructions_blocks;

type
  TMashAST = class(TMashBaseAST)
    public
      CornerNodes: TList;
      BlockVect: TList;
      BlockObjectVect: TList;

      imports_lst, regapi_lst, uses_lst, const_lst: TList;

      constructor Create(_tokens, _imports_lst,
                         _regapi_lst, _uses_lst,
                         _const_lst: TList);

      destructor Destroy; override;

      procedure Process;

    private
      function CurrBlock: TList;
      function NextNode(var token_id: cardinal): TMashASTBlock;

      function NextExpr(var token_id: cardinal): TMashASTB_Expression;
      procedure NextExprTokens(var token_id: cardinal; list: TList);
      function NextParam(var token_id: cardinal): TMashASTB_Param;

      function ExtractMethod(var token_id: cardinal;
                             is_function: boolean;
                             tk: TMashToken): TMashASTB_Method;

      function ExtractFor(var token_id: cardinal; tk: TMashToken): TMashASTBlock;

      function ExtractWhile(var token_id: cardinal;
                            is_whilst: boolean;
                            tk: TMashToken): TMashASTBlock;

      function ExtractClass(var token_id: cardinal;
                            tk: TMashToken): TMashASTB_Class;

      function ExtractClassField(var token_id: cardinal): TMashASTB_ClassField;

      function ExtractEnum(var token_id: cardinal; tk:TMashToken): TMashASTB_Enum;
  end;

implementation

constructor TMashAST.Create(_tokens, _imports_lst,
                            _regapi_lst, _uses_lst,
                            _const_lst: TList);
begin
  inherited Create(_tokens);

  imports_lst := _imports_lst;
  regapi_lst  := _regapi_lst;
  uses_lst    := _uses_lst;
  const_lst   := _const_lst;

  self.CornerNodes := self.nodes;
  self.BlockObjectVect := TList.Create;
  self.BlockVect := TList.Create;
  self.BlockVect.add(self.nodes);
end;

destructor TMashAST.Destroy;
begin
  FreeAndNil(self.BlockVect);
  FreeAndNil(self.BlockObjectVect);
  inherited;
end;

function TMashAST.CurrBlock: TList;
begin
  if self.BlockVect.count > 0 then
   Result := TList(self.BlockVect[self.BlockVect.count - 1])
  else
   Result := self.CornerNodes;
end;

procedure TMashAST.Process;
const
  BlocksWithNodes: set of TMashASTBlockType = [
    btMethod, btIf, btForEach, btWhile, btWhilst,
    btSwitch, btCase, btLaunch, btAsync, btTry,

    btClass, btClassField,
    btPublic, btProtected, btPrivate,
    btEnum
  ];

var
  token_id: cardinal;
  node, parent_block: TMashASTBlock;
  ok: boolean;

begin
  token_id := 0;

  while token_id < self.tokens.count do
   begin
     node := self.NextNode(token_id);

     if node <> nil then
      begin
        if node.GetType in BlocksWithNodes then
         begin
           parent_block := nil;

           if self.BlockObjectVect.count > 0 then
            parent_block := TMashASTBlock(self.BlockObjectVect[self.BlockObjectVect.count - 1]);

           ok := false;

           if parent_block <> nil then
            begin
              case parent_block.GetType of
                btSwitch:
                  begin
                    if node.GetType <> btCase then
                     raise Exception.Create(
                       'Switch block can contain only case statements. ' +
                       'Invalid switch-case construction at line ' +
                       IntToStr(self.lastTk.line + 1) + ' at file ''' +
                       self.lastTk.filep^ + '''.'
                     );

                    ok := true;

                    if TMashASTB_Case(node).isElse then
                     begin
                       self.BlockObjectVect.Add(node);
                       self.BlockVect.Add(TMashASTB_Case(node).Nodes);

                       TMashASTB_Switch(parent_block).hasElse := true;
                       TMashASTB_Switch(parent_block).ElseCase := node;
                     end
                    else
                     begin
                       self.CurrBlock.Add(node);
                       self.BlockObjectVect.Add(node);
                       self.BlockVect.Add(TMashASTB_Case(node).Nodes);
                     end;
                  end;

                btClass:
                  case node.GetType of
                    btClassField:
                      begin
                        ok := true;

                        TMashASTB_Class(parent_block).class_vars.AddStrings(
                          TMashASTB_ClassField(node).names
                        );
                      end;

                    btMethod:
                      begin
                        ok := true;

                        if not TMashASTB_Method(node).is_class_method then
                         begin
                           TMashASTB_Method(node).is_class_method := true;
                           TMashASTB_Method(node).class_name := TMashASTB_Class(parent_block).class_name;

                           self.CornerNodes.Add(node);

                           self.BlockObjectVect.Add(node);
                           self.BlockVect.Add(TMashASTB_Method(node).nodes);
                         end
                        else
                         raise Exception.Create(
                           'Invalid class method (' +
                           TMashASTB_Method(node).class_name + '::' +
                           TMashASTB_Method(node).method_name + ') declaration at line ' +
                           IntToStr(TMashASTB_Method(node).line + 1) + ' at file ''' +
                           TMashASTB_Method(node).fp^ + '''.'
                         );
                      end;

                    btPublic, btProtected, btPrivate: ok := true;

                    else
                      raise Exception.Create(
                        'Invalid class field statement at line ' +
                        IntToStr(self.lastTk.line + 1) + ' at file ''' +
                        self.lastTk.filep^ + '''.'
                      );
                  end;
              end;
            end;

           if not ok then
            case node.GetType of
              btCase: raise Exception.Create(
                        'Case statement without switch at line ' +
                        IntToStr(self.lastTk.line + 1) + ' at file ''' +
                        self.lastTk.filep^ + '''.'
                      );

              btClass:
                if parent_block = nil then
                 begin
                   self.CurrBlock.Add(node);
                   self.BlockObjectVect.Add(node);
                   self.BlockVect.Add(nil);
                 end
                else
                 raise Exception.Create(
                   'Class declaration can''t be contained. Invalid class declaration at line ' +
                   IntToStr(self.lastTk.line + 1) + ' at file ''' + self.lastTk.filep^ + '''.'
                 );

              btEnum:
                if parent_block = nil then
                 self.CurrBlock.add(node)
                else
                 raise Exception.Create(
                   'Enum declaration can''t be contained. Invalid enum declaration at line ' +
                   IntToStr(self.lastTk.line + 1) + ' at file ''' + self.lastTk.filep^ + '''.'
                 );

              btClassField, btPublic, btProtected, btPrivate:
                if parent_block.GetType <> btClass then
                 raise Exception.Create(
                   'Class field declaration contained not in a class. Invalid class field declaration at line ' +
                   IntToStr(self.lastTk.line + 1) + ' at file ''' + self.lastTk.filep^ + '''.'
                 );

              else
               begin
                 self.CurrBlock.add(node);

                 self.BlockObjectVect.add(node);
                 self.BlockVect.add(TMashASTBlockWithNodes(node).GetNodes);
               end;
            end;
         end
        else
         self.CurrBlock.add(node);
      end;
   end;
end;

function TMashAST.NextNode(var token_id: cardinal): TMashASTBlock;
var
  tk, t: TMashToken;
  p: Pointer;
begin
  Result := nil;

  tk := self.Token(token_id);
  self.lastTk := tk;

  case tk.info of
    ttToken:
      if tk.short in MashExprTokens then
       Result := self.NextExpr(token_id)
      else
       case tk.short of
         tkImport:
           begin
             self.imports_lst.add(
               TMashASTB_Import.Create(
                 self.TkWordValue(self.Token(token_id + 1)),
                 self.TkStrValue(self.Token(token_id + 2)),
                 self.TkStrValue(self.Token(token_id + 3))
               )
             );

             Inc(token_id, 4);
           end;

         tkAPI:
           begin
             self.regapi_lst.add(
               TMashASTB_RegAPI.Create(
                 self.TkStrValue(self.Token(token_id + 1)),
                 self.TkDigitValue(self.Token(token_id + 2))
               )
             );

             Inc(token_id, 3);
           end;

         tkUses:
           begin
             Inc(token_id);
             p := TMashASTB_Uses.Create;
             self.NextExprTokens(token_id, TMashASTB_Uses(p).Expr);
             self.uses_lst.add(p);
           end;

         tkInline:
           begin
             Result := TMashASTB_Inline.Create(
               self.TkStrValue(self.Token(token_id + 1))
             );
             Inc(token_id, 2);
           end;

         tkConst:
           if self.TkCheckID(self.Token(token_id + 2)) = tkResource then
            begin
              self.const_lst.add(
                TMashASTB_Const.Create(
                  self.TkWordValue(self.Token(token_id + 1)),
                  self.TkNotNull(self.Token(token_id + 3)),
                  true
                )
              );

              Inc(token_id, 4);
            end
           else
            if self.TkCheckID(self.Token(token_id + 2)) = tkSubSym then
             begin
               p := self.TkNotNull(self.Token(token_id + 3));

               TMashToken(p).value := '-' + self.TkDigitValue(TMashToken(p));

               self.const_lst.add(
                 TMashASTB_Const.Create(
                   self.TkWordValue(self.Token(token_id + 1)),
                   TMashToken(p),
                   false
                 )
               );

               Inc(token_id, 4);
             end
            else
             begin
               self.const_lst.add(
                 TMashASTB_Const.Create(
                   self.TkWordValue(self.Token(token_id + 1)),
                   self.TkNotNull(self.Token(token_id + 2)),
                   false
                 )
               );

               Inc(token_id, 3);
             end;

         tkProc:
          Result := self.ExtractMethod(token_id, false, tk);

         tkFunc:
          Result := self.ExtractMethod(token_id, true, tk);

         tkEnd:
          begin
            if self.BlockObjectVect.count > 0 then
             self.BlockObjectVect.delete(self.BlockObjectVect.count - 1);

            self.BlockVect.delete(self.BlockVect.count - 1);

            if self.BlockVect.count = 0 then
             raise Exception.Create(
               'Unexpected ''end'' at line ' + IntToStr(tk.line + 1) +
               ' at file ''' + tk.filep^ + '''.'
             );

            Inc(token_id);
          end;

          tkIf:
           begin
             Inc(token_id);
             Result := TMashASTB_If.Create(
               self.NextExpr(token_id)
             );

             if self.TkTokenID(self.Token(token_id)) = tkBegin then
              Inc(token_id)
             else
              raise Exception.Create(
                'Missed '':'' in ''if'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;


          tkElse:
           begin
             t := self.TkNotNull(self.Token(token_id + 1));
             if self.TkTokenID(t) <> tkBegin then
              raise Exception.Create(
                'Unexpected token ''' + t.value + ''' at line ' +
                IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
              );
             Inc(token_id, 2);

             if self.BlockObjectVect.count > 0 then
              begin
                p := self.BlockObjectVect[self.BlockObjectVect.count - 1];
                if TMashASTBlock(p).GetType = btIf then
                 begin
                   if TMashASTB_If(p).hasElse then
                    raise Exception.Create(
                      'Second ''else'' for one ''if'' statement declaration at line ' +
                      IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
                    );

                   with TMashASTB_If(p) do
                    begin
                      hasElse := true;
                      self.BlockVect.delete(self.BlockVect.count - 1);
                      self.BlockVect.add(ElseNodes);
                    end;
                 end
                else
                 raise Exception.Create(
                   'Unexpected ''else'' at line ' +
                   IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
                 );
              end
             else
              raise Exception.Create(
                'Unexpected ''else'' at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;

          tkFor:
           Result := self.ExtractFor(token_id, tk);

          tkWhile:
           Result := self.ExtractWhile(token_id, false, tk);

          tkWhilst:
           Result := self.ExtractWhile(token_id, true, tk);

          tkReturn:
           begin
             Inc(token_id);
             Result := TMashASTB_Return.Create(self.NextExpr(token_id));
           end;

          tkBreak:
           begin
             Inc(token_id);
             Result := TMashASTB_Break.Create;
           end;

          tkContinue:
           begin
             Inc(token_id);
             Result := TMashASTB_Continue.Create;
           end;

          tkSwitch:
           begin
             Inc(token_id);
             Result := TMashASTB_Switch.Create(self.NextExpr(token_id));

             if self.TkTokenID(self.NextToken(token_id)) = tkBegin then
              Inc(token_id)
             else
              raise Exception.Create(
                'Missed '':'' in ''switch'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;

          tkCase:
           begin
             Inc(token_id);
             Result := TMashASTB_Case.Create(self.NextExpr(token_id), false);

             if self.TkTokenID(self.NextToken(token_id)) = tkBegin then
              Inc(token_id)
             else
              raise Exception.Create(
                'Missed '':'' in ''case'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;

          tkDefault:
           begin
             Inc(token_id);
             Result := TMashASTB_Case.Create(nil, true);

             if self.TkTokenID(self.NextToken(token_id)) = tkBegin then
              Inc(token_id)
             else
              raise Exception.Create(
                'Missed '':'' in ''default'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;

          tkLaunch:
           begin
             Inc(token_id);
             Result := TMashASTB_Launch.Create;

             if self.TkTokenID(self.NextToken(token_id)) = tkBegin then
              Inc(token_id)
             else
              raise Exception.Create(
                'Missed '':'' in ''launch'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;

          tkAsync:
           begin
             Inc(token_id);
             Result := TMashASTB_Async.Create(
               self.TkWordValue(self.NextToken(token_id))
             );
             Inc(token_id);

             if self.TkTokenID(self.NextToken(token_id)) = tkBegin then
              Inc(token_id)
             else
              raise Exception.Create(
                'Missed '':'' in ''async'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );
           end;

          tkWait:
           begin
             Inc(token_id);
             Result := TMashASTB_Wait.Create(self.NextExpr(token_id));
           end;

          tkClass:
           Result := self.ExtractClass(token_id, tk);

          tkVar:
           Result := self.ExtractClassField(token_id);

          tkPublic, tkProtected, tkPrivate:
           begin
             Inc(token_id);
             if self.TkCheckID(self.Token(token_id)) <> tkBegin then
              raise Exception.Create(
                'Missed '':'' in ''' + tk.value + ''' statement at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );

             case tk.short of
               tkPublic:    Result := TMashASTB_Public.Create;
               tkProtected: Result := TMashASTB_Protected.Create;
               tkPrivate:   Result := TMashASTB_Private.Create;
             end;

             Inc(token_id);
           end;

          tkTry:
           begin
             Inc(token_id);
             if self.TkCheckID(self.NextToken(token_id)) <> tkBegin then
              raise Exception.Create(
                'Missed '':'' in ''try'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );

             Result := TMashASTB_Try.Create;
             Inc(token_id);
           end;

          tkCatch:
           begin
             Inc(token_id);
             p := self.BlockObjectVect[self.BlockObjectVect.count - 1];

             if TMashASTBlock(p).GetType <> btTry then
              raise Exception.Create(
                'Unexpected ''catch'' statement at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );

             if TMashASTB_Try(p).hasCatch then
              raise Exception.Create(
                'Second ''catch'' declaration for one ''try'' statement at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );

             with TMashASTB_Try(p) do
              begin
                hasCatch := true;
                forVar := self.TkWordValue(self.NextToken(token_id));

                self.BlockVect.Delete(self.BlockVect.count - 1);
                self.BlockVect.Add(NodesCatch);
              end;

             Inc(token_id);

             if self.TkCheckID(self.NextToken(token_id)) <> tkBegin then
              raise Exception.Create(
                'Missed '':'' in ''try'' statement declaration at line ' +
                IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
              );

             Inc(token_id);
           end;

          tkRaise:
           begin
             Inc(token_id);
             Result := TMashASTB_Raise.Create(self.NextExpr(token_id));
           end;

          {tkSafe:
           begin
             Inc(token_id);
             Result := TMashASTB_Safe.Create(self.NextExpr(token_id));
           end; }

          tkEnum:
           Result := self.ExtractEnum(token_id, tk);

         else
          raise Exception.Create(
            'Invalid construction at line ' + IntToStr(tk.line + 1) +
            ' at file ''' + tk.filep^ + '''.'
          );
       end;

    ttDigit, ttString, ttWord:
      Result := self.NextExpr(token_id);

    ttEndOfLine:
      Inc(token_id);
  end;
end;

function TMashAST.NextExpr(var token_id: cardinal): TMashASTB_Expression;
begin
  Result := TMashASTB_Expression.Create;
  self.NextExprTokens(token_id, Result.tokens);
  TMashASTExpression(Result.ast).Process;
end;

procedure TMashAST.NextExprTokens(var token_id: cardinal; list: TList);
var
  tk: TMashToken;
  br_cnt: integer;
begin
  br_cnt := 0;
  tk := nil;

  repeat
    tk := self.Token(token_id);

    if tk <> nil then
     if ((tk.short in MashExprTokens) and (tk.info = ttToken)) or
        (tk.info in [ttWord, ttDigit, ttString]) then
      begin
        case tk.short of
          tkOBr: Inc(br_cnt);
          tkCBr: Dec(br_cnt);
        end;

        if br_cnt < 0 then
         break;

        list.add(tk);
        Inc(token_id);
      end
     else
      break;
  until tk = nil;
end;

function TMashAST.NextParam(var token_id: cardinal): TMashASTB_Param;
var
  tk: TMashToken;
  isEnumerable: boolean;
begin
  isEnumerable := false;

  tk := self.NextToken(token_id);
  Inc(token_id);

  if tk.short = tkORBr then
   begin
     tk := self.NextToken(token_id);
     Inc(token_id);

     isEnumerable := true;
   end;

  if tk.info = ttWord then
   Result := TMashASTB_Param.Create(tk, isEnumerable)
  else
   raise Exception.Create(
     'Unexpected token ''' + tk.value + ''' at line ' +
     IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
   );

  if isEnumerable then
   begin
     tk := self.NextToken(token_id);

     if tk <> nil then
      begin
        if tk.short = tkCRBr then
         Inc(token_id)
        else
         raise Exception.Create(
           'Unexpected token ''' + tk.value + ''' at line ' +
           IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
         );
      end
     else
      raise Exception.Create(
        'Unexpected end of code at file ''' + self.lastTk.filep^ + '''.'
      );
   end;
end;

// Constructions extraction

function TMashAST.ExtractMethod(var token_id: cardinal;
                                is_function: boolean;
                                tk: TMashToken): TMashASTB_Method;
var
  method_name: string;
  is_class_method: boolean;
  class_name: string;
  t: TMashToken;
begin
  if self.TkCheckID(self.Token(token_id + 2)) = tkCMSep then
   begin
     is_class_method := true;
     class_name := self.TkWordValue(self.Token(token_id + 1));
     method_name := self.TkWordValue(self.Token(token_id + 3));
     Inc(token_id, 4);
   end
  else
   begin
     is_class_method := false;
     class_name := '';
     method_name := self.TkWordValue(self.Token(token_id + 1));
     Inc(token_id, 2);
   end;

  Result := TMashASTB_Method.Create(is_function, method_name,
                                    is_class_method, class_name,
                                    tk.line, tk.filep^);

  if self.TkTokenID(self.NextToken(token_id)) = tkOBr then
   begin
     Inc(token_id);

     while self.TkCheckID(self.NextToken(token_id)) <> tkCBr do
      begin
        Result.params.add(
          self.NextParam(token_id)
        );

        t := self.NextToken(token_id);
        case self.TkCheckID(t) of
          tkComma: Inc(token_id);
          tkCBr:;
          else
           raise Exception.Create(
             'Unexpected token ''' + t.value + ''' at line ' +
             IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
           );
        end;
      end;

     Inc(token_id);
   end;

  if self.TkTokenID(self.Token(token_id)) = tkBegin then
   Inc(token_id)
  else
   raise Exception.Create(
     'Missed '':'' at method declaration at line ' +
     IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
   );
end;


function TMashAST.ExtractFor(var token_id: cardinal; tk: TMashToken): TMashASTBlock;
var
  forVar: string;
  isBack: boolean;
  t: TMashToken;
begin
  Inc(token_id);
  forVar := self.TkWordValue(self.NextToken(token_id));
  Inc(token_id);

  t := self.TkNotNull(self.NextToken(token_id));
  case self.TkTokenID(t) of
    tkIn:   isBack := false;
    tkBack: isBack := true;
    else
     raise Exception.Create(
       'Unexpected token ''' + t.value + ''' at line ' + IntToStr(t.line + 1) +
       ' at file ''' + t.filep^ + '''.'
     );
  end;

  Inc(token_id);

  Result := TMashASTB_ForEach.Create(
    forVar, isBack, self.NextExpr(token_id)
  );

  if self.TkCheckID(self.NextToken(token_id)) = tkBegin then
   Inc(token_id)
  else
   raise Exception.Create(
     'Missed '':'' in ''for'' statement declaration at line ' +
     IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
   );
end;

function TMashAST.ExtractWhile(var token_id: cardinal;
                              is_whilst: boolean;
                              tk: TMashToken): TMashASTBlock;
var
  t: TMashToken;
begin
  Inc(token_id);
  if is_whilst then
   Result := TMashASTB_Whilst.Create(self.NextExpr(token_id))
  else
   Result := TMashASTB_While.Create(self.NextExpr(token_id));

  t := self.TkNotNull(self.NextToken(token_id));
  if t.short = tkBegin then
   Inc(token_id)
  else
   raise Exception.Create(
     'Missed '':'' in while/whilst statement declaration at line ' +
     IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
   );
end;

function TMashAST.ExtractClass(var token_id: cardinal;
                               tk: TMashToken): TMashASTB_Class;
var
  t: TMashToken;
  p: TMashASTB_Param;
begin
  Inc(token_id);

  Result := TMashASTB_Class.Create(self.TkWordValue(self.NextToken(token_id)));
  Inc(token_id);

  if self.TkTokenID(self.NextToken(token_id)) = tkOBr then
   begin
     Inc(token_id);

     while self.TkCheckID(self.NextToken(token_id)) <> tkCBr do
      begin
        p := self.NextParam(token_id);
        Result.class_parents.add(p.param.value);

        if p.is_enumerable then
         raise Exception.Create(
           'Unexpected token in class declaration at line ' +
           IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
         );

        t := self.NextToken(token_id);
        case self.TkCheckID(t) of
          tkComma: Inc(token_id);
          tkCBr:;
          else
           raise Exception.Create(
             'Unexpected token ''' + t.value + ''' at line ' +
             IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
           );
        end;
      end;

     Inc(token_id);
   end;

  t := self.TkNotNull(self.NextToken(token_id));
  if self.TkTokenID(t) = tkBegin then
   Inc(token_id)
  else
   raise Exception.Create(
     'Missed '':'' at class declaration at line ' +
     IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
   );
end;

function TMashAST.ExtractClassField(var token_id: cardinal): TMashASTB_ClassField;
var
  t: TMashToken;
begin
  Inc(token_id);
  Result := TMashASTB_ClassField.Create;

  t := self.NextToken(token_id);
  while self.TkCheckType(t) = ttWord do
   begin
     Result.names.add(t.value);
     Inc(token_id);

     t := self.NextToken(token_id);
     if self.TkCheckID(t) = tkComma then
      begin
        Inc(token_id);
        t := self.TkNotNull(self.NextToken(token_id));

        if self.TkCheckType(t) <> ttWord then
         raise Exception.Create(
           'Unexpected token ''' + t.value + ''' at line ' +
           IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
         );
      end
     else
      begin
        t := self.TkNotNull(self.NextToken(token_id));
        if self.TkCheckType(t) = ttWord then
         raise Exception.Create(
           'Unexpected token ''' + t.value + ''' at line ' +
           IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
         );
      end;
   end;

  if Result.names.count = 0 then
   raise Exception.Create(
     'Invalid class field declaration at line ' +
     IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
   );
end;

function TMashAST.ExtractEnum(var token_id: cardinal; tk:TMashToken): TMashASTB_Enum;
var
  EI: TMashASTB_EnumItem;
  t: TMashToken;
begin
  Inc(token_id);
  Result := TMashASTB_Enum.Create(self.TkWordValue(self.NextToken(token_id)));
  Inc(token_id);

  if self.TkCheckID(self.NextToken(token_id)) = tkORBr then
   begin
     Inc(token_id);

     while self.TkCheckID(self.NextToken(token_id)) <> tkCRBr do
      begin
        EI := TMashASTB_EnumItem.Create(self.TkWordValue(self.NextToken(token_id)));
        Inc(token_id);

        if self.TkCheckID(self.NextToken(token_id)) = tkMov then
         begin
           Inc(token_id);
           EI.hasDefValue := true;

           if self.TkCheckID(self.NextToken(token_id)) = tkSubSym then
            begin
              Inc(token_id);
              t := self.TkNotNull(self.NextToken(token_id));
              Inc(token_id);

              t.value := '-' + self.TkDigitValue(t);
              EI.DefValue := t;
            end
           else
            begin
              t := self.TkNotNull(self.NextToken(token_id));
              Inc(token_id);

              if not (t.info in [ttDigit, ttString]) then
               raise Exception.Create(
                 'Unexpected token ''' + t.value + ''' at line ' +
                 IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
               );
              EI.DefValue := t;
            end;
         end;

        Result.Nodes.Add(EI);

        t := self.TkNotNull(self.NextToken(token_id));
        case self.TkCheckID(t) of
          tkCRBr:;
          tkComma: Inc(token_id);

          else
           raise Exception.Create(
             'Unexpected token ''' + t.value + ''' at line ' +
             IntToStr(t.line + 1) + ' at file ''' + t.filep^ + '''.'
           );
        end;
      end;

     Inc(token_id);
   end
  else
   raise Exception.Create(
     'Invalid ''enum'' declaration at line ' +
     IntToStr(tk.line + 1) + ' at file ''' + tk.filep^ + '''.'
   );
end;

end.
