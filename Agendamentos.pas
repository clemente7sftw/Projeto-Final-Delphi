unit Agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.Mask, Vcl.ComCtrls;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    CheckListBox1: TCheckListBox;
    MonthCalendar1: TMonthCalendar;
    CheckListBox2: TCheckListBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DataSource2: TDataSource;
    CheckListBox3: TCheckListBox;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure popularchecklistservicos;
    procedure popularchecklisthora;
    function buscarpreco(idServico: Integer): Currency;
    procedure CheckListBox1ClickCheck(Sender: TObject);
    procedure listarprofissionais;
    function buscarprofissionais(id_pro:integer):  Currency;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses UDataModule;
procedure TForm13.FormShow(Sender: TObject);
begin
  datamodule1.QueryClientes.close;
  datamodule1.QueryClientes.open;
  datamodule1.QueryServicos.close;
  datamodule1.QueryServicos.open;
  datamodule1.QueryProfissionais.close;
  datamodule1.QueryProfissionais.open;
  popularchecklistservicos;
  popularchecklisthora;
  listarprofissionais;

end;
procedure TForm13.popularchecklisthora;
var h:integer;
begin
  CheckListBox2.Items.Clear;
for h := 8 to 17 do
  CheckListBox2.Items.Add(Format('%2.2d:00', [h]));
end;

procedure TForm13.popularchecklistservicos;
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

procedure TForm13.listarprofissionais;
begin
if not datamodule1.QueryProfissionais.IsEmpty then
begin
  CheckListBox3.Items.Clear;
  datamodule1.QueryProfissionais.First;
  while not datamodule1.QueryProfissionais.Eof do
  begin
    CheckListBox3.Items.AddObject(
      datamodule1.QueryProfissionais.FieldByName('nome').AsString,
      TObject(datamodule1.QueryProfissionais.FieldByName('id_pro').AsInteger)
    );
    datamodule1.QueryProfissionais.Next;
  end;
end;
end;

function TForm13.buscarpreco(idServico: Integer): Currency;
begin
with datamodule1.QueryServicos do
  begin
    if Locate('id_servico', idServico, []) then
      Result := FieldByName('preco').AsCurrency
    else
      Result := 0;
  end;
end;

function TForm13.buscarprofissionais(id_pro: integer): Currency;
begin
with datamodule1.QueryProfissionais do
begin
  if locate ('id_pro', id_pro, []) then
  result := fieldbyname ('nome').AsCurrency
  else
  result := 0;
end;
end;

procedure TForm13.CheckListBox1ClickCheck(Sender: TObject);
var
  i: Integer;
  var idServico, id_pro: Integer;
  var total: currency;

begin
  total := 0;
  for i := 0 to CheckListBox1.Count - 1 do
  begin
    if CheckListBox1.Checked[i] then
    begin
      idServico := Integer(CheckListBox1.Items.Objects[i]);
      total := total + buscarpreco(idServico);
    end;
  end;
  DBEdit3.Text := FormatFloat('0.00', total);
  id_pro := Integer(CheckListBox3.Items.Objects[i]);
end;


procedure TForm13.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;



end.
