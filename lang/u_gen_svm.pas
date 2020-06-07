unit u_gen_svm;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_sem,
  u_tokens,
  u_ast_blocks,
  u_ast_constructions_blocks,
  u_ast_expression_blocks,
  u_ast_expression;

type
  TMashGeneratorSVM = class
    public
      constructor Create;
      destructor Destroy; override;

      procedure Generate(Sem: TMashSem; Outp: TStringList);

    private
      gcn: cardinal;

      break_points, continue_points: TStringList;

      procedure GenImports(Sem: TMashSem; Outp: TStringList);
      procedure GenHeader(Sem: TMashSem; Outp: TStringList);
      procedure GenEnums(Sem: TMashSem; Outp: TStringList);
      procedure GenFinallyCode(Sem: TMashSem; Outp: TStringList);

      function  GenMethodHeader(Outp: TStringList; m: TMashASTB_Method): string;
      procedure GenMethodEnd(Outp: TStringList; m: TMashASTB_Method; mname: string);

      procedure NextNode(Sem: TMashSem; Outp: TStringList;
                         isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                         node: TMashASTBlock);

      procedure GenOperation(Outp: TStringList; op: TMashTokenID);
      procedure GenOperationLR(Outp: TStringList; op: TMashTokenID);

      procedure GenArrayAlloc(Sem: TMashSem; Outp: TStringList;
                              isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                              IndexedObj: TMashASTP_IndexedObject);

      procedure GenArrayOp(Sem: TMashSem; Outp: TStringList;
                           isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                           IndexedObj: TMashASTP_IndexedObject; targetOp: string);

      procedure GenRefOp(Sem: TMashSem; Outp: TStringList;
                         isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                         RefObj: TMashASTP_Reference; targetOp: string);

      procedure GenCall(Sem: TMashSem; Outp: TStringList;
                        isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                        Call: TMashASTP_Call);
  end;

implementation

constructor TMashGeneratorSVM.Create;
begin
  inherited Create;
  self.gcn := 0;

  self.break_points := TStringList.Create;
  self.continue_points := TStringList.Create;
end;

destructor TMashGeneratorSVM.Destroy;
begin
  FreeAndNil(self.break_points);
  FreeAndNil(self.continue_points);
  inherited;
end;

procedure TMashGeneratorSVM.Generate(Sem: TMashSem; Outp: TStringList);
var
  c, j: cardinal;
  mname: string;
  m: TMashASTB_Method;
begin
  GenImports(Sem, Outp);
  GenHeader(Sem, Outp);

  c := 0;
  while c < sem.global_nodes.count do
   begin
     self.NextNode(Sem, Outp, false, '', nil, TMashASTBlock(Sem.global_nodes[c]));
     Inc(c);
   end;

  c := 0;
  while c < sem.methods.count do
   begin
     m := TMashASTB_Method(sem.methods[c]);
     mname := self.GenMethodHeader(Outp, m);

     j := 0;
     while j < m.Nodes.count do
      begin
        self.NextNode(Sem, Outp, true, mname, m, TMashASTBlock(m.Nodes[j]));
        Inc(j);
      end;

     self.GenMethodEnd(Outp, m, mname);
     Inc(c);
   end;

  c := 0;
  while c < sem.class_methods.count do
   begin
     m := TMashASTB_Method(sem.class_methods[c]);
     mname := self.GenMethodHeader(Outp, m);

     j := 0;
     while j < m.Nodes.count do
      begin
        self.NextNode(Sem, Outp, true, mname, m, TMashASTBlock(m.Nodes[j]));
        Inc(j);
      end;

     self.GenMethodEnd(Outp, m, mname);
     Inc(c);
   end;

  GenFinallyCode(Sem, Outp);
end;

procedure TMashGeneratorSVM.GenImports(Sem: TMashSem; Outp: TStringList);
var
  c: cardinal;
begin
  c := 0;
  while c < Sem.imp_lst.count do
   begin
     Outp.Add(
       'import ' + TMashASTB_Import(Sem.imp_lst[c]).method_name +
       ' "' + TMashASTB_Import(Sem.imp_lst[c]).lib_name + '" "' +
       TMashASTB_Import(Sem.imp_lst[c]).native_name + '"'
     );
     Inc(c);
   end;

  c := 0;
  while c < Sem.regapi_lst.count do
   begin
     Outp.Add(
       'import ' + TMashASTB_RegAPI(Sem.regapi_lst[c]).method_name +
       ' ' + TMashASTB_RegAPI(Sem.regapi_lst[c]).number
     );
     Inc(c);
   end;
end;

procedure TMashGeneratorSVM.GenHeader(Sem: TMashSem; Outp: TStringList);
var
  c: cardinal;
  cnst: TMashASTB_Const;
begin
  c := 0;
  while c < Sem.const_lst.count do
   begin
     cnst := TMashASTB_Const(Sem.const_lst[c]);

     if cnst.isStream then
      Outp.Add('stream ' + cnst.const_name + ' "' + cnst.const_value.value + '"')
     else
      if cnst.const_value.info = ttString then
       Outp.Add('str ' + cnst.const_name + ' "' + cnst.const_value.value + '"')
      else
       if pos('.', cnst.const_value.value) > 0 then
        Outp.Add('real ' + cnst.const_name + ' ' + cnst.const_value.value)
       else
        if pos('-', cnst.const_value.value) > 0 then
         Outp.Add('int ' + cnst.const_name + ' ' + cnst.const_value.value)
        else
         Outp.Add('word ' + cnst.const_name + ' ' + cnst.const_value.value);

     Inc(c);
   end;

  c := 0;
  while c < Sem.virtual_table.count do
   begin
     Outp.Add('word vtable__' + Sem.virtual_table[c] + ' ' + IntToStr(c));
     Inc(c);
   end;

  Outp.Add('@global.arg_counter');
  Outp.Add('@global.this');
  Outp.Add('@global.temp');

  Outp.Add('word global.zero 0');
  Outp.Add('word global.one  1');
  Outp.Add('str global.raised "ERaisedException"');

  Outp.Add('pushc global.zero');
  Outp.Add('peek  global.arg_counter');
  Outp.Add('pop');

  c := 0;
  while c < Sem.global_vars.count do
   begin
     Outp.Add('@' + Sem.global_vars[c]);
     Inc(c);
   end;

  c := 0;
  while c < Sem.classes_names.count do
   begin
     Outp.Add('word ' + Sem.classes_names[c] + ' ' + IntToStr(c + 8)); // 8 - offset for introspection
     Outp.Add('@structure_instance_' + Sem.classes_names[c]);
     Outp.Add('pushcp __allocator__' + Sem.classes_names[c]);
     Outp.Add('jc');
     Outp.Add('peek structure_instance_' + Sem.classes_names[c]);
     Outp.Add('pop');
     Inc(c);
   end;

  self.GenEnums(Sem, Outp);

  Outp.Add('pushcp __init__');
  Outp.Add('jc');
end;

procedure TMashGeneratorSVM.GenEnums(Sem: TMashSem; Outp: TStringList);
var
  c, j: cardinal;
  e:  TMashASTB_Enum;
  ei: TMashASTB_EnumItem;
begin
  c := 0;
  while c < Sem.enums.count do
   begin
     e := TMashASTB_Enum(Sem.enums[c]);

     Outp.Add('@' + e.Name);
     Outp.Add('word const.gcn.' + IntToStr(self.gcn) + ' ' + IntToStr(e.Nodes.count));
     Outp.Add('pushcp const.gcn.' + IntToStr(self.gcn));
     Outp.Add('pushcp global.one');
     Outp.Add('newa');
     Outp.Add('peek ' + e.Name);

     Outp.Add('pushc global.zero');
     Outp.Add('peek global.temp');
     Outp.Add('pop');

     j := 0;
     while j < e.Nodes.count do
      begin
        ei := TMashASTB_EnumItem(e.Nodes[j]);

        if ei.hasDefValue then
         begin
           if ei.DefValue.info = ttString then
            Outp.Add('str ' + ei.Name + ' "' + ei.DefValue.value + '"')
           else
            if Pos('.', ei.DefValue.value) > 0 then
             Outp.Add('real ' + ei.Name + ' ' + ei.DefValue.value)
            else
             if Pos('-', ei.DefValue.value) > 0 then
              Outp.Add('int ' + ei.Name + ' ' + ei.DefValue.value)
             else
              Outp.Add('word ' + ei.Name + ' ' + ei.DefValue.value);
         end
        else
         Outp.Add('word ' + ei.Name + ' ' + IntToStr(j));

        Outp.Add('pcopy');
        Outp.Add('pushc ' + ei.Name);
        Outp.Add('swp');
        Outp.Add('push global.temp');
        Outp.Add('swp');
        Outp.Add('peekai');

        Outp.Add('push global.temp');
        Outp.Add('inc');
        Outp.Add('pop');

        Inc(j);
      end;

     Outp.Add('pop');
     Inc(Self.gcn);

     Inc(c);
   end;
end;

procedure TMashGeneratorSVM.GenFinallyCode(Sem: TMashSem; Outp: TStringList);
var
  c, j: cardinal;
  cl: TMashASTB_Class;
begin
  if Sem.methods_names.IndexOf('main') <> -1 then
   begin
     Outp.Add('pushcp main');
     Outp.Add('jc');
   end;

  Outp.Add('word __vtable__size__ ' + IntToStr(Sem.virtual_table.count));

  c := 0;
  while c < Sem.classes_lst.count do
   begin
     cl := TMashASTB_Class(Sem.classes_lst[c]);

     Outp.Add('pushcp __allocator__' + cl.class_name + '__end');
     Outp.Add('jp');
     Outp.Add('__allocator__' + cl.class_name + ':');

     Outp.Add('pushcp __vtable__size__');
     Outp.Add('pushcp global.one');
     Outp.Add('newa');
     Outp.Add('typemarkclass');

     Outp.Add('pcopy');
     Outp.Add('pushc ' + cl.class_name);
     Outp.Add('swp');
     Outp.Add('pushcp vtable__type');
     Outp.Add('swp');
     Outp.Add('peekai');

     j := 0;
     while j < cl.class_methods.count do
      begin
        Outp.Add('pcopy');
        Outp.Add('pushc ' + TMashClassMethodReference(cl.class_methods[j]).reference.class_name + '__' + TMashClassMethodReference(cl.class_methods[j]).reference.method_name);
        Outp.Add('swp');
        Outp.Add('pushcp vtable__' + TMashClassMethodReference(cl.class_methods[j]).method_name);
        Outp.Add('swp');
        Outp.Add('peekai');

        Inc(j);
      end;

     Outp.Add('jr');
     Outp.Add('__allocator__' + cl.class_name + '__end:');

     Inc(c);
   end;
end;

function TMashGeneratorSVM.GenMethodHeader(Outp: TStringList; m: TMashASTB_Method): string;
var
  c: cardinal;
  mname: string;
  p: TMashASTB_Param;
begin
  mname := '';

  if m.is_class_method then
   mname := m.class_name + '__';

  mname := mname + m.method_name;

  Result := mname;

  Outp.Add('pushcp ' + mname + '__end');
  Outp.Add('jp');
  Outp.Add(mname + ':');

  c := 0;
  while c < m.local_vars.count do
   begin
     Outp.Add('@' + mname + '.' + m.local_vars[c]);
     Inc(c);
   end;

  Outp.Add('pushcp safecall_' + mname + '.finally');
  Outp.Add('pushcp safecall_' + mname + '.catch');
  Outp.Add('tr');

  c := 0;
  while c < m.params.count do
   begin
     p := TMashASTB_Param(m.params[c]);

     if p.is_enumerable then
      begin
        Outp.Add('word const.gcn.' + IntToStr(self.gcn) + ' ' + IntToStr(m.params.count - 1));
        Outp.Add('pushcp const.gcn.' + IntToStr(self.gcn));
        Outp.Add('push global.arg_counter');
        Outp.Add('sub');
        Outp.Add('pushcp system_op_argsarr');
        Outp.Add('jc');
        Outp.Add('peek ' + mname + '.' + p.param.value);
        Outp.Add('pop');

        Inc(self.gcn);
      end
     else
      begin
        Outp.Add('peek ' + mname + '.' + p.param.value);
        Outp.Add('pop');
      end;

     Inc(c);
   end;

  if m.is_class_method then
   begin
     Outp.Add('push global.this');
     Outp.Add('peek ' + mname + '.this');
     Outp.Add('pop');
   end;
end;

procedure TMashGeneratorSVM.GenMethodEnd(Outp: TStringList; m: TMashASTB_Method; mname: string);
var
  w: word;
begin
  w := 0;
  Outp.Add('pushn');
  while w < m.local_vars.count do
   begin
     Outp.Add('peek ' + mname + '.' + m.local_vars[w]);
     inc(w);
   end;
  Outp.Add('pop');

  Outp.Add('trs');
  Outp.Add('safecall_' + mname + '.catch:');

  Outp.Add('peek global.temp');

  Outp.Add('pushcp ' + mname);
  Outp.Add('push global.temp');
  Outp.Add('bg');
  Outp.Add('push global.temp');
  Outp.Add('pushcp ' + mname + '__end');
  Outp.Add('bg');
  Outp.Add('and');

  Outp.Add('pushcp safecall_' + mname + '.catch_stkctrl_noneed');
  Outp.Add('swp');
  Outp.Add('jn');
  Outp.Add('pop');

  // clean
  w := 0;
  while w < m.local_vars.Count do
   begin
     Outp.Add('rld');
     Outp.Add('pop');
     Inc(w);
   end;

  Outp.Add('jrp');

  Outp.Add('safecall_' + mname + '.catch_stkctrl_noneed:');

  Outp.Add('rst');
  Outp.Add('rst');
  Outp.Add('rst');

  Outp.Add('pushc ' + mname);
  Outp.Add('str safecall_' + mname + '.m_info "' + mname + '"');
  Outp.Add('pushc safecall_' + mname + '.m_info');
  Outp.Add('push global.temp');
  Outp.Add('pushcp system_traceback');
  Outp.Add('jc');

  Outp.Add('rld');
  Outp.Add('rld');
  Outp.Add('rld');
  Outp.Add('trr');

  Outp.Add('safecall_' + mname + '.finally:');
  Outp.Add('jr');
  Outp.Add(mname + '__end:');
end;

procedure TMashGeneratorSVM.NextNode(Sem: TMashSem; Outp: TStringList;
                                    isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                                    node: TMashASTBlock);
var
  p: pointer;
  i: integer;
  s: string;
  b: boolean;
begin
  case node.GetType of
    // Expressions
    btEOperation:
     begin
       if TMashASTE_Operation(node).Op.Op.short = tkNew then
        begin
          if (TMashASTE_Operation(node).A.GetType = btPCall) and
             (TMashASTP_Call(TMashASTE_Operation(node).A).Obj.GetType = btPSimpleObject) then
           begin
             if TMashASTP_SimpleObject(TMashASTP_Call(TMashASTE_Operation(node).A).Obj).Obj.info = ttWord then
              begin // Correct constructor call
                if isMethodNode then
                 begin
                   i := 0;
                   while i < method.local_vars.count do
                    begin
                      Outp.Add('push ' + mname + '.' + method.local_vars[i]);
                      Outp.Add('rst');

                      Inc(i);
                    end;
                 end;

                Outp.Add('pushcp __allocator__' + TMashASTP_SimpleObject(TMashASTP_Call(TMashASTE_Operation(node).A).Obj).Obj.value);
                Outp.Add('jc');
                s := 'constructor_call.temp.gcn.' + IntToStr(self.gcn);
                Inc(self.gcn);
                Outp.Add('@' + s);
                Outp.Add('peek ' + s);
                Outp.Add('pop');

                i := TMashASTP_Call(TMashASTE_Operation(node).A).Args.Objects.count - 1;
                while i >= 0 do
                 begin
                   self.NextNode(Sem, Outp, isMethodNode, mname, method,
                                 TMashASTBlock(TMashASTP_Call(TMashASTE_Operation(node).A).Args.Objects[i]));
                   Dec(i);
                 end;

                Outp.Add('push ' + s);
                Outp.Add('peek global.this');

                Outp.Add('pushcp vtable__create');
                Outp.Add('swp');
                Outp.Add('pushai');

                Outp.Add('word const.gcn.' + IntToStr(self.gcn) + ' ' + IntToStr(TMashASTP_Call(TMashASTE_Operation(node).A).Args.Objects.count));
                Outp.Add('pushcp const.gcn.' + IntToStr(self.gcn));
                Outp.Add('push global.arg_counter');
                Outp.Add('mov');
                Inc(self.gcn);

                Outp.Add('jc');
                Outp.Add('push ' + s);


                if isMethodNode then
                 begin
                   i := method.local_vars.count - 1;
                   while i >= 0  do
                    begin
                      Outp.Add('rld');
                      Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
                      Outp.Add('pop');

                      Dec(i);
                    end;
                 end;
              end
             else
              raise Exception.Create(
                'Uncorrect using of ''new'' operator.'
              );
           end
          else
           if (TMashASTE_Operation(node).A.GetType = btPSimpleObject) and
              (TMashASTP_SimpleObject(TMashASTE_Operation(node).A).Obj.info = ttWord) then
            begin // Correct allocation
              Outp.Add('pushcp __allocator__' + TMashASTP_SimpleObject(TMashASTE_Operation(node).A).Obj.value);
              Outp.Add('jc');
            end
           else
            raise Exception.Create(
              'Uncorrect using of ''new'' operator.'
            );
        end
       else // Simple operations
        begin
          self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTE_Operation(node).A);
          self.GenOperation(Outp, TMashASTE_Operation(node).Op.Op.short);
        end;
     end;

    btEOperationLR:
     begin
       if TMashASTE_OperationLR(Node).Op.Op.short = tkAssign then
        begin
          case TMashASTE_OperationLR(Node).L.GetType of
            btPSimpleObject:
             begin
               Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                             TMashASTE_OperationLR(Node).R);

               s := TMashASTP_SimpleObject(TMashASTE_OperationLR(Node).L).Obj.value;

               b := Sem.global_vars.IndexOf(s) <> -1;
               if (not b) and isMethodNode then
                b := method.local_vars.IndexOf(s) <> -1;

               if not b then
                raise Exception.Create('Invalid assigment for ''' + s + '''.');

               if isMethodNode and (method.local_vars.IndexOf(s) <> -1) then
                 Outp.Add('peek ' + mname + '.' + s)
               else
                 Outp.Add('peek ' + s);

               Outp.Add('pop');
             end;

            btPIndexedObject:
             begin
               Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                             TMashASTE_OperationLR(Node).R); 

               Self.GenArrayOp(Sem, Outp, isMethodNode, mname, method,
                               TMashASTP_IndexedObject(TMashASTE_OperationLR(Node).L),
                               'peekai');
             end;

            btPReference:
             begin
               Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                             TMashASTE_OperationLR(Node).R);

               Self.GenRefOp(Sem, Outp, isMethodNode, mname, method,
                             TMashASTP_Reference(TMashASTE_OperationLR(Node).L),
                             'peekai');
             end;
          end;
        end
       else
        begin
          if TMashASTE_OperationLR(Node).Op.Op.short = tkDot then
           begin
             if TMashASTE_OperationLR(Node).R.GetType = btPCall then
              begin
                TMashASTP_Call(TMashASTE_OperationLR(Node).R).Args.Objects.Insert(
                  0, TMashASTE_OperationLR(Node).L
                );

                Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                              TMashASTE_OperationLR(Node).R);
              end
             else
              raise Exception.Create('Invalid operations with ''.''!');
           end
          else
           begin
             Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                           TMashASTE_OperationLR(Node).R);

             Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                           TMashASTE_OperationLR(Node).L);

             Self.GenOperationLR(Outp, TMashASTE_OperationLR(Node).Op.Op.short);
           end;
        end;
     end;

    btPSimpleObject:
     begin
       case TMashASTP_SimpleObject(Node).Obj.info of
         ttDigit:
          begin
            if Pos('.', TMashASTP_SimpleObject(Node).Obj.value) > 0 then
             Outp.Add('real generator.const.gcn.' + IntToStr(self.gcn) + ' ' + TMashASTP_SimpleObject(Node).Obj.value)
            else
             Outp.Add('word generator.const.gcn.' + IntToStr(self.gcn) + ' ' + TMashASTP_SimpleObject(Node).Obj.value);
            Outp.Add('pushc generator.const.gcn.' + IntToStr(self.gcn));
            Inc(self.gcn);
          end;

         ttString:
          begin
            Outp.Add('str generator.const.gcn.' + IntToStr(self.gcn) + ' "' + TMashASTP_SimpleObject(Node).Obj.value + '"');
            Outp.Add('pushc generator.const.gcn.' + IntToStr(self.gcn));
            Inc(self.gcn);
          end;

         ttWord:
          begin
            s := TMashASTP_SimpleObject(Node).Obj.value;
            if (Sem.methods_names.IndexOf(s) <> -1) or
               (Sem.imports.IndexOf(s) <> -1) or
               (Sem.consts.IndexOf(s) <> -1) then
             Outp.Add('pushc ' + s)
            else
             begin
               if isMethodNode then
                if (method.local_vars.IndexOf(s) <> -1) and (Sem.global_vars.IndexOf(s) = -1) then
                   s := mname + '.' + s;

               Outp.Add('push ' + s);
             end;
          end;
       end;
     end;

    btPReference:
     Self.GenRefOp(Sem, Outp, isMethodNode, mname, method,
                   TMashASTP_Reference(Node), 'pushai');


    btPIndexedObject:
     begin
       b := false;

       if TMashASTP_IndexedObject(Node).Obj.GetType = btPSimpleObject then
        if TMashASTP_SimpleObject(TMashASTP_IndexedObject(Node).Obj).Obj.value = 'new' then
         begin
           b := true;
           Self.GenArrayAlloc(Sem, Outp, isMethodNode, mname, method, TMashASTP_IndexedObject(Node));
         end;

       if not b then
        Self.GenArrayOp(Sem, Outp, isMethodNode, mname, method,
                        TMashASTP_IndexedObject(Node), 'pushai');
     end;

    btPCall:
     Self.GenCall(Sem, Outp, isMethodNode, mname, method, TMashASTP_Call(Node));


    btPEnum:
     begin
       i := TMashASTP_Enum(Node).Objects.Count;
       Outp.Add('word generator.const.gcn.' + IntToStr(Self.gcn) + ' ' + IntToStr(i));
       Outp.Add('pushcp generator.const.gcn.' + IntToStr(Self.gcn));
       Inc(Self.gcn);

       Outp.Add('pushcp global.one');
       Outp.Add('newa');
       Outp.Add('rst');

       i := 0;
       while i < TMashASTP_Enum(Node).Objects.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTP_Enum(Node).Objects[i]));

          Outp.Add('rld');
          Outp.Add('pcopy');
          Outp.Add('rst');

          Outp.Add('word generator.const.gcn.' + IntToStr(Self.gcn) + ' ' + IntToStr(i));
          Outp.Add('pushcp generator.const.gcn.' + IntToStr(Self.gcn));
          Inc(Self.gcn);

          Outp.Add('swp');
          Outp.Add('peekai');
          Inc(i);
        end;

       Outp.Add('rld');
     end;


    btExpression:
     begin
       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTExpression(TMashASTB_Expression(Node).ast).TreeNode);
     end;

    // Constructions

    btInline:
     begin
       s := TMashASTB_Inline(Node).asm_string;

       if (pos('$', s) > 0) and isMethodNode then
        s := StringReplace(s, '$', mname + '.', [rfReplaceAll]);

       Outp.Add(s);
     end;

    btIf:
     begin
       s := 'generator.if.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);
       Outp.Add('pushcp ' + s + '.else');

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_If(Node).Expr);

       Outp.Add('jz');
       Outp.Add('pop');

       i := 0;
       while i < TMashASTB_If(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_If(Node).Nodes[i]));
          Inc(i);
        end;

       if TMashASTB_If(Node).hasElse then
        begin
          Outp.Add('pushcp ' + s + '.end');
          Outp.Add('jp');
          Outp.Add(s + '.else:');

          i := 0;
          while i < TMashASTB_If(Node).ElseNodes.Count do
           begin
             Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                           TMashASTBlock(TMashASTB_If(Node).ElseNodes[i]));
             Inc(i);
           end;

          Outp.Add(s + '.end:');
        end
       else
        Outp.Add(s + '.else:');
     end;

    btWhile:
     begin
       s := 'generator.while.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);
       Self.break_points.Add(s + '.end');
       Self.continue_points.Add(s + '.start');

       Outp.Add(s + '.start:');
       Outp.Add('pushcp ' + s + '.end');

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_While(Node).Expr);

       Outp.Add('jz');
       Outp.Add('pop');

       i := 0;
       while i < TMashASTB_While(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_While(Node).Nodes[i]));
          Inc(i);
        end;

       Outp.Add('pushcp ' + s + '.start');
       Outp.Add('jp');
       Outp.Add(s + '.end:');

       Self.break_points.Delete(Self.break_points.Count - 1);
       Self.continue_points.Delete(Self.continue_points.Count - 1);
     end;


    btWhilst:
     begin
       s := 'generator.whilst.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);
       Self.break_points.Add(s + '.end');
       Self.continue_points.Add(s + '.start');

       Outp.Add(s + '.start:');

       i := 0;
       while i < TMashASTB_Whilst(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_Whilst(Node).Nodes[i]));
          Inc(i);
        end;

       Outp.Add('pushcp ' + s + '.start');

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_Whilst(Node).Expr);

       Outp.Add('jn');
       Outp.Add('pop');
       Outp.Add(s + '.end:');

       Self.break_points.Delete(Self.break_points.Count - 1);
       Self.continue_points.Delete(Self.continue_points.Count - 1);
     end;

    btForEach:
     begin
       s := 'generator.foreach.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);
       Self.break_points.Add(s + '.end');
       Self.continue_points.Add(s + '.continue');

       Outp.Add('@' + s + '.array');
       Outp.Add('@' + s + '.i');
       Outp.Add('@' + s + '.to');

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_ForEach(Node).Expr);

       Outp.Add('peek ' + s + '.array');
       Outp.Add('alen');

       if TMashASTB_ForEach(Node).isBack then
        begin
          Outp.Add('peek ' + s + '.i');
          Outp.Add('dec');
          Outp.Add('pop');
          Outp.Add('pushc global.zero');
          Outp.Add('peek ' + s + '.to');
          Outp.Add('dec');
          Outp.Add('pop');
        end
       else
        begin
          Outp.Add('peek ' + s + '.to');
          Outp.Add('pop');
          Outp.Add('pushc global.zero');
          Outp.Add('peek ' + s + '.i');
          Outp.Add('pop');
        end;

       Outp.Add(s + '.start:');
       Outp.Add('pushcp ' + s + '.end');

       Outp.Add('push ' + s + '.i');
       Outp.Add('push ' + s + '.to');
       Outp.Add('eq');
       Outp.Add('not');

       Outp.Add('jz');
       Outp.Add('pop');

       Outp.Add('push ' + s + '.i');
       Outp.Add('push ' + s + '.array');
       Outp.Add('pushai');

       if isMethodNode then
        Outp.Add('peek ' + mname + '.' + TMashASTB_ForEach(Node).forVar)
       else
        Outp.Add('peek ' + TMashASTB_ForEach(Node).forVar);

       Outp.Add('pop');

       i := 0;
       while i < TMashASTB_ForEach(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_While(Node).Nodes[i]));
          Inc(i);
        end;

       Outp.Add(s + '.continue:');
       Outp.Add('push ' + s + '.i');

       if TMashASTB_ForEach(Node).isBack then
        Outp.Add('dec')
       else
        Outp.Add('inc');

       Outp.Add('pop');

       Outp.Add('pushcp ' + s + '.start');
       Outp.Add('jp');
       Outp.Add(s + '.end:');

       Self.break_points.Delete(Self.break_points.Count - 1);
       Self.continue_points.Delete(Self.continue_points.Count - 1);
     end;

    btReturn:
     begin
       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_Return(Node).Expr);

       Outp.Add('trs');
     end;

    btBreak:
     begin
       if Self.break_points.Count > 0 then
        begin
          Outp.Add('pushcp ' + Self.break_points[Self.break_points.Count - 1]);
          Outp.Add('jp');
        end
       else
        raise Exception.Create('Bad ''break'' position. Can''t jump out of code here.');
     end;

    btContinue:
     begin
       if Self.continue_points.Count > 0 then
        begin
          Outp.Add('pushcp ' + Self.continue_points[Self.continue_points.Count - 1]);
          Outp.Add('jp');
        end
       else
        raise Exception.Create('Bad ''continue'' position. Can''t jump from here.');
     end;

    btSwitch:
     begin
       s := 'generator.switch.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);
       Self.break_points.Add(s + '.end');

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_Switch(Node).Expr);

       i := 0;
       while i < TMashASTB_Switch(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_Switch(Node).Nodes[i]));
          Inc(i);
        end;

       if TMashASTB_Switch(Node).hasElse then
        begin
          i := 0;
          while i < TMashASTB_Case(TMashASTB_Switch(Node).ElseCase).Nodes.Count do
           begin
             Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                           TMashASTBlock(TMashASTB_Case(TMashASTB_Switch(Node).ElseCase).Nodes[i]));
             Inc(i);
           end;
        end;

       Outp.Add(s + '.end:');

       Self.break_points.Delete(Self.break_points.Count - 1);
     end;

    btCase:
     begin
       s := 'generator.case.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);

       Outp.Add('pcopy');

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_Case(Node).Expr);
       Outp.Add('eq');
       Outp.Add('pushcp ' + s + '.end');
       Outp.Add('swp');
       Outp.Add('jz');

       i := 0;
       while i < TMashASTB_Case(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_Case(Node).Nodes[i]));
          Inc(i);
        end;

       Outp.Add('pushcp ' + Self.break_points[Self.break_points.Count - 1]);
       Outp.Add('jp');
       Outp.Add(s + '.end:');
     end;

    btLaunch:
     begin
       s := 'generator.launch.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);

       if isMethodNode then
        begin
          i := 0;
          while i < method.local_vars.count do
           begin
             Outp.Add('push ' + mname + '.' + method.local_vars[i]);
             Outp.Add('copy');
             Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
             Outp.Add('pop');

             Inc(i);
           end;
        end;

       Outp.Add('pushn');
       Outp.Add('pushcp ' + s + '.start');
       Outp.Add('cthr');
       Outp.Add('rthr');
       Outp.Add('pushcp ' + s + '.end');
       Outp.Add('jp');
       Outp.Add(s + '.start:');
       Outp.Add('pop');


       Outp.Add('pushcp system_reset_traceback');
       Outp.Add('jc');
       i := 0;
       while i < TMashASTB_Launch(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_Launch(Node).Nodes[i]));
          Inc(i);
        end;

       Outp.Add('jr');
       Outp.Add(s + '.end:');

       if isMethodNode then
        begin
          i := method.local_vars.count - 1;
          while i >= 0 do
           begin
             Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
             Outp.Add('pop');

             Dec(i);
           end;
        end;
     end;

    btAsync:
     begin
       s := 'generator.async.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);

       if isMethodNode then
        begin
          i := 0;
          while i < method.local_vars.count do
           begin
             if method.local_vars[i] <> TMashASTB_Async(Node).forVar then
              begin
                Outp.Add('push ' + mname + '.' + method.local_vars[i]);
                Outp.Add('copy');
                Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
                Outp.Add('pop');
              end;
             Inc(i);
           end;
        end;

       Outp.Add('pushc global.zero');

       if isMethodNode then
        Outp.Add('peek ' + mname + '.' + TMashASTB_Async(Node).forVar)
       else
        Outp.Add('peek ' + TMashASTB_Async(Node).forVar);

       Outp.Add('pop');


       Outp.Add('pushn');
       Outp.Add('pushcp ' + s + '.start');
       Outp.Add('cthr');
       Outp.Add('rthr');
       Outp.Add('pushcp ' + s + '.end');
       Outp.Add('jp');
       Outp.Add(s + '.start:');
       Outp.Add('pop');

       Outp.Add('pushcp system_reset_traceback');
       Outp.Add('jc');

       i := 0;
       while i < TMashASTB_Async(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_Async(Node).Nodes[i]));
          Inc(i);
        end;

       if isMethodNode then
        Outp.Add('push ' + mname + '.' + TMashASTB_Async(Node).forVar)
       else
        Outp.Add('push ' + TMashASTB_Async(Node).forVar);

       Outp.Add('inc');
       Outp.Add('pop');
       Outp.Add('jr');
       Outp.Add(s + '.end:');

       if isMethodNode then
        begin
          i := method.local_vars.count - 1;
          while i >= 0 do
           begin
             if method.local_vars[i] <> TMashASTB_Async(Node).forVar then
              begin
                Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
                Outp.Add('pop');
              end;
             Dec(i);
           end;
        end;
     end;

    btWait:
     begin
       s := 'generator.wait.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);

       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_Wait(Node).Expr);

       Outp.Add('pushcp ' + s + '.check');
       Outp.Add('jp');
       Outp.Add(s + '.start:');
       Outp.Add('pushcp global.one');
       Outp.Add('pushcp sleep');
       Outp.Add('invoke');
       Outp.Add(s + '.check:');
       Outp.Add('pcopy');
       Outp.Add('pushcp ' + s + '.start');
       Outp.Add('swp');
       Outp.Add('jz');
       Outp.Add('pop');
       Outp.Add('pop');
     end;

    btTry:
     begin
       s := 'generator.try.gcn.' + IntToStr(Self.gcn);
       Inc(Self.gcn);
       Self.break_points.Add(s + '.break');

       Outp.Add('pushcp ' + s + '.finally');
       Outp.Add('pushcp ' + s + '.catch');
       Outp.Add('tr');

       i := 0;
       while i < TMashASTB_Try(Node).Nodes.Count do
        begin
          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTBlock(TMashASTB_Try(Node).Nodes[i]));
          Inc(i);
        end;

       Outp.Add(s + '.break:');
       Outp.Add('trs');
       Self.break_points.Delete(Self.break_points.Count - 1);
       Self.break_points.Add(s + '.finally');
       Outp.Add(s + '.catch:');

       if isMethodNode then
        begin
          Outp.Add('peek global.temp');

          Outp.Add('pushcp ' + mname);
          Outp.Add('push global.temp');
          Outp.Add('bg');
          Outp.Add('push global.temp');
          Outp.Add('pushcp ' + mname + '__end');
          Outp.Add('bg');
          Outp.Add('and');

          Outp.Add('pushcp ' + s + '.catch_stkctrl_noneed');
          Outp.Add('swp');
          Outp.Add('jn');
          Outp.Add('pop');

          // clean
          i := 0;
          while i < method.local_vars.Count do
           begin
             Outp.Add('rld');
             Outp.Add('pop');
             Inc(i);
           end;

          Outp.Add('jrp');

          Outp.Add(s + '.catch_stkctrl_noneed:');
        end;

       if TMashASTB_Try(Node).hasCatch then
        begin

          if isMethodNode then
           begin
             Outp.Add('pcopy');
             Outp.Add('rst');
             Outp.Add('swp');
             Outp.Add('rst');
             Outp.Add('swp');
             Outp.Add('rst');

             Outp.Add('pushc ' + mname);
             Outp.Add('swp');
             Outp.Add('str ' + s + '.m_info "' + mname + '"');
             Outp.Add('pushc ' + s + '.m_info');
             Outp.Add('swp');
             Outp.Add('pushcp system_traceback');
             Outp.Add('jc');

             Outp.Add('rld');
             Outp.Add('rld');
             Outp.Add('rld');
           end;

          Outp.Add('pushcp system_makeexception');
          Outp.Add('jc');

          if isMethodNode then
           Outp.Add('peek ' + mname + '.' + TMashASTB_Try(Node).forVar)
          else
           Outp.Add('peek ' + TMashASTB_Try(Node).forVar);

          Outp.Add('pop');

          Outp.Add('pushcp system_reset_traceback');
          Outp.Add('jc');

          i := 0;
          while i < TMashASTB_Try(Node).NodesCatch.Count do
           begin
             Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                           TMashASTBlock(TMashASTB_Try(Node).NodesCatch[i]));
             Inc(i);
           end;
        end
       else
        begin             
          Outp.Add('pop');
          Outp.Add('pop');
          Outp.Add('pop');
          Outp.Add('pushcp system_reset_traceback');
          Outp.Add('jc');
        end;

       Outp.Add(s + '.finally:');

       Self.break_points.Delete(Self.break_points.Count - 1);
     end;

    btRaise:
     begin
       Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                     TMashASTB_Raise(Node).Expr);
       Outp.Add('pushc global.raised');
       Outp.Add('pushc ' + mname);
       Outp.Add('inc');
       Outp.Add('trr');
     end;

   { btSafe:
     begin
       if isMethodNode then
        begin
          i := 0;
          while i < method.local_vars.count do
           begin
             Outp.Add('push ' + mname + '.' + method.local_vars[i]);
             Outp.Add('rst');

             Inc(i);
           end;

          Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                        TMashASTB_Safe(Node).Expr);

          i := method.local_vars.count - 1;
          while i >= 0 do
           begin
             Outp.Add('rld');
             Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
             Outp.Add('pop');

             Dec(i);
           end;
        end
       else
        Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                      TMashASTB_Safe(Node).Expr);
     end;}
  end;
end;


procedure TMashGeneratorSVM.GenCall(Sem: TMashSem; Outp: TStringList;
                                    isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                                    Call: TMashASTP_Call);

function FindReference(Cls: TMashASTB_Class; mn: string): TMashClassMethodReference;
var
  k, d, p: word;
  pCls: TMashASTB_Class;
  mr: TMashClassMethodReference;
begin
  Result := nil;

  k := 0;
  while k < Cls.class_parents.Count do
   begin
     d := 0;
     while d < Sem.classes_lst.count do
      begin
        pCls := TMashASTB_Class(Sem.classes_lst[d]);
        if pCls.class_name = Cls.class_parents[k] then
         begin
           p := 0;
           while p < pCls.class_methods.count do
            begin
              mr := TMashClassMethodReference(pCls.class_methods[p]);
              if mr.method_name = mn then
               begin
                 Result := mr;
                 break;
               end;
              Inc(p);
            end;

           if (pCls.class_parents.count > 0) and (Result = nil) then
            Result := FindReference(pCls, mn);
         end;

        if Result <> nil then
         break;

        Inc(d);
      end;

      if Result <> nil then
       break;
     Inc(k);
   end;
end;

var
  isSuper, isInvoke, founded: boolean;
  i, j: integer;
  SuperRef: TMashClassMethodReference;
begin
  isSuper := false;
  isInvoke := false;

  if Call.Obj.GetType = btPSimpleObject then
   if TMashASTP_SimpleObject(Call.Obj).Obj.value = 'super' then
    isSuper := true
   else
    if Sem.imports.IndexOf(TMashASTP_SimpleObject(Call.Obj).Obj.value) <> -1 then
     isInvoke := true;

  if isMethodNode and (not isInvoke) then
   begin
     i := 0;
     while i < method.local_vars.count do
      begin
        Outp.Add('push ' + mname + '.' + method.local_vars[i]);
        Outp.Add('rst');

        Inc(i);
      end;
   end;

  i := Call.Args.Objects.count - 1;
  while i >= 0 do
   begin
     Self.NextNode(Sem, Outp, isMethodNode, mname, method,
                   TMashASTBlock(Call.Args.Objects[i]));
     Dec(i);
   end;

  if isSuper then
   begin
     if isMethodNode then
      begin
        if method.is_class_method then
         begin
           founded := false;

           i := 0;
           while i < Sem.classes_lst.Count do
            begin
              if TMashASTB_Class(Sem.classes_lst[i]).class_name = method.class_name then
               begin
                 SuperRef := FindReference(TMashASTB_Class(Sem.classes_lst[i]), method.method_name);
                 founded := true;
                 break;
               end;
              Inc(i);
            end;

           if founded then
            begin
              Outp.Add('push ' + mname + '.this');
              Outp.Add('peek global.this');
              Outp.Add('pop');

              Outp.Add('pushcp ' + SuperRef.reference.class_name + '__' + SuperRef.reference.method_name);
            end
           else
            raise Exception.Create('super() - reference not resolved.');
         end
        else
         raise Exception.Create('Using super() over class method.');
      end
     else
      raise Exception.Create('Using super() over class method.');
   end
  else
   Self.NextNode(Sem, Outp, isMethodNode, mname, method, Call.Obj);

  if isInvoke then
   Outp.Add('invoke')
  else
   begin
     Outp.Add('word generator.const.gcn.' + IntToStr(Self.gcn) + ' ' +
              IntToStr(Call.Args.Objects.Count));
     Outp.Add('pushcp generator.const.gcn.' + IntToStr(Self.gcn));
     Outp.Add('push global.arg_counter');
     Outp.Add('mov');
     Inc(Self.gcn);
     Outp.Add('jc');

     if isMethodNode then
      begin
        i := method.local_vars.count - 1;
        while i >= 0  do
         begin
           Outp.Add('rld');
           Outp.Add('peek ' + mname + '.' + method.local_vars[i]);
           Outp.Add('pop');

           Dec(i);
         end;
      end;

   end;
end;

procedure TMashGeneratorSVM.GenArrayAlloc(Sem: TMashSem; Outp: TStringList;
                                          isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                                          IndexedObj: TMashASTP_IndexedObject);
var
  i: integer;
begin
  i := IndexedObj.Indexes.count - 1;
  while i >= 0 do
   begin
     self.NextNode(Sem, Outp, isMethodNode, mname, method, TMashASTBlock(IndexedObj.Indexes[i]));
     Dec(i);
   end;

  Outp.Add('word const.gcn.' + IntToStr(self.gcn) + ' ' + IntToStr(IndexedObj.Indexes.count));
  Outp.Add('pushcp const.gcn.' + IntToStr(self.gcn));
  Outp.Add('newa');
  Inc(self.gcn);
end;

procedure TMashGeneratorSVM.GenArrayOp(Sem: TMashSem; Outp: TStringList;
                                       isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                                       IndexedObj: TMashASTP_IndexedObject;
                                       targetOp: string);
var
  i: integer;
begin
  self.NextNode(Sem, Outp, isMethodNode, mname, method, IndexedObj.Obj);

  i := 0;
  while i < IndexedObj.Indexes.count do
   begin
     self.NextNode(Sem, Outp, isMethodNode, mname, method, TMashASTBlock(IndexedObj.Indexes[i]));
     Outp.Add('swp');
     Inc(i);

     if i < IndexedObj.Indexes.count then
      Outp.Add('pushai')
     else
      Outp.Add(targetOp);
   end;
end;

procedure TMashGeneratorSVM.GenRefOp(Sem: TMashSem; Outp: TStringList;
                                     isMethodNode: boolean; mname: string; method: TMashASTB_Method;
                                     RefObj: TMashASTP_Reference;
                                     targetOp: string);
var
  i: integer;
  first: TMashASTBlock;
  isPkg: boolean;
  cnt: word;
begin
  first := TMashASTBlock(RefObj.ObjPath[0]);
  isPkg := false;

  if first.GetType = btPSimpleObject then
   if TMashASTP_SimpleObject(first).Obj.info = ttWord then
    if Sem.classes_names.IndexOf(TMashASTP_SimpleObject(first).Obj.value) <> -1 then
     begin
       isPkg := true;
       Outp.Add('push structure_instance_' + TMashASTP_SimpleObject(first).Obj.value);
     end;

  if not isPkg then
   self.NextNode(Sem, Outp, isMethodNode, mname, method, first);

  i := 1;
  cnt := RefObj.ObjPath.Count;

  while i < cnt do
   begin
     if i + 1 >= cnt then
      Outp.Add('peek global.this');

     if TMashASTBlock(RefObj.ObjPath[i]).GetType = btPSimpleObject then
      Outp.Add('pushcp ' + TMashASTP_SimpleObject(RefObj.ObjPath[i]).Obj.value)
     else
      self.NextNode(Sem, Outp, isMethodNode, mname, method, TMashASTBlock(RefObj.ObjPath[i]));

     Outp.Add('swp');
     Inc(i);

     if i < cnt then
      Outp.Add('pushai')
     else
      Outp.Add(targetOp);
   end;
end;

procedure TMashGeneratorSVM.GenOperation(Outp: TStringList; op: TMashTokenID);
begin
  case op of
    tkGVBP:
     Outp.Add('gvbp');

    tkGP:
     begin
       Outp.Add('new');
       Outp.Add('peek global.temp');
       Outp.Add('movp');
       Outp.Add('push global.temp');
     end;

    tkNotSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('not');
     end;

    tkSubSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('neg');
     end;

    tkInc:
     begin
       Outp.Add('inc');
       Outp.Add('pop');
     end;

    tkDec:
     begin
       Outp.Add('dec');
       Outp.Add('pop');
     end;
  end;
end;


procedure TMashGeneratorSVM.GenOperationLR(Outp: TStringList; op: TMashTokenID);
begin
  case op of
    tkAddSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('add');
     end;


    tkSubSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('sub');
     end;

    tkMulSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('mul');
     end;


    tkDivSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('div');
     end;

    tkIDivSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('idiv');
     end;

    tkModSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('mod');
     end;

    tkAndSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('and');
     end;

    tkOrSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('or');
     end;

    tkXorSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('xor');
     end;

    tkShlSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('shl');
     end;

    tkShrSym:
     begin
       Outp.Add('copy');
       Outp.Add('swp');
       Outp.Add('pop');
       Outp.Add('shr');
     end;

    tkBg:
     Outp.Add('bg');

    tkBEq:
     Outp.Add('be');

    tkEq:
     Outp.Add('eq');

    tkNEq:
     begin
       Outp.Add('eq');
       Outp.Add('not');
     end;

    tkSm:
     begin
       Outp.Add('swp');
       Outp.Add('bg');
     end;

    tkSEq:
     begin
       Outp.Add('swp');
       Outp.Add('be');
     end;

    tkIn:
     begin
       Outp.Add('pushcp system_op_in');
       Outp.Add('jc');
     end;

    tkIs:
     begin
       Outp.Add('pushcp system_op_is');
       Outp.Add('jc');
     end;

    tkRange:
     begin
       Outp.Add('pushcp system_op_range');
       Outp.Add('jc');
     end;

    tkAdd:
     begin
       Outp.Add('add');
       Outp.Add('pop');
     end;

    tkSub:
     begin
       Outp.Add('sub');
       Outp.Add('pop');
     end;

    tkMul:
     begin
       Outp.Add('mul');
       Outp.Add('pop');
     end;

    tkDiv:
     begin
       Outp.Add('div');
       Outp.Add('pop');
     end;

    tkIDiv:
     begin
       Outp.Add('idiv');
       Outp.Add('pop');
     end;

    tkMod:
     begin
       Outp.Add('mod');
       Outp.Add('pop');
     end;

    tkAnd:
     begin
       Outp.Add('and');
       Outp.Add('pop');
     end;

    tkOr:
     begin
       Outp.Add('or');
       Outp.Add('pop');
     end;

    tkXor:
     begin
       Outp.Add('xor');
       Outp.Add('pop');
     end;

    tkShl:
     begin
       Outp.Add('shl');
       Outp.Add('pop');
     end;

    tkShr:
     begin
       Outp.Add('shr');
       Outp.Add('pop');
     end;

    tkMov:
     Outp.Add('mov');

    tkMovBP:
     Outp.Add('mvbp');
  end;
end;


end.

