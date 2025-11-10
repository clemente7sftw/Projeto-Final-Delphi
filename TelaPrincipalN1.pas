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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);

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

procedure TForm3.FormCreate(Sender: TObject);
begin
    Form3.WindowState:=wsMaximized;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
with DataModule1.Query_conexao do
begin
  Close;
  SQL.Clear;
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
    'WHERE ' +
    '    a.id_clie = :id_clie ' +
    'GROUP BY ' +
    '    a.id_agendamento, ' +
    '    c.nome_clie, ' +
    '    c.email_clie, ' +
    '    a.data_agendamento, ' +
    '    a.hora_inicio, ' +
    '    a.status ' +
    'ORDER BY ' +
    '    a.id_agendamento;';

  ParamByName('id_clie').AsInteger := datamodule1.id_clie;
  Open;
  datasource1.DataSet := datamodule1.query_conexao;
  dbgrid1.DataSource := datasource1;
end;

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
