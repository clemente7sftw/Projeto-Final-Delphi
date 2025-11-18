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

class function TMetodos.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

end.
