unit u_ast_expression_blocks;

{$mode objfpc}{$H+}

interface

uses
  Classes,
  SysUtils,
  u_ast_blocks,
  u_tokens;

type
  TMashASTB_Expression = class(TMashASTBlock)
    public
      tokens: TList;
      ast: TObject; //TMashASTExpression

      constructor Create;
      destructor Destroy; override;
  end;

  TMashASTP_Operator = class(TMashASTBlock)
    public
      Op: TMashToken;

      constructor Create(_Op: TMashToken);
  end;

  TMashASTE_Operation = class(TMashASTBlock)
    public
      Op: TMashASTP_Operator;
      A: TMashASTBlock;

      constructor Create(_Op: TMashASTP_Operator; _A: TMashASTBlock);
  end;

  TMashASTE_OperationLR = class(TMashASTBlock)
    public
      Op: TMashASTP_Operator;
      L: TMashASTBlock;
      R: TMashASTBlock;

      constructor Create(_Op: TMashASTP_Operator; _L, _R: TMashASTBlock);
  end;

  TMashASTP_SimpleObject = class(TMashASTBlock)
    public
      Obj: TMashToken;

      constructor Create(_Obj: TMashToken);
  end;

  TMashASTP_Reference = class(TMashASTBlock)
    public
      ObjPath: TList;

      constructor Create; 
      destructor Destroy; override;
  end;

  TMashASTP_IndexedObject = class(TMashASTBlock)
    public
      Obj: TMashASTBlock;
      Indexes: TList;

      constructor Create(_Obj: TMashASTBlock);
      destructor Destroy; override;
  end;

  TMashASTP_Enum = class(TMashASTBlock)
    public
      Objects: TList;

      constructor Create;
      destructor Destroy; override;
  end;

  TMashASTP_Call = class(TMashASTBlock)
    public
      Obj: TMashASTBlock;
      Args: TMashASTP_Enum;

      constructor Create(_Obj: TMashASTBlock; _Args: TMashASTP_Enum);
  end;

implementation

uses
  u_ast_expression;

constructor TMashASTB_Expression.Create;
begin
  inherited Create(btExpression);
  self.tokens := TList.Create;
  self.ast := TMashASTExpression.Create(self.tokens);
end;

destructor TMashASTB_Expression.Destroy;
begin
  FreeAndNil(self.tokens);
  FreeAndNil(self.ast);
  inherited;
end;

constructor TMashASTE_Operation.Create(_Op: TMashASTP_Operator; _A: TMashASTBlock);
begin
  inherited Create(btEOperation);
  self.Op := _Op;
  self.A := _A;
end;

constructor TMashASTE_OperationLR.Create(_Op: TMashASTP_Operator; _L, _R: TMashASTBlock);
begin
  inherited Create(btEOperationLR);
  self.Op := _Op;
  self.L := _L;
  self.R := _R;
end;

constructor TMashASTP_SimpleObject.Create(_Obj: TMashToken);
begin
  inherited Create(btPSimpleObject);
  self.Obj := _Obj;
end;

constructor TMashASTP_Reference.Create;
begin
  inherited Create(btPReference);
  self.ObjPath := TList.Create;
end;

destructor TMashASTP_Reference.Destroy;
begin
  FreeAndNil(self.ObjPath);
  inherited;
end;


constructor TMashASTP_IndexedObject.Create(_Obj: TMashASTBlock);
begin
  inherited Create(btPIndexedObject);
  self.Obj := _Obj;
  self.Indexes := TList.Create;
end;

destructor TMashASTP_IndexedObject.Destroy;
begin
  FreeAndNil(self.Indexes);
  inherited;
end;

constructor TMashASTP_Call.Create(_Obj: TMashASTBlock; _Args: TMashASTP_Enum);
begin
  inherited Create(btPCall);
  self.Obj := _Obj;
  self.Args := _Args;
end;

constructor TMashASTP_Enum.Create;
begin
  inherited Create(btPEnum);
  self.Objects := TList.Create;
end;

destructor TMashASTP_Enum.Destroy;
begin
  FreeAndNil(self.Objects);
  inherited;
end;


constructor TMashASTP_Operator.Create(_Op: TMashToken);
begin
  inherited Create(btPOperator);
  self.Op := _Op;
end;

end.

