unit CAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.CheckLst, Vcl.ComCtrls, Vcl.Skia, DateUtils;

type
  TForm21 = class(TForm)
    Fundo: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    calendario: TMonthCalendar;
    CLBServicos: TCheckListBox;
    ExclBtn: TImage;
    EditBtn: TImage;
    btncancelar: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Image4: TImage;
    BS: TImage;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    addbtn: TImage;
    BtnConf: TPanel;
    Image1: TImage;
    LbPro: TLabel;
    CLBHorarios: TCheckListBox;
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizarStatus;
    procedure Excluir;
    procedure Adicionar;
    procedure Editar;
    procedure Confirmar;
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
    procedure addbtnClick(Sender: TObject);
    procedure TrazerHorariosDisponiveis(id_pro: Integer; DataSelecionada: TDateTime);
    procedure calendarioClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

var  dataselecionada: TDatetime;
var  i, ServicoSelecionado, id_agendamento, id_servico:integer;

implementation

{$R *.dfm}

uses UDataModule, Agendamentos, TelaInicialN3, CClientes, CProfissionais,
  CServicos, CCargos, CFornecedores;

procedure TForm21.addbtnClick(Sender: TObject);
begin
  Adicionar;
end;

procedure TForm21.Adicionar;
begin
form13.show;
form21.close;

end;

procedure TForm21.AtualizarStatus;
begin
  DataModule1.QueryUpAg.Close;
  DataModule1.QueryUpAg.SQL.Text :=
    'UPDATE agendamentos ' +
    'SET status = TRUE ' +
    'WHERE data_agendamento < NOW() AND status = FALSE';
  DataModule1.QueryUpAg.ExecSQL;
  DataModule1.QueryUpAg.Close;
  DataModule1.QueryUpAg.SQL.Text :=
    'UPDATE agendamentos ' +
    'SET status = FALSE ' +
    'WHERE data_agendamento >= NOW() AND status = TRUE';
  DataModule1.QueryUpAg.ExecSQL;
  with datamodule1.QueryAg do
begin
  close;
  SQL.Text :=
  'SELECT ' +
  '    a.id_agendamento, ' +
  '    c.nome_clie, ' +
  '    c.email_clie, ' +
  '    STRING_AGG(s.nome, '', '')::varchar(500) AS nome_servicos, ' +
  '    a.data_agendamento, ' +
  '    a.hora_inicio, ' +
  '    a.status ' +
  'FROM ' +
  '    agendamentos a ' +
  'INNER JOIN ' +
  '    clientes c ON a.id_clie = c.id_clie ' +
  'INNER JOIN ' +
  '    agendamento_servicos ags ON a.id_agendamento = ags.id_agendamento ' +
  'INNER JOIN ' +
  '    servicos s ON ags.id_servico = s.id_servico ' +
  'GROUP BY ' +
  '    a.id_agendamento, ' +
  '    c.nome_clie, ' +
  '    c.email_clie, ' +
  '    a.data_agendamento, ' +
  '    a.hora_inicio, ' +
  '    a.status ' +
  'ORDER BY ' +
  '    a.id_agendamento;';
open;
end;

end;

procedure TForm21.BtnAddClick(Sender: TObject);
begin
form13.show;
form21.close;
end;

procedure TForm21.BtnEditarClick(Sender: TObject);
begin
  btnconf.Visible := True;
  calendario.Visible := True;
  CLBServicos.Visible := True;
  dataselecionada := DataModule1.QueryAg.FieldByName('data_agendamento').AsDateTime;
  Calendario.Date := dataselecionada;
end;

procedure TForm21.BtnConfClick(Sender: TObject);
begin
Confirmar;
end;

procedure TForm21.BtnExcluirClick(Sender: TObject);
begin
  datamodule1.QueryAg.Delete;
end;

procedure TForm21.Button1Click(Sender: TObject);
begin
  AtualizarStatus;
end;



procedure TForm21.calendarioClick(Sender: TObject);
var
  DataSelecionada: TDate;
  DiaSemana: Integer;
  id_pro: Integer;
begin
  DataSelecionada := calendario.Date;
  DiaSemana := DayOfTheWeek(DataSelecionada);
  if DiaSemana = 7 then
    DiaSemana := 0;

  id_pro := DataModule1.QueryProfissionais.FieldByName('id_pro').AsInteger;

  with DataModule1.Query_aux do
  begin
    Close;
    SQL.Text :=
      'SELECT hora_inicio, hora_fim ' +
      'FROM horarios_profissionais ' +
      'WHERE id_pro = :id_pro ' +
      'AND dia_semana = :dia_semana ' +
      'AND id_empresa = :id_empresa';
    ParamByName('id_pro').AsInteger := id_pro;
    ParamByName('dia_semana').AsInteger := DiaSemana;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
    if IsEmpty then
    begin
      Form21.CLBHorarios.Clear;
      ShowMessage('Este profissional não trabalha neste dia.');
      Exit;
    end;
  end;

end;

procedure TForm21.Confirmar;
var
  DataSelecionada, HoraSelecionada, DataHoraCompleta: TDateTime;
  i: Integer;
  hora_inicio: TDateTime;
begin
  btnconf.Visible := False;

  DataSelecionada := calendario.Date;

  if CLBHorarios.ItemIndex = -1 then
  begin
    ShowMessage('Selecione um horário antes de confirmar.');
    Exit;
  end;

  hora_inicio := StrToTime(CLBHorarios.Items[CLBHorarios.ItemIndex]);

  with DataModule1.QueryAg do
  begin
    Edit;
    FieldByName('data_agendamento').AsDateTime := DataSelecionada;
    FieldByName('hora_inicio').AsDateTime := hora_inicio;
    Post;
  end;

  calendario.Visible := False;
  CLBServicos.Visible := False;

  AtualizarStatus;
end;




procedure TForm21.Editar;
var
  id_pro: Integer;
begin
  btnconf.Visible := True;
  calendario.Visible := True;
  CLBServicos.Visible := True;

  dataselecionada := DataModule1.QueryAg.FieldByName('data_agendamento').AsDateTime;
  Calendario.Date := dataselecionada;

  with DataModule1.Query_Aux do
  begin
    Close;
    SQL.Text :=
      'SELECT a.id_pro ' +
      'FROM profissionais_agendamentos a ' +
      'WHERE a.id_agendamento = :id_agendamento';
    ParamByName('id_agendamento').AsInteger :=
      DataModule1.QueryAg.FieldByName('id_agendamento').AsInteger;
    Open;

    if not IsEmpty then
    begin
      id_pro := FieldByName('id_pro').AsInteger;
      TrazerHorariosDisponiveis(id_pro, calendario.Date);
    end
    else
      ShowMessage('Não foi possível identificar o profissional deste agendamento.');
  end;

  CLBHorarios.Visible := True;
end;


procedure TForm21.EditBtnClick(Sender: TObject);
begin
Editar;
end;

procedure TForm21.ExclBtnClick(Sender: TObject);
begin
  Excluir;
end;

procedure TForm21.Excluir;
var
  id_agendamento: Integer;
begin
  if DataModule1.QueryAg.IsEmpty then
  begin
//    ShowMessage('Nenhum agendamento selecionado.');
    Exit;
  end;
  if Application.MessageBox(
       'Tem certeza de que deseja excluir este Agendamento? Essa ação não poderá ser desfeita.',
       'Exclusão de Agendamento',
       MB_YESNO + MB_ICONQUESTION
     ) = IDYES then
  begin
    id_agendamento := DataModule1.QueryAg.FieldByName('id_agendamento').AsInteger;
    with DataModule1.Query_Aux do
    begin
      Close;
      SQL.Text := 'DELETE FROM agendamentos WHERE id_agendamento = :id_agendamento';
      ParamByName('id_agendamento').AsInteger := id_agendamento;
      ExecSQL;
    end;
  end;
   with datamodule1.QueryAg do
begin
  close;
  SQL.Text :=
  'SELECT ' +
  '    a.id_agendamento, ' +
  '    c.nome_clie, ' +
  '    c.email_clie, ' +
  '    STRING_AGG(s.nome, '', '')::varchar(500) AS nome_servicos, ' +
  '    a.data_agendamento, ' +
  '    a.hora_inicio, ' +
  '    a.status ' +
  'FROM ' +
  '    agendamentos a ' +
  'INNER JOIN ' +
  '    clientes c ON a.id_clie = c.id_clie ' +
  'INNER JOIN ' +
  '    agendamento_servicos ags ON a.id_agendamento = ags.id_agendamento ' +
  'INNER JOIN ' +
  '    servicos s ON ags.id_servico = s.id_servico ' +
  'GROUP BY ' +
  '    a.id_agendamento, ' +
  '    c.nome_clie, ' +
  '    c.email_clie, ' +
  '    a.data_agendamento, ' +
  '    a.hora_inicio, ' +
  '    a.status ' +
  'ORDER BY ' +
  '    a.id_agendamento;';
open;
end;
end;


procedure TForm21.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  calendario.Visible:= false;
  CLBServicos.Visible:= false;
end;

procedure TForm21.FormShow(Sender: TObject);
begin
  AtualizarStatus;
with datamodule1.QueryAg do
begin
  close;
  SQL.Text :=
  'SELECT ' +
  '    a.id_agendamento, ' +
  '    c.nome_clie, ' +
  '    c.email_clie, ' +
  '    STRING_AGG(s.nome, '', '')::varchar(500) AS nome_servicos, ' +
  '    a.data_agendamento, ' +
  '    a.hora_inicio, ' +
  '    a.status ' +
  'FROM ' +
  '    agendamentos a ' +
  'INNER JOIN ' +
  '    clientes c ON a.id_clie = c.id_clie ' +
  'INNER JOIN ' +
  '    agendamento_servicos ags ON a.id_agendamento = ags.id_agendamento ' +
  'INNER JOIN ' +
  '    servicos s ON ags.id_servico = s.id_servico ' +
  'GROUP BY ' +
  '    a.id_agendamento, ' +
  '    c.nome_clie, ' +
  '    c.email_clie, ' +
  '    a.data_agendamento, ' +
  '    a.hora_inicio, ' +
  '    a.status ' +
  'ORDER BY ' +
  '    a.id_agendamento;';
open;
end;
  btnconf.Visible:= false;
  CLBHorarios.Visible := false;

end;

procedure TForm21.Image1Click(Sender: TObject);
begin
Form21.close;
Form20.show;
end;

procedure TForm21.LbCargosClick(Sender: TObject);
begin
  Form14.show;
end;

procedure TForm21.LbClieClick(Sender: TObject);
begin
Form4.Show;
end;

procedure TForm21.LbFornecedoresClick(Sender: TObject);
begin
  Form7.show;
end;

procedure TForm21.LbProfissionaisClick(Sender: TObject);
begin
  Form8.show;
end;

procedure TForm21.LbServicosClick(Sender: TObject);
begin
  Form15.show;
end;





procedure TForm21.TrazerHorariosDisponiveis(id_pro: Integer; DataSelecionada: TDateTime);
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


end.
