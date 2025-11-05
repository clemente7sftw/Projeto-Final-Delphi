unit relatorios_servicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Datasnap.DBClient,
  Vcl.Imaging.pngimage;

type
  TForm25 = class(TForm)
    RelatorioServicos: TRLReport;
    RLBHeader: TRLBand;
    RLBTitulo: TRLBand;
    RLBCabecalho: TRLBand;
    RLBConteudo: TRLBand;
    RLBFooter: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel2: TRLLabel;
    RLPeriodo: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    DataSource1: TDataSource;
    RLImage1: TRLImage;
    RLImage2: TRLImage;
    RLDados_empresa: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText4: TRLDBText;
    RLDBPeriodo1: TRLLabel;
    RLDBText5: TRLDBText;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLDBNome_empresa: TRLDBText;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;
  id_empresa:integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm25.FormCreate(Sender: TObject);
begin
with datamodule1.query_conexao do begin
Close;
SQL.Text :=
  'SELECT ' +
  '  s.nome AS nome_servico, ' +
  '  COUNT(ags.id_servico) AS quantidade_realizada ' +
  'FROM agendamento_servicos ags ' +
  'INNER JOIN agendamentos a ON ags.id_agendamento = a.id_agendamento ' +
  'INNER JOIN servicos s ON ags.id_servico = s.id_servico ' +
  'WHERE a.id_empresa = :id_empresa ' +
  'GROUP BY s.nome ' +
  'ORDER BY quantidade_realizada DESC;';
datamodule1.Query_Conexao.ParamByName('id_empresa').AsInteger := id_empresa;
Open;
datasource1.DataSet := datamodule1.query_conexao;
  DataSource1.DataSet := DataModule1.Query_Conexao;
RLDBText1.DataSource := DataSource1;
RLDBText1.DataField  := 'nome_servico';

RLDBText2.DataSource := DataSource1;
RLDBText2.DataField  := 'quantidade_realizada';
end;
end;

end.
