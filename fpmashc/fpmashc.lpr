program fpmashc;

{$mode objfpc}{$H+}

uses
  SysUtils,
  u_compiler;

var
  cmp: TMashCompiler;
  tm:  QWord;
begin
  writeln('Mash compiler v1.3');
  writeln('Author: RoPi0n (Pavel Chernov), (c) from 2018.');
  writeln('GitHub: github.com/RoPi0n/mash-lang');

  if ParamCount > 1 then
    try
      tm := GetTickCount64;
      cmp := TMashCompiler.Create(ParamStr(1), ParamStr(2));
      cmp.Compile();

      writeln('Success.');
      writeln('Time elapsed: ', Format('%.3f', [(GetTickCount64() - tm) / 1000]), ' sec.');
    except
      on E: Exception do
        writeln('[Error]: ', E.Message);
    end
  else
    writeln('Using: mashc <source> <dest> [args]');
end.

