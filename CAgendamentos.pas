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
    ExclBtn: TImage;
    EditBtn: TImage;
    btncancelar: TImage;
    Image4: TImage;
    BS: TImage;
    Label3: TLabel;
    Label4: TLabel;
    addbtn: TImage;
    BtnConf: TPanel;
    Image1: TImage;
    LbPro: TLabel;
    Timer1: TTimer;
    DBEdit3: TDBEdit;
    Label2: TLabel;
    Label8: TLabel;
    Timer2: TTimer;
    Label1: TLabel;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    Lbagendamentos: TLabel;
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizarStatus;
    procedure Excluir;
    procedure Adicionar;
    procedure Editar;
    procedure Confirmar;
    procedure editsativos;
    procedure editsinativos;
    procedure erro_horario;
    procedure erro;
    procedure cancelar;
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
    procedure btncancelarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);


  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

var dataselecionada: TDatetime;
var i, ServicoSelecionado, id_agendamento, id_servico:integer;

implementation

{$R *.dfm}

uses UDataModule, Agendamentos, TelaInicialN3, CClientes, CProfissionais,
  CServicos, CCargos, CFornecedores, n2_agendamentos;

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
procedure TForm21.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  calendario.Visible:= false;
  label1.Visible:= false;
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
  label8.Visible:= false;
  editsinativos;
  btncancelar.Visible:= false;
end;

procedure TForm21.BtnAddClick(Sender: TObject);
begin
form13.show;
form21.close;
end;

procedure TForm21.btncancelarClick(Sender: TObject);
begin
cancelar;
end;

procedure TForm21.BtnEditarClick(Sender: TObject);
begin
  btnconf.Visible := True;
  calendario.Visible := True;
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

procedure TForm21.cancelar;
begin
btncancelar.Visible:= false;
editsinativos;
BtnConf.Visible:= false;
calendario.Visible:= false;
addbtn.Visible := true;
exclbtn.Visible:= true;
editbtn.Visible:= true;
end;



procedure TForm21.Confirmar;
var
  DataSelecionada, HoraSelecionada, DataHoraCompleta: TDateTime;
  i: Integer;
  hora_inicio: TDateTime;
begin
  editsinativos;
  DataSelecionada := calendario.Date;
  with DataModule1.QueryAg do
  begin
    Edit;
    FieldByName('data_agendamento').AsDateTime := DataSelecionada;

    Post;
  end;
    btnconf.Visible := False;
    calendario.Visible := False;
    addbtn.Visible := true;
    exclbtn.Visible:= true;
    editbtn.Visible:= true;
    AtualizarStatus;
    btncancelar.Visible:= false;
end;

procedure TForm21.Editar;
var
  id_pro: Integer;
begin
  btnconf.Visible := True;
  calendario.Visible := True;
  addbtn.Visible := false;
  exclbtn.Visible:= false;
  editbtn.Visible:= false;
  btncancelar.Visible:= true;
  dataselecionada := DataModule1.QueryAg.FieldByName('data_agendamento').AsDateTime;
  Calendario.Date := dataselecionada;
end;


procedure TForm21.EditBtnClick(Sender: TObject);
begin
Editar;
end;

procedure TForm21.editsativos;
begin
dbedit1.Enabled := true;
dbedit2.Enabled := true;
end;

procedure TForm21.editsinativos;
begin
dbedit1.Enabled := false;
dbedit2.Enabled := false;
end;


procedure TForm21.erro;
begin
Label1.visible:= true;
Timer2.Enabled := true;
end;

procedure TForm21.erro_horario;
begin
Label8.visible:= true;
Timer1.Enabled := true;
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
    Exit;

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
      SQL.Text := 'DELETE FROM agendamento_servicos WHERE id_agendamento = :id';
      ParamByName('id').AsInteger := id_agendamento;
      ExecSQL;
      Close;
      SQL.Text := 'DELETE FROM profissionais_agendamentos WHERE id_agendamento = :id';
      ParamByName('id').AsInteger := id_agendamento;
      ExecSQL;

      Close;
      SQL.Text := 'DELETE FROM agendamentos WHERE id_agendamento = :id';
      ParamByName('id').AsInteger := id_agendamento;
      ExecSQL;
    end;

  end;

  with DataModule1.QueryAg do
  begin
    Close;
    SQL.Text :=
      'SELECT ' +
      '    a.id_agendamento, ' +
      '    c.nome_clie, ' +
      '    c.email_clie, ' +
      '    STRING_AGG(s.nome, '', '')::varchar(500) AS nome_servicos, ' +
      '    a.data_agendamento, ' +
      '    a.hora_inicio, ' +
      '    a.status ' +
      'FROM agendamentos a ' +
      'INNER JOIN clientes c ON a.id_clie = c.id_clie ' +
      'INNER JOIN agendamento_servicos ags ON a.id_agendamento = ags.id_agendamento ' +
      'INNER JOIN servicos s ON ags.id_servico = s.id_servico ' +
      'WHERE a.id_empresa = :id_empresa ' +
      'GROUP BY a.id_agendamento, c.nome_clie, c.email_clie, ' +
      '         a.data_agendamento, a.hora_inicio, a.status ' +
      'ORDER BY a.id_agendamento;';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
  end;
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




procedure TForm21.Timer1Timer(Sender: TObject);
begin
label8.Visible:= false;
Timer1.Enabled := false;
end;

procedure TForm21.Timer2Timer(Sender: TObject);
begin
label1.Visible:= false;
Timer2.Enabled := false;
end;



end.
