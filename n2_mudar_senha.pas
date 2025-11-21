unit n2_mudar_senha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TForm22 = class(TForm)
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
  Form22: TForm22;

implementation

{$R *.dfm}

uses UDataModule, UMetodos;

procedure TForm22.AlterarSenha;
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
      'UPDATE administradores SET senha_adm = :senha WHERE id_adm = :id';

    ParamByName('senha').AsString := Hash;
    ParamByName('id').AsInteger := DataModule1.id_adm;

    ExecSQL;
  end;

  form22.Close;
end;


procedure TForm22.ConfSenhaClick(Sender: TObject);
begin
AlterarSenha;
end;

procedure TForm22.FormClose(Sender: TObject; var Action: TCloseAction);
begin
EdNovaSenha.Text := '';
end;

end.
