unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Skia, Vcl.CheckLst;

type
  TForm9 = class(TForm)
    Fundo: TPanel;
    DataSource1: TDataSource;
    Lblrequired: TLabel;
    Image1: TImage;
    PCad: TPanel;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    CheckListBox1: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure Cadastrar;
    procedure PreencherListbox;

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
var
  id_cargo, id_pro: Integer;

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
    datamodule1.QueryRPC.close;
    datamodule1.QueryRPC.open;
    PreencherListbox;
end;


procedure TForm9.PreencherListbox;
begin
if not datamodule1.QueryCargos.IsEmpty then
begin
  CheckListBox1.Items.Clear;

  datamodule1.QueryCargos.First;
  while not datamodule1.QueryCargos.Eof do
  begin
    CheckListBox1.Items.AddObject(
      datamodule1.QueryCargos.FieldByName('nome_cargo').AsString,
      TObject(datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger)
    );
    datamodule1.QueryCargos.Next;
  end;
end;
end;


procedure TForm9.Cadastrar;
var
  i: Integer;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    if datamodule1.QueryProfissionais.State in [dsInsert, dsEdit] then
      datamodule1.QueryProfissionais.Post;

    datamodule1.QueryProfissionais.Refresh;
    id_pro := datamodule1.QueryProfissionais.FieldByName('id_pro').AsInteger;

    for i := 0 to CheckListBox1.Count - 1 do
    begin
      if CheckListBox1.Checked[i] then
      begin
        id_cargo := Integer(CheckListBox1.Items.Objects[i]);
        datamodule1.QueryPC.Append;
        datamodule1.QueryPC.FieldByName('id_cargo').AsInteger := id_cargo;
        datamodule1.QueryPC.FieldByName('id_pro').AsInteger := id_pro;
        datamodule1.QueryPC.Post;
      end;
    end;

    Form9.Close;
    Form8.Show;
    Lblrequired.Visible := False;
  end
  else
    Lblrequired.Visible := True;
end;


procedure TForm9.PCadClick(Sender: TObject);
begin
   Cadastrar;
end;


end.
