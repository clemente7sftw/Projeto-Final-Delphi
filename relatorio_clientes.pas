unit relatorio_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage, Data.DB;

type
  TForm28 = class(TForm)
    RelatorioClientes: TRLReport;
    RLBHeader: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLImage1: TRLImage;
    RLImage2: TRLImage;
    RLBTitulo: TRLBand;
    RLLabel2: TRLLabel;
    RLPeriodo: TRLLabel;
    RLDBNome_empresa: TRLDBText;
    RLBCabecalho: TRLBand;
    RLLabel3: TRLLabel;
    RLLabel6: TRLLabel;
    RLBConteudo: TRLBand;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    RLBFooter: TRLBand;
    RLDados_empresa: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText5: TRLDBText;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLDBText6: TRLDBText;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_empresa:integer;
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

uses UDataModule;



procedure TForm28.FormCreate(Sender: TObject);
begin
  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'SELECT ' +
      '  c.nome_clie AS nome_clie, ' +
      '  COUNT(DISTINCT a.id_agendamento) AS total_agendamentos, ' +
      '  COALESCE(SUM(s.preco), 0) AS total_rendido ' +
      'FROM agendamentos a ' +
      'INNER JOIN clientes c ON c.id_clie = a.id_clie ' +
      'LEFT JOIN agendamento_servicos ags ON ags.id_agendamento = a.id_agendamento ' +
      'LEFT JOIN servicos s ON s.id_servico = ags.id_servico ' +
      'WHERE a.status = true ' +
      '  AND a.id_empresa = :id_empresa ' +
      'GROUP BY c.nome_clie ' +
      'ORDER BY total_rendido DESC';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
  end;


with DataModule1.QueryEmpresa do
begin
  Close;
  SQL.Text := 'SELECT nome FROM empresas WHERE id_empresa = :id_empresa';
  ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
end;

  DataSource1.DataSet := DataModule1.query_conexao;
  RLDBText1.DataSource := DataSource1;
  RLDBText1.DataField  := 'nome_clie';
  RLDBText6.DataSource := DataSource1;
  RLDBText6.DataField  := 'total_agendamentos';
  RLDBText3.DataSource := DataSource1;
  RLDBText3.DataField  := 'total_rendido';
  DataSource2.DataSet := DataModule1.queryempresa;
  RLDBNome_empresa.DataSource := datasource2;
  RLDBNome_empresa.DataField := 'nome';

end;

end.
