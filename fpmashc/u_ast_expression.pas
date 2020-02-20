unit u_ast_expression;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_tokens,
  u_ast,
  u_ast_blocks,
  u_ast_expression_blocks;

type
  TMashASTExpression = class(TMashBaseAST)
    public
      stk: TList;
      TreeNode: TMashASTBlock;

      constructor Create(_tokens: TList);
      destructor Destroy;

      procedure Process;

    private
      function NextPrimitive(var token_id: cardinal): TMashASTBlock;
      procedure NextBraces(var token_id: cardinal; list: TList);
      procedure NextRectBraces(var token_id: cardinal; list: TList);
      function MakeEnum(list: TList): TMashASTP_Enum;

      procedure PrepareNodes;
      function MakeTree(Left, Right: cardinal): TMashASTBlock;
  end;

implementation

constructor TMashASTExpression.Create(_tokens: TList);
begin
  inherited Create(_tokens);
  self.stk := TList.Create;
  self.TreeNode := nil;
end;

destructor TMashASTExpression.Destroy;
begin
  FreeAndNil(stk);
  inherited;
end;

procedure TMashASTExpression.Process;
var
  token_id: cardinal;
  prim: TMashASTBlock;
begin
  token_id := 0;

  while token_id < self.tokens.count do
   begin
     prim := self.NextPrimitive(token_id);
     if prim <> nil then
      self.Nodes.add(prim);

     Inc(token_id);
   end;

  self.PrepareNodes;
  self.TreeNode := self.MakeTree(0, self.nodes.count - 1);
end;

// Making tree

function TMashASTExpression.MakeTree(Left, Right: cardinal): TMashASTBlock;
var
  op, t: TMashASTBlock;
  op_index: cardinal;
  lvl: byte;
begin
  Result := nil;
  op := nil;

  if Right - Left = 0 then
   Result := TMashASTBlock(self.nodes[Left])
  else
   if Right > Left then
    begin
      lvl := 0;
      while (op = nil) and (lvl < 7) do
       begin
         op_index := Right - 1;
         while op_index > Left do
          begin
            t := TMashASTBlock(self.nodes[op_index]);
            if t.GetType = btPOperator then
             if TMashASTP_Operator(t).Op.short in MashOperationsPriority[lvl] then
              begin
                op := t;
                break;
              end;

            Dec(op_index);
          end;

         Inc(lvl);
       end;
    end;

  if op <> nil then
   Result := TMashASTE_OperationLR.Create(
     TMashASTP_Operator(op),
     self.MakeTree(Left, op_index - 1),
     self.MakeTree(op_index + 1, Right)
   );

  if Result = nil then
   raise Exception.Create(
     'Invalid expression at line ' + IntToStr(self.lastTk.line + 1) +
     ' at file ''' + self.lastTk.filep^ + '''.'
   );
end;

procedure TMashASTExpression.PrepareNodes;
var
  i: integer;
  n: TMashASTBlock;
  founded: boolean;
begin
  // Checking for <op> R
  i := self.nodes.count - 1;
  while (self.nodes.count > 1) and (i >= 0) do
   begin
     n := TMashASTBlock(self.nodes[i]);

     if n.GetType = btPOperator then
      if TMashASTP_Operator(n).Op.short in MashOperationLeft then
       begin
         founded := i = 0;
         if not founded then
          founded := TMashASTBlock(self.nodes[i - 1]).GetType = btPOperator;

         if founded then
          begin
            nodes.items[i] := TMashASTE_Operation.Create(
                                TMashASTP_Operator(n),
                                TMashASTBlock(TMashASTBlock(nodes[i + 1]))
                              );
            self.nodes.delete(i + 1);
            Inc(i);
          end
       end;

     Dec(i);
   end;

  // Checking for L <op>
  i := 1;
  while (self.nodes.count > 1) and (i < self.nodes.count) do
   begin
     n := TMashASTBlock(self.nodes[i]);

     if n.GetType = btPOperator then
      if TMashASTP_Operator(n).Op.short in MashOperationRight then
       begin
         founded := i + 1 = self.nodes.count;
         if not founded then
          founded := TMashASTBlock(self.nodes[i + 1]).GetType = btPOperator;

         if founded then
          begin
            nodes.items[i] := TMashASTE_Operation.Create(
                                TMashASTP_Operator(n),
                                TMashASTBlock(TMashASTBlock(nodes[i - 1]))
                              );
            self.nodes.delete(i - 1);
            Dec(i);
          end
       end;

     Inc(i);
   end;
end;

// Breaking nodes for primitives

function TMashASTExpression.NextPrimitive(var token_id: cardinal): TMashASTBlock;
var
  tk: TMashToken;
  lst: TList;
  Obj: TMashASTBlock;
begin
  tk := self.NextToken(token_id);
  self.lastTk := tk;

  if (tk.info in [ttDigit, ttString, ttWord]) or
     (tk.short = tkNew) then
   begin
     Result := nil;

     while true do
      begin
        if (self.TkCheckID(self.Token(token_id + 1)) = tkByPtr) and
           (tk.info = ttWord) then
         begin
           if Result = nil then
            begin
              Result := TMashASTP_Reference.Create;
              TMashASTP_Reference(Result).ObjPath.add(
                TMashASTP_SimpleObject.Create(tk)
              );
            end
           else
            begin
              Obj := TMashASTP_Reference.Create;
              TMashASTP_Reference(Obj).ObjPath.add(Result);
              Result := Obj;
            end;


           while (self.TkCheckID(self.Token(token_id + 1)) = tkByPtr) and
                 (self.TkCheckType(self.Token(token_id + 2)) = ttWord) do
            begin
              token_id := token_id + 2;
              self.lastTk := tk;
              tk := self.NextToken(token_id);
              tk.value := 'vtable__' + tk.value;
              TMashASTP_Reference(Result).ObjPath.add(
                TMashASTP_SimpleObject.Create(tk)
              );
            end;

           self.lastTk := tk;
           if self.TkCheckID(self.Token(token_id + 1)) = tkByPtr then
             raise Exception.Create(
               'Invalid token after -> at line ' + IntToStr(tk.line + 1) +
               ' at file ''' + tk.filep^ + '''.'
             );
         end;

        if Result = nil then
         begin
           if tk.short = tkNew then
            begin
              if self.TkCheckID(self.Token(token_id + 1)) = tkORBr then
               Result := TMashASTP_SimpleObject.Create(tk)
              else
               Result := TMashASTP_Operator.Create(tk);
            end
           else
             Result := TMashASTP_SimpleObject.Create(tk);
         end;


        if self.TkCheckID(self.Token(token_id + 1)) = tkOBr then
         begin
           Inc(token_id);

           lst := TList.Create;
           self.NextBraces(token_id, lst);
           Obj := TMashASTP_Call.Create(Result, self.MakeEnum(lst));
           Result := Obj;
           FreeAndNil(lst);
         end;

        if self.TkCheckID(self.Token(token_id + 1)) = tkORBr then
         begin
           Inc(token_id);

           Obj := TMashASTP_IndexedObject.Create(Result);
           Result := Obj;

           while true do
            begin
              Obj := TMashASTB_Expression.Create;
              self.NextRectBraces(token_id, TMashASTB_Expression(Obj).tokens);
              TMashASTExpression(TMashASTB_Expression(Obj).ast).Process;

              TMashASTP_IndexedObject(Result).Indexes.add(Obj);

              if self.TkCheckID(self.Token(token_id + 1)) = tkORBr then
               Inc(token_id)
              else
               break;
            end;
         end;

        if not (self.TkCheckID(self.Token(token_id + 1)) in [tkByPtr, tkOBr, tkORBr]) then
         break;
      end;
   end
  else
   if tk.info = ttToken then
    case tk.short of
     tkOBr:
       begin
         Result := TMashASTB_Expression.Create;
         self.NextBraces(token_id, TMashASTB_Expression(Result).tokens);
         TMashASTExpression(TMashASTB_Expression(Result).ast).Process;
       end;

     tkORBr:
       begin
         lst := TList.Create;
         self.NextRectBraces(token_id, lst);
         Result := self.MakeEnum(lst);
         FreeAndNil(lst);
       end;

     else
      Result := TMashASTP_Operator.Create(tk);
    end;
end;

procedure TMashASTExpression.NextBraces(var token_id: cardinal; list: TList);
var
  brace_cnt: integer;
  tk: TMashToken;
begin
  brace_cnt := 1;

  while brace_cnt > 0 do
   begin
     Inc(token_id);
     tk := self.NextToken(token_id);

     if tk = nil then
      raise Exception.Create('Unexpected end of code.');

     case tk.short of
      tkOBr: Inc(brace_cnt);
      tkCBr: Dec(brace_cnt);
     end;

     if brace_cnt > 0 then
      list.add(tk);
   end;
end;

procedure TMashASTExpression.NextRectBraces(var token_id: cardinal; list: TList);
var
  brace_cnt: integer;
  tk: TMashToken;
begin
  brace_cnt := 1;

  while brace_cnt > 0 do
   begin
     Inc(token_id);
     tk := self.NextToken(token_id);

     if tk = nil then
      raise Exception.Create('Unexpected end of code.');

     case tk.short of
      tkORBr: Inc(brace_cnt);
      tkCRBr: Dec(brace_cnt);
     end;

     if brace_cnt > 0 then
      list.add(tk);
   end;
end;

function TMashASTExpression.MakeEnum(list: TList): TMashASTP_Enum;
var
  br_cnt, rbr_cnt: integer;
  c: cardinal;
  tk: TMashToken;
  Expr: TMashASTB_Expression;
begin
  br_cnt := 0;
  rbr_cnt := 0;

  Result := TMashASTP_Enum.Create;
  Expr := TMashASTB_Expression.Create;

  c := 0;
  while c < list.count do
   begin
     tk := TMashToken(list[c]);

     case tk.short of
      tkOBr:
        begin
          Inc(br_cnt);
          Expr.tokens.add(tk);
        end;

      tkCBr:
        begin
          Dec(br_cnt);
          Expr.tokens.add(tk);
        end;

      tkORBr:
        begin
          Inc(rbr_cnt);
          Expr.tokens.add(tk);
        end;

      tkCRBr:
        begin
          Dec(rbr_cnt);
          Expr.tokens.add(tk);
        end;

      tkComma:
        if (br_cnt = 0) and (rbr_cnt = 0) then
         begin
           Result.objects.add(Expr);
           TMashASTExpression(Expr.ast).Process;
           Expr := TMashASTB_Expression.Create;
         end
        else
         Expr.tokens.add(tk);

      else
       Expr.tokens.add(tk);
     end;

     Inc(c);
   end;

  if Expr.tokens.count > 0 then
   begin
     Result.objects.add(Expr);
     TMashASTExpression(Expr.ast).Process;
   end;
end;

end.

