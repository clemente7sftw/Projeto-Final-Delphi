unit UMetodos;



interface
uses  Winapi.Windows,System.RegularExpressions,
Vcl.Dialogs, CFornecedores, TelaPrincipalN1, Vcl.ExtCtrls, System.Classes, Cadastro, Vcl.Forms, Vcl.Controls;

type
TMetodos = class
  Menu : TPanel;
  private
  public
  class function ValidarEmail(const Email: string):Boolean;
  class procedure Maximixar;


end;

implementation

{ TMetodos }

uses relatorios_servicos;




class procedure TMetodos.Maximixar;
begin
  if Screen.ActiveForm <> nil then
    Screen.ActiveForm.WindowState := wsMaximized;
end;

class function TMetodos.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

end.
