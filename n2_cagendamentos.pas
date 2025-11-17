unit n2_cagendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Skia, Vcl.Imaging.pngimage, System.DateUtils;

type
  TForm32 = class(TForm)
    DataSource1: TDataSource;
    Fundo: TPanel;
    ExclBtn: TImage;
    EditBtn: TImage;
    btncancelar: TImage;
    Label3: TLabel;
    Label4: TLabel;
    addbtn: TImage;
    Image1: TImage;
    LbPro: TLabel;
    Label2: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    calendario: TMonthCalendar;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    BtnConf: TPanel;
    CLBHorarios: TCheckListBox;
    DBEdit3: TDBEdit;
    Timer1: TTimer;
    Image4: TImage;
    BS: TImage;
    Panel2: TPanel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AtualizarStatus;
    procedure Excluir;
    procedure Editar;
    procedure Confirmar;
    procedure editsativos;
    procedure editsinativos;
    procedure erro_horario;
    procedure cancelar;
    procedure adicionar;
    procedure TrazerHorariosDisponiveis(id_pro: Integer; DataSelecionada: TDateTime);
    procedure addbtnClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form32: TForm32;
  var  dataselecionada: TDatetime;
var  i, ServicoSelecionado, id_agendamento, id_servico:integer;
implementation

{$R *.dfm}

uses UDataModule, n2_agendamentos;

procedure TForm32.addbtnClick(Sender: TObject);
begin
Adicionar;
end;

procedure TForm32.adicionar;
begin
form34.show;
form32.close;
end;

procedure TForm32.AtualizarStatus;
begin
with DataModule1.Query_conexao do
begin
  Close;
  SQL.Text :=
    'UPDATE agendamentos ' +
    'SET status = CASE ' +
    '               WHEN data_agendamento < NOW() THEN TRUE ' +
    '               ELSE FALSE ' +
    '             END ' +
    'WHERE status <> ( ' +
    '        CASE ' +
    '          WHEN data_agendamento < NOW() THEN TRUE ' +
    '          ELSE FALSE ' +
    '        END ' +
    '      )';
  ExecSQL;
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

procedure TForm32.btncancelarClick(Sender: TObject);
begin
cancelar;
end;

procedure TForm32.BtnConfClick(Sender: TObject);
begin
Confirmar;
end;

procedure TForm32.cancelar;
begin
editsinativos;
BtnConf.Visible:= false;
CLBHorarios.Visible:= false;
calendario.Visible:= false;
addbtn.Visible := true;
exclbtn.Visible:= true;
editbtn.Visible:= true;
end;

procedure TForm32.Confirmar;
var
  DataSelecionada, HoraSelecionada, DataHoraCompleta: TDateTime;
  i: Integer;
  hora_inicio: TDateTime;
begin
  editsinativos;

  DataSelecionada := calendario.Date;

  if CLBHorarios.ItemIndex = -1 then
  begin
    erro_horario;
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
  btnconf.Visible := False;
  calendario.Visible := False;
  CLBHorarios.Visible := false;
  addbtn.Visible := true;
  exclbtn.Visible:= true;
  editbtn.Visible:= true;
  AtualizarStatus;
end;

procedure TForm32.Editar;
var
  id_pro: Integer;
begin
  btnconf.Visible := True;
  calendario.Visible := True;
  CLBHorarios.Visible:= true;
  addbtn.Visible := false;
  exclbtn.Visible:= false;
  editbtn.Visible:= false;

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
//      ShowMessage('Não foi possível identificar o profissional deste agendamento.');
  end;
end;

procedure TForm32.EditBtnClick(Sender: TObject);
begin
editar;
end;

procedure TForm32.editsativos;
begin
dbedit1.Enabled := true;
dbedit2.Enabled := true;
end;

procedure TForm32.editsinativos;
begin
dbedit1.Enabled := false;
dbedit2.Enabled := false;
end;

procedure TForm32.erro_horario;
begin
Label8.visible:= true;
Timer1.Enabled := true;
end;

procedure TForm32.ExclBtnClick(Sender: TObject);
begin
excluir;
end;

procedure TForm32.Excluir;
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

procedure TForm32.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  calendario.Visible:= false;
end;

procedure TForm32.FormShow(Sender: TObject);
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
  Label8.Visible:= false;
  editsinativos;

end;

procedure TForm32.Timer1Timer(Sender: TObject);
begin
Label8.visible:= false;
Timer1.Enabled := false;
end;

procedure TForm32.TrazerHorariosDisponiveis(id_pro: Integer;
  DataSelecionada: TDateTime);
var
  horaAtual, horaFim: TTime;
  intervalo: TTime;
  diaSemana: Integer;
begin
  CLBHorarios.Clear;
  CLBHorarios.Visible := False;

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

      CLBHorarios.Visible := (CLBHorarios.Items.Count > 0);
    end
    else
    begin
      CLBHorarios.Clear;
      CLBHorarios.Visible := False;

      calendario.Visible := false;
      editsinativos;
      btnconf.Visible := false;

    end;
  end;
end;
end.
