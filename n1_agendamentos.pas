unit n1_agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.CheckLst, System.DateUtils, Vcl.ComCtrls, Vcl.Skia;

type
  TForm26 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    BS: TImage;
    Label1: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CheckListBoxProfissionais: TCheckListBox;
    Panel2: TPanel;
    DataSource2: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    CLBHorarios: TCheckListBox;
    MonthCalendar1: TMonthCalendar;
    DataSource3: TDataSource;
    CLBServicos: TCheckListBox;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Timer1: TTimer;
    lblrequired: TLabel;
    Image2: TImage;
    Barra: TPanel;
    Lbagendamentos: TLabel;
    procedure FormShow(Sender: TObject);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Trazerservicos(DiaSemana:Integer; DataSelecionada:Tdate);
    procedure TrazerProfissionaisPorServico(id_servico: Integer);
    procedure DBGrid2CellClick(Column: TColumn);
    procedure TrazerHorariosDisponiveis(id_pro: Integer; DataSelecionada: TDatetime);
    procedure CheckListBoxProfissionaisClickCheck(Sender: TObject);
    procedure MonthCalendar1Click(Sender: TObject);
    procedure Cadastrar;
    procedure CLBServicosClickCheck(Sender: TObject);
    procedure atualizar_grid;
    procedure Panel2Click(Sender: TObject);
    procedure erro;
    procedure Timer1Timer(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CLBHorariosClickCheck(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;
  id_empresa: integer;

implementation

{$R *.dfm}

uses UDataModule, TelaPrincipalN1;

procedure TForm26.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
end;

procedure TForm26.FormShow(Sender: TObject);
begin
  atualizar_grid;
  lblrequired.Visible:= false;
  CLBServicos.Clear;
  CheckListBoxProfissionais.Clear;
  CLBHorarios.Clear;
end;

procedure TForm26.FormClose(Sender: TObject; var Action: TCloseAction);
begin
form3.atualizar_grid;
end;

procedure TForm26.atualizar_grid;
begin
  with DataModule1.Queryempresa do
  begin
    Close;
    SQL.Text := 'SELECT id_empresa, nome, email FROM empresas ORDER BY nome';
    Open;
  end;
  DataSource1.DataSet := DataModule1.Queryempresa;
  DBGrid1.DataSource := DataSource1;
end;

procedure TForm26.Cadastrar;
var
  id_clie, id_pro, id_servico, id_agendamento, id_empresa, i, checkedCount: Integer;
  dataselecionada, hora_inicio: TDateTime;
  preco: Double;
begin
  id_empresa := DataModule1.id_empresa;
  dataselecionada := MonthCalendar1.Date;
  if CLBHorarios.ItemIndex = -1 then
  begin
    erro;
    Exit;
  end;
  for i := 0 to CLBServicos.Count - 1 do
  if CLBServicos.Checked[i] then Inc(checkedCount);
  if checkedCount = 0 then
  begin
    erro;
    Exit;
  end;
  try
    hora_inicio := StrToTime(CLBHorarios.Items[CLBHorarios.ItemIndex]);
  except
    erro;
    Exit;
  end;

  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'INSERT INTO agendamentos (id_clie, id_empresa, data_agendamento, hora_inicio, preco) ' +
      'VALUES (:id_clie, :id_empresa, :data_agendamento, :hora_inicio, :preco) ' +
      'RETURNING id_agendamento';
     ParamByName('id_clie').AsInteger := DataModule1.id_clie;

    ParamByName('id_empresa').AsInteger := id_empresa;
    ParamByName('data_agendamento').AsDate := dataselecionada;
    ParamByName('hora_inicio').AsDateTime := hora_inicio;
    ParamByName('preco').AsFloat := preco;
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
  Form3.Show;
  form26.Close;
end;

procedure TForm26.CheckListBoxProfissionaisClickCheck(Sender: TObject);
var
  i, id_pro: Integer;
begin
  for i := 0 to CheckListBoxProfissionais.Count - 1 do
  begin
    if i <> CheckListBoxProfissionais.ItemIndex then
      CheckListBoxProfissionais.Checked[i] := False;
  end;
  if (CheckListBoxProfissionais.ItemIndex >= 0) and
     (CheckListBoxProfissionais.Checked[CheckListBoxProfissionais.ItemIndex]) then
  begin
    id_pro := Integer(CheckListBoxProfissionais.Items.Objects[
                      CheckListBoxProfissionais.ItemIndex]);
    TrazerHorariosDisponiveis(id_pro, MonthCalendar1.Date);
  end;
end;

procedure TForm26.CLBHorariosClickCheck(Sender: TObject);
var
  i: Integer;
begin
  for i := 0 to CLBHorarios.Count - 1 do
  begin
    if i <> CLBHorarios.ItemIndex then
      CLBHorarios.Checked[i] := False;
  end;
end;

procedure TForm26.CLBServicosClickCheck(Sender: TObject);
var
  i, id_servico: Integer;
begin
  for i := 0 to CLBServicos.Count - 1 do
  begin
    if i <> CLBServicos.ItemIndex then
      CLBServicos.Checked[i] := False;
  end;
  CheckListBoxProfissionais.Clear;
  CLBHorarios.Clear;
  for i := 0 to CLBServicos.Count - 1 do
  begin
    if CLBServicos.Checked[i] then
    begin
      id_servico := Integer(CLBServicos.Items.Objects[i]);

      with DataModule1.Query_aux do
      begin
        Close;
        SQL.Text := 'SELECT nome, duracao, preco FROM servicos WHERE id_servico = :id';
        ParamByName('id').AsInteger := id_servico;
        Open;

        DBEdit1.Text := FieldByName('nome').AsString;
        DBEdit2.Text := FieldByName('duracao').AsString;
        DBEdit3.Text := FieldByName('preco').AsString;
      end;

      TrazerProfissionaisPorServico(id_servico);
      Break;
    end;
  end;
end;

procedure TForm26.DBGrid1CellClick(Column: TColumn);
var
  DataSelecionada: TDate;
  DiaSemana: Integer;
begin

  DataModule1.id_empresa :=
  DataModule1.Queryempresa.FieldByName('id_empresa').AsInteger;
  DataSelecionada := MonthCalendar1.Date;
  DiaSemana := DayOfTheWeek(DataSelecionada);
  if DiaSemana = 7 then
  DiaSemana := 0;
  DataModule1.Query_aux.Close;
  Trazerservicos(DiaSemana, DataSelecionada);
end;


procedure TForm26.DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
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
end;


procedure TForm26.DBGrid2CellClick(Column: TColumn);
var
  id_servico: Integer;
begin
  if not DataSource2.DataSet.IsEmpty then
  begin
    id_servico := DataSource2.DataSet.FieldByName('id_servico').AsInteger;
    TrazerProfissionaisPorServico(id_servico);
  end;
end;



procedure TForm26.erro;
begin
  Timer1.Enabled := true;
  Lblrequired.visible := true;
end;

procedure TForm26.Image2Click(Sender: TObject);
begin
  form26.close;
end;

procedure TForm26.MonthCalendar1Click(Sender: TObject);
var
  DataSelecionada: TDate;
  DiaSemana: Integer;
begin
  CLBHorarios.Clear;
  DataSelecionada := MonthCalendar1.Date;
  DiaSemana := DayOfTheWeek(DataSelecionada);
  if DiaSemana = 7 then
    DiaSemana := 0;
  DataModule1.Query_aux.Close;
  Trazerservicos(DiaSemana, DataSelecionada);
end;



procedure TForm26.Panel2Click(Sender: TObject);
begin
  cadastrar;
end;



procedure TForm26.Timer1Timer(Sender: TObject);
begin
  Lblrequired.visible:= false;
  Timer1.Enabled := false;
end;

procedure TForm26.TrazerHorariosDisponiveis(id_pro: Integer;
  DataSelecionada: TDatetime);
var
  horaAtual, horaFim: TTime;
  intervalo: TTime;
  diaSemana: Integer;
  HorarioOcupado: string;
  ListaOcupados: TStringList;
begin
  CLBHorarios.Clear;
  diaSemana := DayOfTheWeek(DataSelecionada);

  ListaOcupados := TStringList.Create;
  try
    with DataModule1.Query_aux do
    begin
      Close;
      SQL.Text :=
        'SELECT to_char(hora_inicio, ''HH24:MI'') AS hora ' +
        'FROM profissionais_agendamentos ' +
        'WHERE id_pro = :id_pro ' +
        '  AND id_empresa = :id_empresa ' +
        '  AND data_agendamento = :data';
      ParamByName('id_pro').AsInteger := id_pro;
      ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
      ParamByName('data').AsDate := DateOf(DataSelecionada);
      Open;
      while not EOF do
      begin
        ListaOcupados.Add(FieldByName('hora').AsString);
        Next;
      end;
      Close;
    end;

    with DataModule1.Query_conexao do
    begin
      Close;
      SQL.Text :=
        'SELECT hora_inicio, hora_fim ' +
        'FROM horarios_profissionais ' +
        'WHERE id_pro = :id_pro ' +
        '  AND dia_semana = :dia_semana ' +
        '  AND id_empresa = :id_empresa';
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
          HorarioOcupado := FormatDateTime('HH:nn', horaAtual);

          if ListaOcupados.IndexOf(HorarioOcupado) = -1 then
            CLBHorarios.Items.Add(HorarioOcupado);

          horaAtual := horaAtual + intervalo;
        end;
      end
      else
        ShowMessage('Nenhum horário cadastrado para este profissional neste dia.');
      Close;
    end;
  finally
    ListaOcupados.Free;
  end;
end;

procedure TForm26.TrazerProfissionaisPorServico(id_servico: Integer);
begin
  with DataModule1.QueryProfissionais do
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
  end;

  CheckListBoxProfissionais.Clear;

  DataModule1.QueryProfissionais.First;
  while not DataModule1.QueryProfissionais.Eof do
  begin
    CheckListBoxProfissionais.Items.AddObject(
      DataModule1.QueryProfissionais.FieldByName('nome').AsString,
      TObject(DataModule1.QueryProfissionais.FieldByName('id_pro').AsInteger)
    );
    DataModule1.QueryProfissionais.Next;
  end;
end;

procedure TForm26.Trazerservicos(DiaSemana: Integer; DataSelecionada: TDate);
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
    CLBHorarios.Clear;
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



end.
