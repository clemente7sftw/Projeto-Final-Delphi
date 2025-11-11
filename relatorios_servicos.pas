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
    RLLabel3: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText3: TRLDBText;
    DataSource1: TDataSource;
    RLImage1: TRLImage;
    RLImage2: TRLImage;
    RLDados_empresa: TRLDBText;
    RLDBText2: TRLDBText;
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
  id_empresa : integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm25.FormCreate(Sender: TObject);
begin
with DataModule1.Query_conexao do
begin
  Close;
  SQL.Text :=
    'SELECT s.nome, COUNT(ags.id_servico) AS total_feitos ' +
    'FROM agendamento_servicos ags ' +
    'INNER JOIN servicos s ON s.id_servico = ags.id_servico ' +
    'INNER JOIN agendamentos a ON a.id_agendamento = ags.id_agendamento ' +
    'GROUP BY s.nome ' +
    'ORDER BY total_feitos DESC';
  Open;
end;

DataSource1.DataSet := DataModule1.Query_conexao;
RLDBText1.DataSource := DataSource1;
RLDBText1.DataField  := 'nome';
RLDBText3.DataSource := DataSource1;
RLDBText3.DataField  := 'total_feitos';
end;





end.
