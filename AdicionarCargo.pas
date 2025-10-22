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
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    CheckListBox1: TCheckListBox;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    BtnConf: TPanel;
    Lblrequired: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreencherListbox;
    procedure Cadastrar;
    procedure BtnConfClick(Sender: TObject);

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


procedure TForm11.BtnConfClick(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm11.Cadastrar;
var id_ser, id_cargo, id_empresa, i: integer;
begin
  if DBEdit1.Text <> '' then
  begin
    if datamodule1.QueryCargos.state in [dsinsert, dsedit] then
     id_empresa:= DataModule1.id_empresa;
    DataModule1.QueryCargos.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;
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
         DataModule1.QueryCs.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;
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
//    datamodule1.QueryRCS.close;
//    datamodule1.QueryRCS.open;
    PreencherListbox;

end;

procedure TForm11.PCadClick(Sender: TObject);
var
  id_ser, id_cargo, id_empresa, i: integer;
begin
  if DBEdit1.Text <> '' then
  begin
    DataModule1.QueryCargos.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;

    if DataModule1.QueryCargos.State in [dsInsert, dsEdit] then
      DataModule1.QueryCargos.Post;

    DataModule1.QueryCargos.Refresh;

    id_cargo := DataModule1.QueryCargos.FieldByName('id_cargo').AsInteger;
    id_empresa := DataModule1.id_empresa;
    for i := 0 to CheckListBox1.Count - 1 do
    begin
      if CheckListBox1.Checked[i] then
      begin
        id_ser := Integer(CheckListBox1.Items.Objects[i]);

        DataModule1.QueryCS.Append;
        DataModule1.QueryCS.FieldByName('id_servico').AsInteger := id_ser;
        DataModule1.QueryCS.FieldByName('id_cargo').AsInteger := id_cargo;
        DataModule1.QueryCS.FieldByName('id_empresa').AsInteger := id_empresa;
        DataModule1.QueryCS.Post;
      end;
    end;
    DataModule1.QueryCargos.Close;
    DataModule1.QueryCargos.Open;
    Form14.Show;
    Form11.Close;
    LblRequired.Visible := False;
  end
  else
    LblRequired.Visible := True;
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
