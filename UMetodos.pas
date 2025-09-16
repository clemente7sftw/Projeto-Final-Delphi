unit UMetodos;



interface
uses  Winapi.Windows,System.RegularExpressions,Vcl.Dialogs, CFornecedores, TelaPrincipalN1, Vcl.ExtCtrls, System.Classes, Cadastro, Vcl.Forms, Vcl.Controls;

type
TMetodos = class
  Menu : TPanel;
  private
  public
  procedure FecharForm;
  class procedure TelaPrincipal;
  class procedure MensagemCadSucesso;
  class function ValidarEmail(const Email: string):Boolean;


end;

implementation

{ TMetodos }



procedure TMetodos.FecharForm;
begin
 if Screen.ActiveForm <> nil then
    Screen.ActiveForm.Close;
end;

class procedure TMetodos.MensagemCadSucesso;
begin
  ShowMessage('Dados Cadastrados com Sucesso');
end;

class procedure TMetodos.TelaPrincipal;
begin
Form3.show;
end;

class function TMetodos.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

end.
