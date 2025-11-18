unit N1MudarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB;

type
  TForm24 = class(TForm)
    DataSource1: TDataSource;
    Fundo: TPanel;
    ConfSenha: TPanel;
    EdNovaSenha: TEdit;
    procedure AlterarSenha;
    procedure ConfSenhaClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}

uses UDataModule, UMetodos, TelaPrincipalN1;

{ TForm24 }

procedure TForm24.AlterarSenha;
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
      'UPDATE clientes SET senha_clie = :senha WHERE id_clie = :id';

    ParamByName('senha').AsString := Hash;
    ParamByName('id').AsInteger := DataModule1.id_clie;

    ExecSQL;
  end;

  form24.Close;
end;



procedure TForm24.ConfSenhaClick(Sender: TObject);
begin
  AlterarSenha;
end;

procedure TForm24.FormClose(Sender: TObject; var Action: TCloseAction);
begin
EdNovaSenha.Text := '';
form3.atualizar_grid;
end;

end.

end.
