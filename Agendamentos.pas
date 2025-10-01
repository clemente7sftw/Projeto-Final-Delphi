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
    function buscarprofissionais(id_pro:integer): string;
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
//  listarprofissionais;

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

function TForm13.buscarprofissionais(id_pro: integer): string;
begin
  with DataModule1.QueryProfissionais do
  begin
    if Locate('id_pro', id_pro, []) then
      Result := FieldByName('nome').AsString
    else
      Result := '';
  end;
end;

procedure TForm13.CheckListBox1ClickCheck(Sender: TObject);
  var idServico, id_pro, i: Integer;
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
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;
end.
