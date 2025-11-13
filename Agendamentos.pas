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
    DataSource2: TDataSource;
    CLBHorarios: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Trazerservicos(DiaSemana:Integer; DataSelecionada:Tdate);
    procedure TrazerProfissionaisPorServico(id_servico: Integer);
    procedure TrazerHorariosDisponiveis(id_pro: Integer; DataSelecionada: TDatetime);
    procedure Cadastrar;
    procedure Panel2Click(Sender: TObject);
    function buscarpreco(id_servico: Integer): Currency;
    procedure CLBServicosClickCheck(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure atualizar_grid;
    procedure CheckListBoxProfissionaisClick(Sender: TObject);
    procedure CLBHorariosClick(Sender: TObject);
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
var
  i: Integer;
begin
  with datamodule1.queryclientes do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes WHERE id_empresa = :id_empresa ORDER BY nome_clie';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
    datasource1.DataSet := datamodule1.queryclientes;
    dbedit1.DataField := 'nome_clie';
    dbedit2.DataField := 'email_clie';
  end;
  EdPesquisa.Clear;
  DBEdit1.Clear;
  DBEdit2.Clear;
  DBEdit3.Clear;
  CLBServicos.Clear;
  CheckListBoxProfissionais.Clear;
  CLBHorarios.Clear;
  for i := 0 to CLBServicos.Count - 1 do
    CLBServicos.Checked[i] := False;

  for i := 0 to CheckListBoxProfissionais.Count - 1 do
    CheckListBoxProfissionais.Checked[i] := False;

  for i := 0 to CLBHorarios.Count - 1 do
    CLBHorarios.Checked[i] := False;
  Lblrequired.Visible := False;
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
  DataSelecionada: TDate;
  DiaSemana: Integer;
begin
  DataSelecionada := MonthCalendar1.Date;
  DiaSemana := DayOfTheWeek(DataSelecionada);

  if DiaSemana = 7 then
    DiaSemana := 0;

  DataModule1.Query_aux.Close;
  Trazerservicos(DiaSemana, DataSelecionada);
    with datamodule1.queryclientes do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes WHERE id_empresa = :id_empresa ORDER BY nome_clie';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
    datasource1.DataSet := datamodule1.queryclientes;
    dbedit1.DataField := 'nome_clie';
    dbedit2.DataField := 'email_clie';
  end;
end;



procedure TForm13.Panel2Click(Sender: TObject);
begin
  Cadastrar;
end;


procedure TForm13.TrazerHorariosDisponiveis(id_pro: Integer; DataSelecionada: TDateTime);
var
  horaAtual, horaFim: TTime;
  intervalo: TTime;
  diaSemana: Integer;
begin
  CLBHorarios.Clear;
  diaSemana := DayOfTheWeek(DataSelecionada) - 1;
  if diaSemana < 0 then
    diaSemana := 6;

  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'SELECT hora_inicio, hora_fim ' +
      'FROM horarios_profissionais ' +
      'WHERE id_pro = :id_pro ' +
      'AND dia_semana = :dia_semana ' +
      'AND id_empresa = :id_empresa';
    ParamByName('id_pro').AsInteger := id_pro;
    ParamByName('dia_semana').AsInteger := diaSemana;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;

    if not IsEmpty then
    begin
      horaAtual := FieldByName('hora_inicio').AsDateTime;
      horaFim := FieldByName('hora_fim').AsDateTime;
      intervalo := EncodeTime(1, 0, 0, 0);

      while horaAtual < horaFim do
      begin
        CLBHorarios.Items.Add(FormatDateTime('hh:nn', horaAtual));
        horaAtual := horaAtual + intervalo;
      end;
    end
    else
      ShowMessage('Nenhum horário cadastrado para este profissional neste dia.');
  end;
end;


procedure TForm13.TrazerProfissionaisPorServico(id_servico: Integer);
var
  i, id_pro: Integer;
  nome: string;
  existe: Boolean;
begin
  with DataModule1.Query_aux do
  begin
    Close;
    SQL.Text :=
      'SELECT DISTINCT p.id_pro, p.nome ' +
      'FROM profissionais p ' +
      'JOIN profissionais_cargos pc ON p.id_pro = pc.id_pro ' +
      'JOIN cargos_servicos cs ON pc.id_cargo = cs.id_cargo ' +
      'WHERE cs.id_servico = :id_servico ' +
      '  AND p.id_empresa = :id_empresa ' +
      'ORDER BY p.nome';
    ParamByName('id_servico').AsInteger := id_servico;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;

    while not Eof do
    begin
      id_pro := FieldByName('id_pro').AsInteger;
      nome   := FieldByName('nome').AsString;

      existe := False;
      for i := 0 to CheckListBoxProfissionais.Count - 1 do
        if Integer(CheckListBoxProfissionais.Items.Objects[i]) = id_pro then
        begin
          existe := True;
          Break;
        end;

      if not existe then
        CheckListBoxProfissionais.Items.AddObject(nome, TObject(id_pro));

      Next;
    end;
  end;
end;


procedure TForm13.Trazerservicos(DiaSemana: Integer; DataSelecionada: TDate);
begin
  with DataModule1.Queryservicos do
  begin
    CheckListBoxProfissionais.Clear;
    Close;
    SQL.Text :=
      'SELECT DISTINCT s.id_servico, s.nome AS nome_servico ' +
      'FROM servicos s ' +
      'JOIN cargos_servicos cs ON s.id_servico = cs.id_servico ' +
      'JOIN profissionais_cargos pc ON cs.id_cargo = pc.id_cargo ' +
      'JOIN horarios_profissionais hp ON pc.id_pro = hp.id_pro ' +
      'JOIN profissionais p ON p.id_pro = pc.id_pro ' +
      'WHERE hp.dia_semana = :dia_semana ' +
      '  AND hp.id_empresa = :id_empresa ' +
      '  AND p.id_empresa = :id_empresa ' +
      '  AND s.id_empresa = :id_empresa ' +
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
end;



procedure TForm13.atualizar_grid;
begin
  with datamodule1.queryclientes do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes WHERE id_empresa = :id_empresa ORDER BY nome_clie';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
    datasource1.DataSet := datamodule1.queryclientes;
    dbedit1.DataField := 'nome_clie';
    dbedit2.DataField := 'email_clie';
  end;
end;

function TForm13.buscarpreco(id_servico: Integer): Currency;
begin
  Result := 0;

  with DataModule1.query_aux do
  begin
    Close;
    SQL.Text :=
      'SELECT preco FROM servicos ' +
      'WHERE id_servico = :id_servico AND id_empresa = :id_empresa';
    ParamByName('id_servico').AsInteger := id_servico;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;

    if not IsEmpty then
      Result := FieldByName('preco').AsCurrency;
    open;
  end;
end;

procedure TForm13.Cadastrar;
var
  id_clie, id_pro, id_servico, id_agendamento, id_empresa, i: Integer;
  dataselecionada, hora_inicio: TDateTime;
begin
  id_empresa := DataModule1.id_empresa;
  dataselecionada := MonthCalendar1.Date;
  id_clie := DataModule1.Queryclientes.FieldByName('id_clie').AsInteger;

  hora_inicio := StrToTime(CLBHorarios.Items[CLBHorarios.ItemIndex]);

  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'INSERT INTO agendamentos (id_clie, id_empresa, data_agendamento, hora_inicio, preco) ' +
      'VALUES (:id_clie, :id_empresa, :data_agendamento, :hora_inicio, :preco) ' +
      'RETURNING id_agendamento';
    ParamByName('id_clie').AsInteger := id_clie;
    ParamByName('id_empresa').AsInteger := id_empresa;
    ParamByName('data_agendamento').AsDate := dataselecionada;
    ParamByName('hora_inicio').AsDateTime := hora_inicio;
    ParamByName('preco').AsCurrency := StrToCurr(DBEdit3.Text);
    Open;
    id_agendamento := FieldByName('id_agendamento').AsInteger;
    Close;
  end;

  for i := 0 to CLBServicos.Count - 1 do
  begin
    if CLBServicos.Checked[i] then
    begin
      id_servico := Integer(CLBServicos.Items.Objects[i]);
      with DataModule1.Query_aux do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO agendamento_servicos (id_agendamento, id_servico, id_empresa) ' +
          'VALUES (:id_agendamento, :id_servico, :id_empresa)';
        ParamByName('id_agendamento').AsInteger := id_agendamento;
        ParamByName('id_servico').AsInteger := id_servico;
        ParamByName('id_empresa').AsInteger := id_empresa;
        ExecSQL;
      end;
    end;
  end;

  for i := 0 to CheckListBoxProfissionais.Count - 1 do
  begin
    if CheckListBoxProfissionais.Checked[i] then
    begin
      id_pro := Integer(CheckListBoxProfissionais.Items.Objects[i]);
      with DataModule1.Query_aux do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO profissionais_agendamentos (id_agendamento, id_pro, id_empresa, data_agendamento, hora_inicio) ' +
          'VALUES (:id_agendamento, :id_pro, :id_empresa, :data_agendamento, :hora_inicio)';
        ParamByName('id_agendamento').AsInteger := id_agendamento;
        ParamByName('id_pro').AsInteger := id_pro;
        ParamByName('id_empresa').AsInteger := id_empresa;
        ParamByName('data_agendamento').AsDate := dataselecionada;
        ParamByName('hora_inicio').AsDateTime := hora_inicio;
        ExecSQL;
      end;
      Break;
    end;
  end;
  atualizar_grid;
  Form21.Show;
  Form13.Close;
end;




procedure TForm13.CheckListBoxProfissionaisClick(Sender: TObject);
var
  i, id_pro: Integer;
begin

  for i := 0 to CheckListBoxProfissionais.Count - 1 do
  begin
    if CheckListBoxProfissionais.Checked[i] then
    begin
      id_pro := Integer(CheckListBoxProfissionais.Items.Objects[i]);
      TrazerHorariosDisponiveis(id_pro, MonthCalendar1.Date);
      Break;
    end;
  end;
end;

procedure TForm13.CLBHorariosClick(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to CLBHorarios.Count - 1 do
  begin
    if i <> CLBHorarios.ItemIndex then
      CLBHorarios.Checked[i] := False;
  end;
end;

procedure TForm13.CLBServicosClickCheck(Sender: TObject);
var
  i, id_servico: Integer;
  total: Currency;
begin
  total := 0;

  CheckListBoxProfissionais.Clear;

  for i := 0 to CLBServicos.Count - 1 do
  begin
    if CLBServicos.Checked[i] then
    begin
      id_servico := Integer(CLBServicos.Items.Objects[i]);
      total := total + buscarpreco(id_servico);

      TrazerProfissionaisPorServico(id_servico);
    end;
  end;

  datamodule1.query_aux.close;
  DBEdit3.DataSource := DataSource2;
  DBEdit3.DataField := 'preco';
  DBEdit3.Text := FormatFloat('0.00', total);

end;


end.
