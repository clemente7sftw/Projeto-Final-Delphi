unit TelaPrincipalN1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, UDataModule, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm3 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    Image5: TImage;
    BS: TImage;
    Label1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    Image2: TImage;
    DataSource1: TDataSource;
    Barra: TPanel;
    ExclBtn: TImage;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Excluir;
    procedure ExclBtnClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses N1MudarSenha, n1_agendamentos, relatorios_servicos;

procedure TForm3.ExclBtnClick(Sender: TObject);
begin
Excluir;
end;

procedure TForm3.Excluir;
begin
var
  id_agendamento: Integer;
begin
  if DataModule1.Query_conexao.IsEmpty then
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
    id_agendamento := DataModule1.Query_conexao.FieldByName('id_agendamento').AsInteger;
    with DataModule1.Query_Aux do
    begin
      Close;
      SQL.Text := 'DELETE FROM agendamentos WHERE id_agendamento = :id_agendamento';
      ParamByName('id_agendamento').AsInteger := id_agendamento;
      ExecSQL;
    end;
  end;
   with datamodule1.Query_conexao do
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

end;

procedure TForm3.FormCreate(Sender: TObject);
begin
    Form3.WindowState:=wsMaximized;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
with DataModule1.Query_conexao do
begin
  Close;
  SQL.Text :=
    'SELECT ' +
    '    e.nome AS empresa, ' +
    '    p.nome AS profissional, ' +
    '    STRING_AGG(s.nome, '', '') AS servicos, ' +
    '    SUM(s.preco) AS preco, ' +
    '    a.data_agendamento, ' +
    '    a.hora_inicio ' +
    'FROM agendamentos a ' +
    'INNER JOIN clientes c ON a.id_clie = c.id_clie ' +
    'INNER JOIN agendamento_servicos ags ON a.id_agendamento = ags.id_agendamento ' +
    'INNER JOIN servicos s ON ags.id_servico = s.id_servico ' +
    'INNER JOIN profissionais_agendamentos pa ON pa.id_agendamento = a.id_agendamento ' +
    'INNER JOIN profissionais p ON pa.id_pro = p.id_pro ' +
    'INNER JOIN empresas e ON e.id_empresa = a.id_empresa ' +
    'WHERE a.id_clie = :id_clie ' +
    'GROUP BY e.nome, p.nome, a.data_agendamento, a.hora_inicio ' +
    'ORDER BY a.data_agendamento DESC, a.hora_inicio;';
  ParamByName('id_clie').AsInteger := DataModule1.id_clie;
  Open;

end;
  datasource1.DataSet := datamodule1.query_conexao;
  dbgrid1.DataSource := datasource1;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
Form24.show;
end;


procedure TForm3.Panel1Click(Sender: TObject);
begin
  Form26.show;
end;

end.
