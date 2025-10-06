unit Agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.Mask, Vcl.ComCtrls,
  Vcl.WinXPickers;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource2: TDataSource;
    Panel2: TPanel;
    CheckListBoxServicos: TCheckListBox;
    MonthCalendar1: TMonthCalendar;
    ComboBox1: TComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreencherListBoxServicos;
    procedure ListarHorarios;
    procedure Cadastrar;
    procedure Panel2Click(Sender: TObject);
    function buscarpreco(id_servico: Integer): Currency;
    procedure CheckListBoxServicosClickCheck(Sender: TObject);
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
  datamodule1.QueryAgendamentos.close;
  datamodule1.QueryAgendamentos.open;
//  datamodule1.QueryProfissionais.close;
//  datamodule1.QueryProfissionais.open;
  PreencherListBoxServicos;
  ListarHorarios;
  datamodule1.QueryAgendamentos.append;
end;

procedure TForm13.ListarHorarios;
begin
var
  i: Integer;
begin
  ComboBox1.Items.Clear;
  for i := 8 to 17 do
    ComboBox1.Items.Add(Format('%.2d:00', [i]));
  ComboBox1.ItemIndex := 0;
end;
end;

procedure TForm13.Panel2Click(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm13.PreencherListBoxServicos;
begin
if not datamodule1.QueryServicos.IsEmpty then
begin
  CheckListBoxServicos.Items.Clear;
  datamodule1.QueryServicos.First;
  while not datamodule1.QueryServicos.Eof do
  begin
    CheckListBoxServicos.Items.AddObject(
      datamodule1.QueryServicos.FieldByName('nome').AsString,
      TObject(datamodule1.QueryServicos.FieldByName('id_servico').AsInteger)
    );
    datamodule1.QueryServicos.Next;
  end;
end;
end;

function TForm13.buscarpreco(id_servico: Integer): Currency;
begin
with datamodule1.QueryServicos do
  begin
    if Locate('id_servico', id_servico, []) then
      Result := FieldByName('preco').AsCurrency
    else
      Result := 0;
  end;
end;

procedure TForm13.Cadastrar;
var id_clie, id_servico, id_pro, i:integer;
var dataselecionada : tdate;
var preco: Currency;
begin
  for i := 0 to checklistboxservicos.count -1 do
  begin
  if checklistboxservicos.Checked[i] then
  begin
    dataselecionada := MonthCalendar1.Date;
    id_servico:= Integer(CheckListBoxservicos.Items.Objects[i]);
    id_clie := DataModule1.QueryClientes.FieldByName('id_clie').AsInteger;
    datamodule1.QueryAgendamentos.FieldByName('id_clie').AsInteger := id_clie;
    datamodule1.QueryAgendamentos.FieldByName('id_servico').AsInteger := id_servico;
    datamodule1.QueryAgendamentos.FieldByName('id_pro').AsInteger := id_pro;
    DataModule1.QueryAgendamentos.FieldByName('data_agendamento').AsDateTime := dataselecionada;
    datamodule1.QueryAgendamentos.FieldByName('preco').Ascurrency:= preco;
    datamodule1.QueryAgendamentos.post;
  end;
  end;

end;

procedure TForm13.CheckListBoxServicosClickCheck(Sender: TObject);
begin
var
  i: Integer;
  var id_servico, id_pro: Integer;
  var total: currency;

begin
  total := 0;
  for i := 0 to CheckListBoxservicos.Count - 1 do
  begin
    if CheckListBoxservicos.Checked[i] then
    begin
      id_servico := Integer(CheckListBoxservicos.Items.Objects[i]);
      total := total + buscarpreco(id_servico);
    end;
  end;
  DBEdit3.Text := FormatFloat('0.00', total);
end;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;
end.
