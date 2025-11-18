unit n4_mudar_senha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    Fundo: TPanel;
    ConfSenha: TPanel;
    EdNovaSenha: TEdit;
    procedure ConfSenhaClick(Sender: TObject);
    procedure AlterarSenha;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses UMetodos, UDataModule, n4_tela_inicial;

procedure TForm6.AlterarSenha;
var
  NovaSenha, Hash: string;
begin
  NovaSenha := EdNovaSenha.Text;

  if NovaSenha = '' then
  begin
    ShowMessage('Digite a nova senha.');
    Exit;
  end;

  Hash := TMetodos.MD5(NovaSenha);

  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'UPDATE profissionais SET senha = :senha WHERE id_pro = :id';

    ParamByName('senha').AsString := Hash;
    ParamByName('id').AsInteger := DataModule1.id_pro;

    ExecSQL;
  end;

  form6.Close;
end;

procedure TForm6.ConfSenhaClick(Sender: TObject);
begin
AlterarSenha;
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
EdNovaSenha.Text := '';
form30.atualizar_grid;
end;

end.
