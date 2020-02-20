unit u_ast_constructions_blocks;

{$INTERFACES CORBA}
{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_tokens,
  u_ast_blocks,
  u_ast_expression_blocks;

type
  TMashASTB_Import = class(TMashASTBlock)
    public
      method_name: string;
      lib_name: string;
      native_name: string;
      call_counter: cardinal;

      constructor Create(_method_name, _lib_name, _native_name: string);
  end;

  TMashASTB_RegAPI = class(TMashASTBlock)
    public
      method_name: string;
      number: string;

      constructor Create(_method_name, _number: string);
  end;

  TMashASTB_Uses = class(TMashASTBlock)
    public
      Expr: TList;

      constructor Create;
      destructor Destroy; override;
  end;

  TMashASTB_Inline = class(TMashASTBlock)
    public
      asm_string: string;

      constructor Create(_asm_string: string);
  end;

  TMashASTB_Const = class(TMashASTBlock)
    public
      const_name: string;
      const_value: TMashToken;
      isStream: boolean;

      constructor Create(_name: string; _value: TMashToken; _isStream: boolean);
  end;

  TMashASTB_Method = class(TMashASTBlockWithNodes)
    public
      is_function: boolean;
      method_name: string;

      is_class_method: boolean;
      class_name: string;

      params: TList;
      local_vars: TStringList;

      line: cardinal;
      fp: PString;

      call_counter: word;
      internal_calls: TList; // of TMashASTB_Method
      external_calls: TList; // of TMashASTB_Import
      allocations:    TList; // of TMashASTB_Class

      constructor Create(_is_function: boolean; _method_name: string;
                         _is_class_method: boolean; _class_name: string;
                         _line: cardinal; var _fp: string);
      destructor Destroy; override;
  end;

  TMashASTB_Param = class(TMashASTBlock)
    public
      is_enumerable: boolean;
      param: TMashToken;

      constructor Create(_param: TMashToken; _is_enumerable: boolean);
  end;

  TMashASTB_If = class(TMashASTBlockWithNodes)
    public
      Expr: TMashASTB_Expression;
      hasElse: boolean;
      ElseNodes: TList;

      constructor Create(_Expr: TMashASTB_Expression);
      destructor Destroy; override;
  end;

  TMashASTB_ForEach = class(TMashASTBlockWithNodes)
    public
      forVar: string;
      isBack: boolean;
      Expr: TMashASTB_Expression;

      constructor Create(_forVar: string; _isBack: boolean;
                         _Expr: TMashASTB_Expression);
  end;

  TMashASTB_While = class(TMashASTBlockWithNodes)
    public
      Expr: TMashASTB_Expression;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Whilst = class(TMashASTBlockWithNodes)
    public
      Expr: TMashASTB_Expression;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Return = class(TMashASTBlock)
    public
      Expr: TMashASTB_Expression;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Switch = class(TMashASTBlockWithNodes)
    public
      Expr: TMashASTB_Expression;
      hasElse: boolean;
      ElseCase: TMashASTBlock;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Case = class(TMashASTBlockWithNodes)
    public
      Expr: TMashASTB_Expression;
      isElse: boolean;

      constructor Create(_Expr: TMashASTB_Expression; _isElse: boolean);
  end;

  TMashASTB_Launch = class(TMashASTBlockWithNodes)
    public
      constructor Create;
  end;

  TMashASTB_Async = class(TMashASTBlockWithNodes)
    public
      forVar: string;

      constructor Create(_forVar: string);
  end;

  TMashASTB_Wait = class(TMashASTBlock)
    public
      Expr: TMashASTB_Expression;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Break = class(TMashASTBlock)
    public
      constructor Create;
  end;

  TMashASTB_Continue = class(TMashASTBlock)
    public
      constructor Create;
  end;

  TMashASTB_Class = class(TMashASTBlock)
    public
      class_name: string;
      class_vars: TStringList;
      class_methods: TList;
      class_parents: TStringList;

      constructor Create(_class_name: string);
      destructor Destroy; override;
  end;

  TMashClassMethodReference = class
    public
      method_name: string;
      reference: TMashASTB_Method;

      constructor Create(_method_name: string; _reference: TMashASTB_Method);
  end;

  TMashASTB_ClassField = class(TMashASTBlock)
    public
      names: TStringList;

      constructor Create;
      destructor Destroy; override;
  end;

  TMashASTB_Public = class(TMashASTBlock)
    public
      constructor Create;
  end;

  TMashASTB_Private = class(TMashASTBlock)
    public
      constructor Create;
  end;

  TMashASTB_Protected = class(TMashASTBlock)
    public
      constructor Create;
  end;

  TMashASTB_Try = class(TMashASTBlockWithNodes)
    public
      hasCatch: boolean;
      NodesCatch: TList;
      forVar: string;

      constructor Create;
      destructor Destroy; override;
  end;

  TMashASTB_Raise = class(TMashASTBlock)
    public
      Expr: TMashASTB_Expression;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Safe = class(TMashASTBlock)
    public
      Expr: TMashASTB_Expression;

      constructor Create(_Expr: TMashASTB_Expression);
  end;

  TMashASTB_Enum = class(TMashASTBlockWithNodes)
    public
      Name: string;

      constructor Create(_Name: string);
  end;

  TMashASTB_EnumItem = class(TMashASTBlock)
    public
      Name: string;
      hasDefValue: boolean;
      DefValue: TMashToken;

      constructor Create(_Name: string);
  end;

implementation

constructor TMashASTB_Import.Create(_method_name, _lib_name, _native_name: string);
begin
  inherited Create(btImport);
  self.method_name := _method_name;
  self.lib_name := _lib_name;
  self.native_name := _native_name;
  self.call_counter := 0;
end;

constructor TMashASTB_RegAPI.Create(_method_name, _number: string);
begin
  inherited Create(btRegAPI);
  self.method_name := _method_name;
  self.number := _number;
end;

constructor TMashASTB_Uses.Create;
begin
  inherited Create(btUses);
  self.Expr := TList.Create;
end;

destructor TMashASTB_Uses.Destroy;
begin
  FreeAndNil(self.Expr);
  inherited;
end;

constructor TMashASTB_Inline.Create(_asm_string: string);
begin
  inherited Create(btInline);
  self.asm_string := _asm_string;
end;

constructor TMashASTB_Const.Create(_name: string; _value: TMashToken; _isStream: boolean);
begin
  inherited Create(btConst);
  self.const_name := _name;
  self.const_value := _value;
  self.isStream := _isStream;
end;

constructor TMashASTB_Method.Create(_is_function: boolean;
                                    _method_name: string;
                                    _is_class_method: boolean;
                                    _class_name: string;
                                    _line: cardinal; var _fp: string);
begin
  inherited Create(btMethod);
  self.is_function := _is_function;
  self.method_name := _method_name;
  self.is_class_method := _is_class_method;
  self.class_name := _class_name;
  self.line := _line;
  self.fp := @_fp;

  self.params := TList.Create;

  self.call_counter := 0;
  self.internal_calls := TList.Create;
  self.external_calls := TList.Create;
  self.allocations := TList.Create;

  self.local_vars := TStringList.Create;
end;

destructor TMashASTB_Method.Destroy;
begin
  FreeAndNil(self.params);
  FreeAndNil(self.internal_calls);
  FreeAndNil(self.external_calls);
  FreeAndNil(self.allocations);
  FreeAndNil(self.local_vars);
  inherited;
end;

constructor TMashASTB_Param.Create(_param: TMashToken; _is_enumerable: boolean);
begin
  inherited Create(btParam);
  self.param := _param;
  self.is_enumerable := _is_enumerable;
end;

constructor TMashASTB_If.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btIf);
  self.Expr := _Expr;
  self.hasElse := false;
  self.ElseNodes := TList.Create;
end;

destructor TMashASTB_If.Destroy;
begin
  FreeAndNil(self.ElseNodes);
  inherited;
end;


constructor TMashASTB_ForEach.Create(_forVar: string; _isBack: boolean;
                                     _Expr: TMashASTB_Expression);
begin
  inherited Create(btForEach);
  self.forVar := _forVar;
  self.isBack := _isBack;
  self.Expr := _Expr;
end;


constructor TMashASTB_While.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btWhile);
  self.Expr := _Expr;
end;


constructor TMashASTB_Whilst.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btWhilst);
  self.Expr := _Expr;
end;


constructor TMashASTB_Return.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btReturn);
  self.Expr := _Expr;
end;


constructor TMashASTB_Switch.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btSwitch);
  self.Expr := _Expr;
  self.hasElse := false;
  self.ElseCase := nil;
end;


constructor TMashASTB_Case.Create(_Expr: TMashASTB_Expression; _isElse: boolean);
begin
  inherited Create(btCase);
  self.Expr := _Expr;
  self.isElse := _isElse;
end;


constructor TMashASTB_Launch.Create;
begin
  inherited Create(btLaunch);
end;


constructor TMashASTB_Async.Create(_forVar: string);
begin
  inherited Create(btAsync);
  self.forVar := _forVar;
end;


constructor TMashASTB_Wait.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btWait);
  self.Expr := _Expr;
end;


constructor TMashASTB_Break.Create;
begin
  inherited Create(btBreak);
end;


constructor TMashASTB_Continue.Create;
begin
  inherited Create(btContinue);
end;


constructor TMashASTB_Class.Create(_class_name: string);
begin
  inherited Create(btClass);
  self.class_name := _class_name;
  self.class_vars := TStringList.Create;
  self.class_methods := TList.Create;
  self.class_parents := TStringList.Create;
end;

destructor TMashASTB_Class.Destroy;
begin
  FreeAndNil(self.class_vars);
  FreeAndNil(self.class_parents);

  while self.class_methods.count > 0 do
   begin
     TMashClassMethodReference(self.class_methods[0]).Free;
     self.class_methods.Delete(0);
   end;

  FreeAndNil(self.class_methods);
  inherited;
end;


constructor TMashClassMethodReference.Create(_method_name: string; _reference: TMashASTB_Method);
begin
  self.method_name := _method_name;
  self.reference := _reference;
end;

constructor TMashASTB_ClassField.Create;
begin
  inherited Create(btClassField);
  self.names := TStringList.Create;
end;

destructor TMashASTB_ClassField.Destroy;
begin
  FreeAndNil(self.names);
  inherited;
end;

constructor TMashASTB_Public.Create;
begin
  inherited Create(btPublic);
end;

constructor TMashASTB_Private.Create;
begin
  inherited Create(btPrivate);
end;


constructor TMashASTB_Protected.Create;
begin
  inherited Create(btProtected);
end;


constructor TMashASTB_Try.Create;
begin
  inherited Create(btTry);
  self.hasCatch := false;
  self.NodesCatch := TList.Create;
  self.forVar := '';
end;

destructor TMashASTB_Try.Destroy;
begin
  FreeAndNil(self.NodesCatch);
  inherited;
end;


constructor TMashASTB_Raise.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btRaise);
  self.Expr := _Expr;
end;


constructor TMashASTB_Safe.Create(_Expr: TMashASTB_Expression);
begin
  inherited Create(btSafe);
  self.Expr := _Expr;
end;



constructor TMashASTB_Enum.Create(_Name: string);
begin
  inherited Create(btEnum);
  self.Name := _Name;
end;


constructor TMashASTB_EnumItem.Create(_Name: string);
begin
  inherited Create(btEnumItem);
  self.Name := _Name;
  self.hasDefValue := false;
  self.DefValue := nil;
end;


end.
