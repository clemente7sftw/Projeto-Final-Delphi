unit AdicionarCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Skia, Data.DB, Vcl.DBCtrls, Vcl.Mask, Vcl.CheckLst;

type
  TForm11 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    PCad: TPanel;
    Lblrequired: TLabel;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    CheckListBox1: TCheckListBox;
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreencherListbox;

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


procedure TForm11.FormCreate(Sender: TObject);
begin
Form11.WindowState:=wsMaximized;
Lblrequired.visible:= false;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
    DataModule1.QueryCargos.Close;
    DataModule1.QueryCargos.Open;
    datamodule1.QueryCargos.Append;
    datamodule1.QueryServicos.close;
    datamodule1.QueryServicos.open;
    datamodule1.QueryCS.close;
    datamodule1.QueryCS.open;
    datamodule1.QueryRCS.close;
    datamodule1.QueryRCS.open;
    PreencherListbox;

end;

procedure TForm11.PCadClick(Sender: TObject);
var id_ser, id_cargo, i: integer;
begin
  if DBEdit1.Text <> '' then
  begin
    if datamodule1.QueryCargos.state in [dsinsert, dsedit] then
    datamodule1.querycargos.post;
    datamodule1.querycargos.Refresh;
    id_cargo := datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger;
    for i := 0 to checklistbox1.count -1 do
    begin
    if checklistbox1.Checked[i] then
      begin
        id_ser := Integer(CheckListBox1.Items.Objects[i]);
        if datamodule1.QueryCargos.State in [dsInsert, dsEdit] then
        id_ser := Integer(CheckListBox1.Items.Objects[i]);
        datamodule1.QueryCS.Append;
        datamodule1.QueryCS.FieldByName('id_servico').AsInteger := id_ser;
        datamodule1.QueryCS.FieldByName('id_cargo').AsInteger := id_cargo;
        datamodule1.QueryCS.Post;
      end;
    end;
    DataModule1.QueryCargos.Close;
    DataModule1.QueryCargos.Open;
    Form14.Show;
    Form11.Close;
    Lblrequired.Visible := false;
  end
  else
    Lblrequired.Visible := true;
end;

procedure TForm11.PreencherListbox;
begin
if not datamodule1.QueryServicos.IsEmpty then
begin
  CheckListBox1.Items.Clear;

  datamodule1.QueryServicos.First;
  while not datamodule1.QueryServicos.Eof do
  begin
    CheckListBox1.Items.AddObject(
      datamodule1.QueryServicos.FieldByName('nome').AsString,
      TObject(datamodule1.QueryServicos.FieldByName('id_servico').AsInteger)
    );
    datamodule1.QueryServicos.Next;
  end;
end;
end;

end.
