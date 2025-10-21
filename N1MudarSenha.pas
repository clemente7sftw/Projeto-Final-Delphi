unit N1MudarSenha;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Data.DB;

type
  TForm24 = class(TForm)
    Fundo: TPanel;
    ConfSenha: TPanel;
    Label2: TLabel;
    DBEdit1: TDBEdit;
    DataSource1: TDataSource;
    procedure AlterarSenha;
    procedure ConfSenhaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form24: TForm24;

implementation

{$R *.dfm}

uses UDataModule;

{ TForm24 }

procedure TForm24.AlterarSenha;
begin
 try
if dbedit1.text <> '' then
begin
    if not (DataModule1.QueryClientes.State in [dsEdit, dsInsert]) then
    DataModule1.QueryClientes.Edit;
    DataModule1.QueryClientes.FieldByName('senha_clie').AsString := DBEdit1.Text;
    DataModule1.QueryClientes.Post;
end else begin
  DataModule1.QueryClientes.Cancel;
end;
  except
  end;
end;

procedure TForm24.ConfSenhaClick(Sender: TObject);
begin
AlterarSenha;
end;

end.
