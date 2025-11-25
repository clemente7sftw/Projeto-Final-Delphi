unit relatorios_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage, Data.DB;

type
  TForm27 = class(TForm)
    RelatorioProfissionais: TRLReport;
    RLBHeader: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLImage1: TRLImage;
    RLImage2: TRLImage;
    RLBTitulo: TRLBand;
    RLLabel2: TRLLabel;
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
  Form27: TForm27;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm27.FormCreate(Sender: TObject);
begin
with DataModule1.Query_conexao do
begin
  Close;
  SQL.Text :=
    'SELECT ' +
    '  p.nome AS profissional, ' +
    '  COUNT(ags.id_servico) AS total_servicos, ' +
    '  COALESCE(SUM(s.preco), 0) AS renda_total ' +
    'FROM ' +
    '  profissionais p ' +
    'JOIN profissionais_agendamentos pa ON p.id_pro = pa.id_pro ' +
    'JOIN agendamento_servicos ags ON pa.id_agendamento = ags.id_agendamento ' +
    'JOIN servicos s ON ags.id_servico = s.id_servico ' +
    'WHERE p.id_empresa = :id_empresa ' +
    'GROUP BY p.nome ' +
    'ORDER BY renda_total DESC, p.nome;';
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
  RLDBText1.DataField  := 'profissional';
  RLDBText6.DataSource := DataSource1;
  RLDBText6.DataField  := 'total_servicos';
  RLDBText3.DataSource := DataSource1;
  RLDBText3.DataField  := 'renda_total';
  DataSource2.DataSet := DataModule1.queryempresa;
  RLDBNome_empresa.DataSource := datasource2;
  RLDBNome_empresa.DataField := 'nome';

end;

end.
