unit AdicionarCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Skia, Data.DB, Vcl.DBCtrls, Vcl.Mask;

type
  TForm11 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    Lblrequired: TLabel;
    PCad: TPanel;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    ComboBox1: TComboBox;
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses UDataModule, CCargos;

procedure TForm11.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  datamodule1.QueryServicos.First;
  while not datamodule1.QueryServicos.Eof do
  begin
    ComboBox1.Items.AddObject(
      datamodule1.QueryServicos.FieldByName('nome').AsString,
      TObject(datamodule1.QueryServicos.FieldByName('id_servico').AsInteger)
    );
    datamodule1.QueryServicos.Next;
  end;
end;

procedure TForm11.FormCreate(Sender: TObject);
begin
Form11.WindowState:=wsMaximized;
Lblrequired.visible:= false;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
  datamodule1.QueryCargos_Servicos.append;
  datamodule1.QueryCargos.close;
  datamodule1.QueryCargos.open;
  datamodule1.QueryServicos.close;
  datamodule1.QueryServicos.open;
  datamodule1.QueryCargos.append;
end;

procedure TForm11.PCadClick(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
  begin

    datamodule1.QueryCargos.Post;
    datamodule1.QueryCargos_Servicos.Post;

    Form14.Show;
    Form11.Close;
  end
  else
    Lblrequired.Visible := true;
end;

end.
