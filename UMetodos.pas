unit UMetodos;



interface
uses  Winapi.Windows,Vcl.Dialogs, CFornecedores, TelaPrincipalN1, Vcl.ExtCtrls, System.Classes, Cadastro, Vcl.Forms, Vcl.Controls;

type
TMetodos = class
  Menu : TPanel;
  private
  public
  ///
  class procedure TelaPrincipal;
  class procedure MensagemCadSucesso;
  procedure FecharForm;

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

end.
