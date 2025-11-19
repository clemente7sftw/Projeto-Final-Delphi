unit UMetodos;



interface
uses  Winapi.Windows,System.RegularExpressions,
Vcl.Dialogs, CFornecedores, TelaPrincipalN1, Vcl.ExtCtrls, System.Classes, Cadastro, Vcl.Forms, Vcl.Controls, IdHashMessageDigest, SysUtils;

type
TMetodos = class
  Menu : TPanel;
  private
  public
  class function ValidarEmail(const Email: string):Boolean;
  class procedure Maximixar;
  class function MD5(const Value: string) :string;
  class function ValidarCPF(CPF: string): Boolean;
  class function ValidarTelefone(Tel: string): Boolean;

end;

implementation

{ TMetodos }

uses relatorios_servicos;




class procedure TMetodos.Maximixar;
begin
  if Screen.ActiveForm <> nil then
    Screen.ActiveForm.WindowState := wsMaximized;
end;

class function TMetodos.MD5(const Value: string): string;
var xMD5 : TidHashMessageDigest5;
begin
 xMD5 := TidHashMessageDigest5.Create;
 try
   result := LowerCase(xMD5.HashStringAsHex(Value))
 finally
   xMD5.free;
 end;
end;

class function TMetodos.ValidarCPF(CPF: string): Boolean;
var
  I, Soma, Resto, Digito1, Digito2: Integer;
  Num: string;
begin
  Num := StringReplace(CPF, '.', '', [rfReplaceAll]);
  Num := StringReplace(Num, '-', '', [rfReplaceAll]);

  if Length(Num) <> 11 then
    Exit(False);

  if Num = StringOfChar(Num[1], 11) then
    Exit(False);

  Soma := 0;
  for I := 1 to 9 do
    Soma := Soma + StrToInt(Num[I]) * (11 - I);

  Resto := Soma mod 11;
  if Resto < 2 then
    Digito1 := 0
  else
    Digito1 := 11 - Resto;

  Soma := 0;
  for I := 1 to 10 do
    Soma := Soma + StrToInt(Num[I]) * (12 - I);

  Resto := Soma mod 11;
  if Resto < 2 then
    Digito2 := 0
  else
    Digito2 := 11 - Resto;

  Result := (IntToStr(Digito1) = Num[10]) and
            (IntToStr(Digito2) = Num[11]);
end;

class function TMetodos.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

class function TMetodos.ValidarTelefone(Tel: string): Boolean;
var
  Num: string;
begin
  Num := StringReplace(Tel, '(', '', [rfReplaceAll]);
  Num := StringReplace(Num, ')', '', [rfReplaceAll]);
  Num := StringReplace(Num, '-', '', [rfReplaceAll]);
  Num := StringReplace(Num, ' ', '', [rfReplaceAll]);

  if not (Num.ToInteger > 0) then
    Exit(False);

  if (Length(Num) <> 10) and (Length(Num) <> 11) then
    Exit(False);

  if (Length(Num) = 11) and (Num[3] <> '9') then
    Exit(False);

  Result := True;
end;

end.
