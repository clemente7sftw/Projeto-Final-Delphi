unit Agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.Mask, Vcl.ComCtrls,
  Vcl.WinXPickers, Vcl.Imaging.pngimage, Datasnap.DBClient,  DateUtils;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    CLBServicos: TCheckListBox;
    MonthCalendar1: TMonthCalendar;
    ComboBoxHorarios: TComboBox;
    Label3: TLabel;
    DBEdit3: TDBEdit;
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
    procedure Trazerservicos(DiaSemana:Integer; Data:Tdate);
    procedure Cadastrar;
    procedure Panel2Click(Sender: TObject);
    function buscarpreco(id_servico: Integer): Currency;
    procedure CLBServicosClickCheck(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure atualizar_grid;
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
  with datamodule1.query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes WHERE id_empresa = :id_empresa ORDER BY nome_clie';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
    datasource1.DataSet := datamodule1.query_conexao;
    dbedit1.DataField := 'nome_clie';
    dbedit2.DataField := 'email_clie';


  end;
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


procedure TForm13.MonthCalendar1Click(Sender: TObject);
var
  Data: TDate;
  DiaSemana: Integer;
begin
  Data := MonthCalendar1.Date;
  DiaSemana := DayOfTheWeek(Data);

  if DiaSemana = 7 then
    DiaSemana := 0;

  ShowMessage('Dia selecionado: ' + IntToStr(DiaSemana));
  Trazerservicos(DiaSemana,Data);
end;


procedure TForm13.Panel2Click(Sender: TObject);
begin
  Cadastrar;
end;


procedure TForm13.Trazerservicos(DiaSemana: Integer; Data: TDate);
begin
  DBEdit1.DataSource := nil;
  DBEdit2.DataSource := nil;

  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'SELECT DISTINCT s.id_servico, s.nome AS nome_servico ' +
      'FROM servicos s ' +
      'JOIN cargos_servicos cs ON s.id_servico = cs.id_servico ' +
      'JOIN profissionais_cargos pc ON cs.id_cargo = pc.id_cargo ' +
      'JOIN horarios_profissionais hp ON pc.id_pro = hp.id_pro ' +
      'WHERE hp.dia_semana = :dia_semana ' +
      '  AND hp.id_empresa = :id_empresa ' +
      'ORDER BY s.nome';
    ParamByName('dia_semana').AsInteger := DiaSemana;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;

    CLBServicos.Items.Clear;
    while not Eof do
    begin
      CLBServicos.Items.AddObject(
        FieldByName('nome_servico').AsString,
        TObject(FieldByName('id_servico').AsInteger)
      );
      Next;
    end;
  end;

atualizar_grid;
end;


procedure TForm13.atualizar_grid;
begin
  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes WHERE id_empresa = :id_empresa ORDER BY nome_clie';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
  end;
  DBEdit1.DataSource := DataSource1;
  DBEdit2.DataSource := DataSource1;
  DBEdit1.DataField := 'nome_clie';
  DBEdit2.DataField := 'email_clie';
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
  id_clie, id_servico, id_agendamento, id_empresa, i: Integer;
  dataselecionada: TDateTime;
begin
  if (DBEdit2.Text <> '') and (ComboBoxHorarios.Text <> '') then
  begin
    id_empresa := DataModule1.id_empresa;
    id_clie := DataModule1.QueryClientes.FieldByName('id_clie').AsInteger;
    dataselecionada := MonthCalendar1.Date;

    with DataModule1.QueryAgendamentos do
    begin
      Close;
      SQL.Text :=
        'INSERT INTO agendamentos (id_clie, id_empresa, data_agendamento, hora_inicio) ' +
        'VALUES (:id_clie, :id_empresa, :data_agendamento, :hora_inicio) ' +
        'RETURNING id_agendamento';
      ParamByName('id_clie').AsInteger := id_clie;
      ParamByName('id_empresa').AsInteger := id_empresa;
      ParamByName('data_agendamento').AsDate := dataselecionada;
      ParamByName('hora_inicio').AsDateTime := StrToTime(ComboBoxHorarios.Text);
      Open;
      id_agendamento := FieldByName('id_agendamento').AsInteger;
      Close;
    end;
    for i := 0 to CLBServicos.Count - 1 do
    begin
      if CLBServicos.Checked[i] then
      begin
        id_servico := Integer(CLBServicos.Items.Objects[i]);
        with DataModule1.QueryRAS do
        begin
          Close;
          SQL.Text :=
            'INSERT INTO rel_agendamentos_servicos (id_agendamento, id_servico, id_empresa) ' +
            'VALUES (:id_agendamento, :id_servico, :id_empresa)';
          ParamByName('id_agendamento').AsInteger := id_agendamento;
          ParamByName('id_servico').AsInteger := id_servico;
          ParamByName('id_empresa').AsInteger := id_empresa;
          ExecSQL;
        end;
      end;
    end;

    DataModule1.QueryAgendamentos.Close;
    DataModule1.QueryAgendamentos.Open;
    DataModule1.QueryRAS.Close;
    DataModule1.QueryRAS.Open;

    Lblrequired.Visible := False;
    Form21.Show;
    Form13.Close;
  end
  else
  begin
    Lblrequired.Visible := True;
  end;
end;



procedure TForm13.CLBServicosClickCheck(Sender: TObject);
begin
var
  i: Integer;
  var id_servico, id_pro: Integer;
  var total: currency;

begin
  total := 0;
  for i := 0 to CLBServicos.Count - 1 do
  begin
    if CLBServicos.Checked[i] then
    begin
      id_servico := Integer(CLBServicos.Items.Objects[i]);
      total := total + buscarpreco(id_servico);
    end;
  end;
  DBEdit3.Text := FormatFloat('0.00', total);
end;
end;

end.
