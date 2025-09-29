unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Skia;

type
  TForm9 = class(TForm)
    Fundo: TPanel;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Lblrequired: TLabel;
    Image1: TImage;
    PCad: TPanel;
    DataSource2: TDataSource;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure ComboBox1Enter(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses UMetodos, UDataModule;


procedure TForm9.ComboBox1Enter(Sender: TObject);
begin
  ComboBox1.Items.Clear;
  datamodule1.QueryCargos.First;
  while not datamodule1.QueryCargos.Eof do
  begin
    ComboBox1.Items.AddObject(datamodule1.QueryCargos.FieldByName('nome_cargo').AsString,
    TObject(datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger));
    datamodule1.QueryCargos.Next;
  end;
end;

procedure TForm9.ComboBox2Enter(Sender: TObject);
begin
     ComboBox2.Items.Clear;
  datamodule1.QueryCargos.First;
  while not datamodule1.QueryCargos.Eof do
  begin
    ComboBox2.Items.AddObject(datamodule1.QueryCargos.FieldByName('nome_cargo').AsString,
    TObject(datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger));
    datamodule1.QueryCargos.Next;
  end;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  Form9.WindowState:=wsMaximized;
  Lblrequired.Visible:= false;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
    datamodule1.QueryProfissionais.Append;
    datamodule1.QueryCargos.close;
    datamodule1.QueryCargos.open;
    datamodule1.QueryPC.append;

end;

procedure TForm9.PCadClick(Sender: TObject);
var
  id_cargo, id_pro: Integer;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (combobox1.ItemIndex >= 0) then
  begin
    id_cargo := Integer(ComboBox1.Items.Objects[ComboBox1.ItemIndex]);
    if datamodule1.QueryProfissionais.State in [dsInsert, dsEdit] then
    datamodule1.QueryProfissionais.Post;
    datamodule1.QueryProfissionais.Refresh;
    id_pro := datamodule1.QueryProfissionais.FieldByName('id_pro').AsInteger;
    datamodule1.QueryPC.Append;
    datamodule1.QueryPC.FieldByName('id_cargo').AsInteger := id_cargo;
    datamodule1.QueryPC.FieldByName('id_pro').AsInteger := id_pro;
    datamodule1.QueryPC.Post;
    form9.close;
    form8.show;
    Lblrequired.Visible := False;
  end
  else
    Lblrequired.Visible := True;

end;

end.
