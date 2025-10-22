unit Agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.Mask, Vcl.ComCtrls,
  Vcl.WinXPickers, Vcl.Imaging.pngimage;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource2: TDataSource;
    Panel2: TPanel;
    CheckListBoxServicos: TCheckListBox;
    MonthCalendar1: TMonthCalendar;
    ComboBoxHorarios: TComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    DataSource3: TDataSource;
    CheckListBoxProfissionais: TCheckListBox;
    DBEdit1: TDBEdit;
    Lblrequired: TLabel;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    EdPesquisa: TEdit;
    Panel3: TPanel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreencherListBoxServicos;
    procedure PreencherListBoxProfissionais;
    procedure ListarHorarios;
    procedure Cadastrar;
    procedure Panel2Click(Sender: TObject);
    function buscarpreco(id_servico: Integer): Currency;
    procedure CheckListBoxServicosClickCheck(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses UDataModule, CAgendamentos, CClientes;

procedure TForm13.FormShow(Sender: TObject);
begin
  DataModule1.QueryClientes.Close;
  DataModule1.QueryClientes.SQL.Text :=
    'SELECT * FROM clientes ' +
    'WHERE id_empresa = :id_empresa ' +
    'ORDER BY nome_clie';
  DataModule1.QueryClientes.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  DataModule1.QueryClientes.Open;
  datamodule1.QueryServicos.close;
  datamodule1.QueryServicos.open;
  datamodule1.QueryAgendamentos.close;
  datamodule1.QueryAgendamentos.open;
  datamodule1.QueryRAS.close;
  datamodule1.QueryRAS.open;
//  datamodule1.QueryProfissionais.close;
//  datamodule1.QueryProfissionais.open;
  PreencherListBoxServicos;
  DataModule1.QueryAgendamentos.Append;
  ListarHorarios;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
Lblrequired.Visible:= false;
MonthCalendar1.MinDate:= Date;
end;

procedure TForm13.LbClieClick(Sender: TObject);
begin
  Form4.show;
end;

procedure TForm13.ListarHorarios;
begin
var
  i: Integer;
begin
  ComboBoxHorarios.Items.Clear;
  for i := 8 to 17 do
    ComboBoxHorarios.Items.Add(Format('%.2d:00', [i]));
  ComboBoxHorarios.ItemIndex := 0;
end;
end;

procedure TForm13.Panel2Click(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm13.PreencherListBoxProfissionais;
begin
if not datamodule1.QueryProfissionais.IsEmpty then
begin
  CheckListBoxProfissionais.Items.Clear;
  datamodule1.QueryProfissionais.First;
  while not datamodule1.QueryProfissionais.Eof do
  begin
    CheckListBoxProfissionais.Items.AddObject(
      datamodule1.QueryProfissionais.FieldByName('nome').AsString,
      TObject(datamodule1.QueryProfissionais.FieldByName('id_pro').AsInteger)
    );
    datamodule1.QueryProfissionais.Next;
  end;
end;
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
var
  id_clie, id_servico, id_agendamento, i: Integer;
  dataselecionada: TDate;
begin
  if DataModule1.QueryAgendamentos.State in [dsInsert, dsEdit] then
  begin
    dataselecionada := MonthCalendar1.Date;
    id_clie := DataModule1.QueryClientes.FieldByName('id_clie').AsInteger;
    DataModule1.QueryAgendamentos.FieldByName('id_clie').AsInteger := id_clie;
    DataModule1.QueryAgendamentos.FieldByName('data_agendamento').AsDateTime := dataselecionada;
    DataModule1.QueryAgendamentos.FieldByName('hora_inicio').AsDateTime := StrToTime(ComboBoxHorarios.Text);
    DataModule1.QueryAgendamentos.Post;
    DataModule1.QueryAgendamentos.refresh;
    id_agendamento := DataModule1.QueryAgendamentos.FieldByName('id_agendamento').AsInteger;
    for i := 0 to CheckListBoxServicos.Count - 1 do
    begin
      if CheckListBoxServicos.Checked[i] then
      begin
        id_servico := Integer(CheckListBoxServicos.Items.Objects[i]);
        DataModule1.QueryRAS.append;
        DataModule1.QueryRAS.FieldByName('id_agendamento').AsInteger := id_agendamento;
        DataModule1.QueryRAS.FieldByName('id_servico').AsInteger := id_servico;
        DataModule1.QueryRAS.Post;
      end;
    end;
    Lblrequired.Visible := False;
    Form21.Show;
    Form13.Close;
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

end.
