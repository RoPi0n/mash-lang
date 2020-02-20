unit u_ast_blocks;

{$INTERFACES CORBA}
{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TMashASTBlockType = (
    btExpression,
    btImport, btRegAPI, btUses, btInline, btConst,
    btMethod, btParam,
    btIf, btForEach, btWhile, btWhilst,
    btReturn,
    btSwitch, btCase,
    btLaunch, btAsync, btWait,
    btBreak, btContinue,
    btClass, btClassField, btPublic, btProtected, btPrivate,
    btTry, btRaise,
    btSafe,
    btEnum, btEnumItem,

    btEOperation,
    btEOperationLR,

    btPSimpleObject,
    btPReference,
    btPIndexedObject,
    btPCall,
    btPEnum,
    btPOperator
  );

  IMashASTBlock = interface
    function GetType: TMashASTBlockType;
    procedure Free;
  end;

  IMashASTBlockWithNodes = interface(IMashASTBlock)
    function GetNodes: TList;
  end;

  TMashASTBlock = class(IMashASTBlock)
    public
      BlockType: TMashASTBlockType;

      constructor Create(_BlockType: TMashASTBlockType);

      function GetType: TMashASTBlockType;
      procedure Free;
  end;

  TMashASTBlockWithNodes = class(TMashASTBlock, IMashASTBlockWithNodes)
    public
      Nodes: TList;

      function GetNodes: TList;

      constructor Create(_BlockType: TMashASTBlockType);
      destructor Destroy; override;
  end;

var
  MashASTBlocks: TList;

procedure CleanUpASTBlocks;

implementation

// AST Block Interface

constructor TMashASTBlock.Create(_BlockType: TMashASTBlockType);
begin
  inherited Create;
  self.BlockType := _BlockType;
  MashASTBlocks.add(self);
end;

function TMashASTBlock.GetType: TMashASTBlockType;
begin
  Result := self.BlockType;
end;

procedure TMashASTBlock.Free;
begin
  if self <> nil then
   self.Destroy;
end;

constructor TMashASTBlockWithNodes.Create(_BlockType: TMashASTBlockType);
begin
  inherited Create(_BlockType);
  self.Nodes := TList.Create;
end;

destructor TMashASTBlockWithNodes.Destroy;
begin
  FreeAndNil(self.Nodes);
  inherited;
end;

function TMashASTBlockWithNodes.GetNodes: TList;
begin
  Result := self.Nodes;
end;

// Some methods

procedure CleanUpASTBlocks;
begin
  while MashASTBlocks.count > 0 do
   begin
     TMashASTBlock(MashASTBlocks[0]).Free;
     MashASTBlocks.Delete(0);
   end;
end;

initialization
  MashASTBlocks := TList.Create;

finalization
  FreeAndNil(MashASTBlocks);

end.

