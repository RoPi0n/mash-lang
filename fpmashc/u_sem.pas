unit u_sem;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_tokens,
  u_ast_constructions,
  u_ast_blocks,
  u_ast_constructions_blocks,
  u_ast_expression,
  u_ast_expression_blocks;

type
  TMashSEM = class
    public
      imp_lst:       TList;
      regapi_lst:    TList;
      ast_lst:       TList;
      const_lst:     TList;

      imports:       TStringList;
      consts:        TStringList;
      global_vars:   TStringList;

      classes_lst:   TList;
      classes_names: TStringList;
      virtual_table: TStringList;

      max_class_parents: word;

      enums:         TList;
      enums_names:   TStringList;

      global_nodes:  TList;
      methods:       TList;
      class_methods: TList;

      methods_names: TStringList;
      class_methods_names: TStringList;

      constructor Create(_imp_lst, _regapi_lst, _ast_lst, _const_lst: TList);
      destructor Destroy; override;

      procedure FillLists;
      procedure Process;

      procedure CheckNode(node: TMashASTBlock; isMethodNodes: boolean; Method: TMashASTB_Method);
      function ItCanBeANewVar(v: string): boolean; inline;
  end;

implementation

constructor TMashSEM.Create(_imp_lst, _regapi_lst, _ast_lst, _const_lst: TList);
begin
  inherited Create;

  self.imp_lst := _imp_lst;
  self.regapi_lst := _regapi_lst;
  self.ast_lst := _ast_lst;
  self.const_lst := _const_lst;

  self.imports := TStringList.Create;
  self.consts := TStringList.Create;
  self.global_vars := TStringList.Create;

  self.classes_lst := TList.Create;
  self.classes_names := TStringList.Create;
  self.virtual_table := TStringList.Create;

  self.max_class_parents := 0;

  self.enums := TList.Create;
  self.enums_names := TStringList.Create;

  self.global_nodes := TList.Create;
  self.methods := TList.Create;
  self.class_methods := TList.Create;

  self.methods_names := TStringList.Create;
  self.class_methods_names := TStringList.Create;
end;

destructor TMashSEM.Destroy;
begin
  FreeAndNil(self.imports);
  FreeAndNil(self.consts);
  FreeAndNil(self.global_vars);

  FreeAndNil(self.classes_lst);
  FreeAndNil(self.classes_names);
  FreeAndNil(self.virtual_table);

  FreeAndNil(self.enums);
  FreeAndNil(self.enums_names);

  FreeAndNil(self.global_nodes);
  FreeAndNil(self.methods);
  FreeAndNil(self.class_methods);

  FreeAndNil(self.methods_names);
  FreeAndNil(self.class_methods_names);

  inherited;
end;

procedure TMashSEM.FillLists;
var
  c, j, d, g, f: cardinal;
  k: integer;
  s: string;
  p, p2: pointer;
  ok, parent_exist: boolean;
  b: boolean;
begin
  c := 0;
  while c < self.imp_lst.count do
   begin
     s := TMashASTB_Import(self.imp_lst[c]).method_name;
     if self.imports.IndexOf(s) = -1 then
      self.imports.add(s)
     else
      raise Exception.Create(
        'Duplicate import ''' + s + ''' declaration.'
      );
     Inc(c);
   end;

  c := 0;
  while c < self.regapi_lst.count do
   begin
     s := TMashASTB_RegAPI(self.regapi_lst[c]).method_name;
     if self.imports.IndexOf(s) = -1 then
      self.imports.add(s)
     else
      raise Exception.Create(
        'Duplicate import ''' + s + ''' declaration.'
      );
     Inc(c);
   end;

  c := 0;
  while c < self.const_lst.count do
   begin
     s := TMashASTB_Const(self.const_lst[c]).const_name;
     if self.consts.IndexOf(s) = -1 then
      self.consts.add(s)
     else
      raise Exception.Create(
        'Duplicate constant ''' + s + ''' declaration.'
      );
     Inc(c);
   end;

  c := 0;
  while c < self.ast_lst.count do
   begin
     p := self.ast_lst[c];
     j := 0;
     while j < TMashAST(p).nodes.count do
      begin
        p2 := TMashAST(p).nodes[j];

        case TMashASTBlock(p2).GetType of
          btEnum:
           begin
             self.enums.add(p2);

             s := TMashASTB_Enum(p2).Name;
             self.global_vars.add(s);

             if self.enums_names.IndexOf(s) = -1 then
              self.enums_names.add(s)
             else
              raise Exception.Create(
                'Duplicate enum ''' + s + ''' declaration.'
              );
           end;

          btMethod:
           begin
             if TMashASTB_Method(p2).is_class_method then
              begin
                self.class_methods.add(p2);
                if self.class_methods_names.IndexOf(TMashASTB_Method(p2).method_name) = -1 then
                 self.class_methods_names.add(TMashASTB_Method(p2).method_name);

                TMashASTB_Method(p2).local_vars.add('this');
              end
             else
              begin
                self.methods.add(p2);
                if self.methods_names.IndexOf(TMashASTB_Method(p2).method_name) = -1 then
                 self.methods_names.add(TMashASTB_Method(p2).method_name)
                else
                 raise Exception.Create(
                   'Duplicate method name ''' + TMashASTB_Method(p2).method_name + ''' at line ' +
                   IntToStr(TMashASTB_Method(p2).line + 1) + ' at file ''' +
                   TMashASTB_Method(p2).fp^ + '''.'
                 );
              end;

             k := 0;
             while k < TMashASTB_Method(p2).params.count do
              begin
                s := TMashASTB_Param(TMashASTB_Method(p2).params[k]).param.value;

                b := TMashASTB_Param(TMashASTB_Method(p2).params[k]).is_enumerable and
                     (TMashASTB_Method(p2).params.count > 1);

                if b then
                  b := b and ((k + 1) = TMashASTB_Method(p2).params.count)
                else
                 b := true;

                if (TMashASTB_Method(p2).local_vars.IndexOf(s) = -1) and b then
                 TMashASTB_Method(p2).local_vars.add(s)
                else
                 begin
                   if TMashASTB_Method(p2).is_class_method then
                    s := TMashASTB_Method(p2).class_name + '::' + TMashASTB_Method(p2).method_name
                   else
                    s := TMashASTB_Method(p2).method_name;

                   raise Exception.Create(
                     'Invalid method ''' + s + ''' declaration at line ' +
                     IntToStr(TMashASTB_Method(p2).line + 1) + ' at file ''' +
                     TMashASTB_Method(p2).fp^ + '''.'
                   );
                 end;

                Inc(k);
               end;
           end;

          btClass:
           begin
             self.classes_lst.add(p2);
             s := TMashASTB_Class(p2).class_name;

             if self.classes_names.IndexOf(s) = -1 then
              self.classes_names.add(s)
             else
              raise Exception.Create(
                'Duplicate class ''' + s + ''' declaration.'
              );

             if self.consts.IndexOf(s) = -1 then
              self.consts.add(s)
             else
              raise Exception.Create(
                'Duplicate constant ''' + s + ''' declaration.'
              );
           end;

          else
            self.global_nodes.add(p2);
        end;

        Inc(j);
      end;
     Inc(c);
   end;

  // Checking enum's
  c := 0;
  while c < self.enums.count do
   begin
     p := self.enums[c];

     j := 0;
     while j < TMashASTB_Enum(p).Nodes.count do
      begin
        s := TMashASTB_EnumItem(TMashASTB_Enum(p).Nodes[j]).Name;
        if self.consts.IndexOf(s) = -1 then
         self.consts.Add(s)
        else
         raise Exception.Create(
           'Duplicate constant ''' + s + ''' declaration.'
         );
        Inc(j);
      end;

     Inc(c);
   end;

  // Checking classes
  c := 0;
  while c < self.class_methods.count do
   begin
     p := self.class_methods[c];
     s := TMashASTB_Method(p).class_name;
     if self.classes_names.IndexOf(s) = -1 then
      raise Exception.Create(
        'Unknown class ''' + s + ''' in class method ''' +
        TMashASTB_Method(p).class_name + '::' + TMashASTB_Method(p).method_name +
        ''' declaration at line ' + IntToStr(TMashASTB_Method(p).line + 1) +
        ' at file ''' + TMashASTB_Method(p).fp^ + '''.'
      );
     Inc(c);
   end;

  c := 0;
  while c < self.classes_lst.count do
   begin
     p := self.classes_lst[c];

     if TMashASTB_Class(p).class_parents.count > self.max_class_parents then
      self.max_class_parents := TMashASTB_Class(p).class_parents.count;

     j := 0;
     while j < self.class_methods.count do
      begin
        p2 := self.class_methods[j];
        if TMashASTB_Method(p2).class_name = TMashASTB_Class(p).class_name then
         begin
           k := 0;
           while k < TMashASTB_Class(p).class_methods.count do
            begin
              if TMashClassMethodReference(
                  TMashASTB_Class(p).class_methods[k]
                 ).method_name = TMashASTB_Method(p2).method_name then
               raise Exception.Create(
                 'Duplicate method ''' + TMashASTB_Method(p2).class_name + '::' +
                 TMashASTB_Method(p2).method_name + ''' declaration at line ' +
                 IntToStr(TMashASTB_Method(p2).line + 1) + ' at file ''' +
                 TMashASTB_Method(p2).fp^ + '''.'
               );
              Inc(k);
            end;

           TMashASTB_Class(p).class_methods.Add(
             TMashClassMethodReference.Create(
               TMashASTB_Method(p2).method_name,
               TMashASTB_Method(p2)
             )
           );
         end;

        Inc(j);
      end;

     Inc(c);
   end;

  // Resolving dependens
  c := 0;
  while c <= self.max_class_parents do
   begin
     j := 0;
     while j < self.classes_lst.count do
      begin
        p := self.classes_lst[j];
        // Checking class by class
        if TMashASTB_Class(p).class_parents.count = c then
         begin
           d := 0;
           while d < self.classes_lst.Count do
            begin
              p2 := self.classes_lst[d];

              if (TMashASTB_Class(p2).class_parents.IndexOf(TMashASTB_Class(p).class_name) <> -1) and (p <> p2) then
               begin
                 g := 0;
                 while g < TMashASTB_Class(p).class_vars.Count do
                  begin
                    if TMashASTB_Class(p2).class_vars.IndexOf(TMashASTB_Class(p).class_vars[g]) = -1 then
                     TMashASTB_Class(p2).class_vars.Add(TMashASTB_Class(p).class_vars[g]);
                    Inc(g);
                  end;

                 g := 0;
                 while g < TMashASTB_Class(p).class_methods.Count do
                  begin
                    b := false;
                    f := 0;
                    while f < TMashASTB_Class(p2).class_methods.Count do
                     begin
                       if TMashClassMethodReference(TMashASTB_Class(p).class_methods[g]).method_name =
                          TMashClassMethodReference(TMashASTB_Class(p2).class_methods[f]).method_name then
                           begin
                             b := true;
                             break;
                           end;
                       Inc(f);
                     end;

                    if not b then
                     TMashASTB_Class(p2).class_methods.Add(TMashASTB_Class(p).class_methods[g]);

                    Inc(g);
                  end;
               end;

              Inc(d);
            end;
         end;

        Inc(j);
      end;

     Inc(c);
   end;

  c := 0;
  while c < Self.classes_lst.Count do
   begin
     p := Self.classes_lst[c];

     j := 0;
     while j < TMashASTB_Class(p).class_parents.Count do
      begin
        if Self.classes_names.IndexOf(TMashASTB_Class(p).class_parents[j]) = -1 then
         raise Exception.Create(
                 'Unresolved reference ''' + TMashASTB_Class(p).class_parents[j] +
                 ''' in class ''' + TMashASTB_Class(p).class_name + ''' declaration.'
               );
        Inc(j);
      end;

     Inc(c);
   end;

  // Filling virtual class table
  self.virtual_table.Add('type');
  c := 0;
  while c < self.class_methods_names.count do
   begin
     self.virtual_table.add(self.class_methods_names[c]);
     Inc(c);
   end;

  c := 0;
  while c < self.classes_lst.count do
   begin
     p := self.classes_lst[c];
     j := 0;
     while j < TMashASTB_Class(p).class_vars.count do
      begin
        if self.virtual_table.IndexOf(TMashASTB_Class(p).class_vars[j]) = -1 then
         self.virtual_table.add(TMashASTB_Class(p).class_vars[j]);
        Inc(j);
      end;

     Inc(c);
   end;
end;

procedure TMashSEM.Process;
var
  c, j: cardinal;
  m: TMashASTB_Method;
begin
  self.FillLists;

  c := 0;
  while c < self.global_nodes.count do
   begin
     self.CheckNode(TMashASTBlock(self.global_nodes[c]), false, nil);
     Inc(c);
   end;

  c := 0;
  while c < self.methods.count do
   begin
     m := TMashASTB_Method(self.methods[c]);
     j := 0;
     while j < m.Nodes.count do
      begin
        self.CheckNode(TMashASTBlock(m.Nodes[j]), true, m);
        Inc(j);
      end;
     Inc(c);
   end;

  c := 0;
  while c < self.class_methods.count do
   begin
     m := TMashASTB_Method(self.class_methods[c]);
     j := 0;
     while j < m.Nodes.count do
      begin
        self.CheckNode(TMashASTBlock(m.Nodes[j]), true, m);
        Inc(j);
      end;
     Inc(c);
   end;
end;


function TMashSEM.ItCanBeANewVar(v: string): boolean; inline;
begin
  Result := (self.consts.IndexOf(v) = -1) and
            (self.imports.IndexOf(v) = -1) and
            (self.methods_names.IndexOf(v) = -1) and
            (self.enums_names.IndexOf(v) = -1) and
            (self.global_vars.IndexOf(v) = -1);
end;

procedure TMashSEM.CheckNode(node: TMashASTBlock; isMethodNodes: boolean; Method: TMashASTB_Method);
var
  t: TMashToken;
  c: cardinal;
begin
  case node.GetType of
    btExpression: self.CheckNode(
      TMashASTExpression(TMashASTB_Expression(node).ast).TreeNode,
      isMethodNodes, Method
    );

    btEOperation:
     self.CheckNode(TMashASTE_Operation(node).A, isMethodNodes, Method);

    btEOperationLR:
     begin
       self.CheckNode(TMashASTE_OperationLR(node).L, isMethodNodes, Method);
       self.CheckNode(TMashASTE_OperationLR(node).R, isMethodNodes, Method);
     end;

    btPSimpleObject:
     begin
       t := TMashASTP_SimpleObject(node).Obj;
       if t.info = ttWord then
        if ItCanBeANewVar(t.value) then
         begin
           if isMethodNodes then
            begin
              if Method.local_vars.IndexOf(t.value) = -1 then
               Method.local_vars.add(t.value);
            end
           else
            self.global_vars.add(t.value);
         end
     end;

    btIf:
     begin
       c := 0;
       while c < TMashASTB_If(node).Nodes.count do
        begin
          self.CheckNode(TMashASTBlock(TMashASTB_If(node).Nodes[c]), isMethodNodes, Method);
          Inc(c);
        end;

       c := 0;
       if TMashASTB_If(node).hasElse then
        while c < TMashASTB_If(node).ElseNodes.count do
         begin
           self.CheckNode(TMashASTBlock(TMashASTB_If(node).ElseNodes[c]), isMethodNodes, Method);
           Inc(c);
         end;
     end;

    btSwitch:
     begin
       c := 0;
       while c < TMashASTB_Switch(node).Nodes.count do
        begin
          self.CheckNode(TMashASTBlock(TMashASTB_Switch(node).Nodes[c]), isMethodNodes, Method);
          Inc(c);
        end;

       if TMashASTB_Switch(node).hasElse then
        self.CheckNode(TMashASTB_Switch(node).ElseCase, isMethodNodes, Method);
     end;

    btWhile, btWhilst, btCase, btLaunch:
     begin
       c := 0;
       while c < TMashASTBlockWithNodes(node).Nodes.count do
        begin
          self.CheckNode(TMashASTBlock(TMashASTBlockWithNodes(node).Nodes[c]), isMethodNodes, Method);
          Inc(c);
        end;
     end;

    btForEach:
     begin
       if ItCanBeANewVar(TMashASTB_ForEach(node).forVar) then
        if isMethodNodes then
         begin
           if Method.local_vars.IndexOf(TMashASTB_ForEach(node).forVar) = -1 then
            Method.local_vars.add(TMashASTB_ForEach(node).forVar);
         end
        else
         self.global_vars.add(TMashASTB_ForEach(node).forVar);

       c := 0;
       while c < TMashASTB_ForEach(node).Nodes.count do
        begin
          self.CheckNode(TMashASTBlock(TMashASTB_ForEach(node).Nodes[c]), isMethodNodes, Method);
          Inc(c);
        end;
     end;

    btAsync:
     begin
       if ItCanBeANewVar(TMashASTB_Async(node).forVar) then
        if isMethodNodes then
         begin
           if Method.local_vars.IndexOf(TMashASTB_Async(node).forVar) = -1 then
            Method.local_vars.add(TMashASTB_Async(node).forVar);
         end
        else
         self.global_vars.add(TMashASTB_Async(node).forVar);

       c := 0;
       while c < TMashASTB_Async(node).Nodes.count do
        begin
          self.CheckNode(TMashASTBlock(TMashASTB_Async(node).Nodes[c]), isMethodNodes, Method);
          Inc(c);
        end;
     end;

    btTry:
     begin
       c := 0;
       while c < TMashASTB_Try(node).Nodes.count do
        begin
          self.CheckNode(TMashASTBlock(TMashASTB_Try(node).Nodes[c]), isMethodNodes, Method);
          Inc(c);
        end;

       if TMashASTB_Try(node).hasCatch then
        begin
          if ItCanBeANewVar(TMashASTB_Try(node).forVar) then
           if isMethodNodes then
            begin
              if Method.local_vars.IndexOf(TMashASTB_Try(node).forVar) = -1 then
               Method.local_vars.add(TMashASTB_Try(node).forVar);
            end
           else
            self.global_vars.add(TMashASTB_Try(node).forVar);

          c := 0;
          while c < TMashASTB_Try(node).NodesCatch.count do
           begin
             self.CheckNode(TMashASTBlock(TMashASTB_Try(node).NodesCatch[c]), isMethodNodes, Method);
             Inc(c);
           end;
        end;
     end;
  end;
end;

end.

