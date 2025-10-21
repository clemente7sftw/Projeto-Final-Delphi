unit CAdministrador;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Mask, Vcl.DBCtrls;

type
  TForm22 = class(TForm)
    Fundo: TPanel;
    Label1: TLabel;
    ConfSenha: TPanel;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure ConfSenhaClick(Sender: TObject);
    procedure AlterarSenha;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form22: TForm22;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm22.AlterarSenha;
begin
 try
if dbedit1.text <> '' then
begin
    if not (DataModule1.QueryAdm.State in [dsEdit, dsInsert]) then
    DataModule1.QueryAdm.Edit;
    DataModule1.QueryAdm.FieldByName('senha_adm').AsString := DBEdit1.Text;
    DataModule1.QueryAdm.Post;
end else begin
  DataModule1.QueryAdm.Cancel;
end;
  except
  end;
end;

procedure TForm22.ConfSenhaClick(Sender: TObject);
begin
AlterarSenha;
end;

procedure TForm22.FormShow(Sender: TObject);
begin
datamodule1.queryadm.close;
datamodule1.queryadm.open;
 WindowState := wsMaximized;

end;

end.
