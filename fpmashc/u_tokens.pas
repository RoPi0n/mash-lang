unit u_tokens;

{$mode objfpc}{$H+}

interface

type
  TMashTokenType = (
    ttToken, ttDigit, ttString, ttWord, ttEndOfLine, ttNull
  );

  TMashTokenID = (
    tkProc, tkFunc,
    tkOBr, tkCBr, tkORBr, tkCRBr, tkSm, tkBg,
    tkEq, tkBEq, tkSEq, tkInc, tkDec,
    tkAdd, tkSub, tkMul, tkDiv, tkIDiv, tkMod,
    tkAnd, tkOr, tkXor, tkSHL, tkSHR, tkNEq,

    tkAssign, tkMov, tkMovBP, tkGVBP, tkGP,
    tkCMSep, tkBegin, tkComma, tkDot, tkRange, tkIs,

    tkAddSym, tkSubSym, tkMulSym, tkDivSym, tkIDivSym, tkModSym,
    tkAndSym, tkOrSym, tkXorSym, tkNotSym, tkSHLSym, tkSHRSym,

    tkIf, tkElse, tkSwitch, tkCase, tkDefault,
    tkFor, tkIn, tkBack, tkBreak, tkContinue,
    tkWhile, tkWhilst,
    tkClass, tkVar, tkThis, tkByPtr, tkNew, tkInit,
    tkPublic, tkProtected, tkPrivate,
    tkTry, tkCatch, tkRaise,
    tkLaunch, tkAsync, tkWait,
    tkConst, tkResource, tkEnum,
    tkImport, tkAPI, tkUses,
    tkInline,
    tkEnd, tkReturn,
    tkNull, tkSpecial
  );

const
  MashTokens: array[tkProc..tkReturn] of string = (
    'proc', 'func',

    '(', ')', '[', ']', '<', '>',

    '==', '>=', '<=', '++', '--',
    '+=', '-=', '*=', '/=', '\=', '%=',
    '&=', '|=', '^=', '<<=', '>>=', '<>',

    '?=', '=', '@=', '?', '@',
    '::', ':', ',', '.', '..', 'is',

    '+', '-', '*', '/', '\', '%', '&', '|', '^', '~', '<<', '>>',

    'if', 'else',
    'switch', 'case', 'default',
    'for', 'in', 'back', 'break', 'continue',
    'while', 'whilst',
    'class', 'var', '$', '->', 'new', 'init', 'public', 'protected', 'private',
    'try', 'catch', 'raise',
    'launch', 'async', 'wait',
    'const', 'resource', 'enum',
    'import', 'api', 'uses',
    'inline',
    'end', 'return'
  );

  MashExprTokens: set of TMashTokenID = [
    tkAddSym, tkSubSym, tkMulSym, tkDivSym, tkIDivSym, tkModSym,
    tkAndSym, tkOrSym, tkXorSym, tkNotSym, tkSHLSym, tkSHRSym,
    tkAssign, tkMov, tkMovBP,
    tkGVBP, tkGP, tkEq, tkBEq, tkSEq, tkInc, tkDec, tkAdd, tkSub,
    tkMul, tkDiv, tkIDiv, tkMod, tkAnd, tkOr, tkXor, tkSHL, tkSHR, tkNEq,
    tkOBr, tkCBr, tkORBr, tkCRBr, tkSm, tkBg,
    tkByPtr, tkThis, tkSpecial, tkIn, tkRange, tkIs, tkComma, tkDot, tkNew
  ];

  MashParamsTokens: set of TMashTokenID = [tkORBr, tkCRBr];

  MashOperatorsTokens: set of TMashTokenID = [
    tkAddSym, tkSubSym, tkMulSym, tkDivSym, tkIDivSym, tkModSym,
    tkAndSym, tkOrSym, tkXorSym, tkSHLSym, tkSHRSym,
    tkGVBP, tkAssign, tkMovBP, tkDot,

    tkSm, tkBg, tkEq, tkBEq, tkSEq,
    tkAdd, tkSub, tkMul, tkDiv, tkIDiv, tkMod,
    tkAnd, tkOr, tkXor, tkSHL, tkSHR, tkNEq,
    tkIn, tkRange, tkIs
  ];

  MashOperationToken: set of TMashTokenID = [
    tkInc, tkDec, tkGVBP, tkGP,
    tkNotSym, tkSubSym, tkNew, tkDot
  ];

  MashOperationsPriority: array[0..6] of set of TMashTokenID = (
    [tkAssign, tkMov, tkMovBP, tkAdd, tkSub, tkMul,
     tkDiv, tkIDiv, tkMod, tkAnd, tkOr, tkXor, tkSHL, tkSHR],

    [tkSm, tkBg, tkEq, tkBEq, tkSEq, tkNEq],
    [tkAndSym, tkOrSym, tkXorSym, tkIn, tkSHLSym, tkSHRSym],
    [tkRange, tkIs],
    [tkAddSym, tkSubSym],
    [tkMulSym, tkDivSym, tkIDivSym, tkModSym],
    [tkInc, tkDec, tkGVBP, tkGP,
     tkNotSym, tkSubSym, tkNew, tkDot]
  );

  MashOperationLeft: set of TMashTokenID = [
    tkGVBP, tkGP, tkNotSym, tkSubSym, tkNew
  ];

  MashOperationRight: set of TMashTokenID = [tkInc, tkDec];

type
  TMashToken = class
    public
      value: string;
      info:  TMashTokenType;
      short: TMashTokenID;
      line:  Cardinal;
      filep: PString;

      constructor Create(_value: string;
                         _info: TMashTokenType;
                         _line: Cardinal;
                         var _filep: string);
  end;

implementation

constructor TMashToken.Create(_value: string;
                              _info: TMashTokenType;
                              _line: Cardinal;
                              var _filep: string);
var
  i, l: byte;
begin
  self.value :=  _value;
  self.info  :=  _info;
  self.line  :=  _line;
  self.filep := @_filep;

  self.short := tkNull;
  if _value = 'this' then
    self.short := tkSpecial
  else
    if _info = ttToken then
     begin
       i := 0;
       l := Length(MashTokens);
       while i < l do
        begin
          if MashTokens[TMashTokenID(i)] = _value then
           begin
             self.short := TMashTokenID(i);
             break;
           end;
          inc(i);
        end;
     end;
end;

end.

