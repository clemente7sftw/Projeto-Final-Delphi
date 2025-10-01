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
    ComboBox1: TComboBox;
    DataSource3: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    CheckListBox1: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
//    procedure ComboBox1Enter(Sender: TObject);
    procedure PCadClick(Sender: TObject);
//    procedure PopularCombo;
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


//procedure TForm9.PopularCombo;
//begin
//  ComboBox1.Items.Clear;
//  datamodule1.QueryCargos.First;
//  while not datamodule1.QueryCargos.Eof do
//  begin
//    ComboBox1.Items.AddObject(datamodule1.QueryCargos.FieldByName('nome_cargo').AsString,
//    TObject(datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger));
//    datamodule1.QueryCargos.Next;
//  end;
//end;
//


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
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (CheckListBox1.ItemIndex >= 0) then
  begin
    id_cargo := Integer(CheckListBox1.Items.Objects[CheckListBox1.ItemIndex]);
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



//procedure TForm9.ComboBox1Enter(Sender: TObject);
//begin
//  PopularCombo;
//end;

procedure TForm9.PCadClick(Sender: TObject);
begin
   Cadastrar;
end;


end.
