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
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form25: TForm25;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm25.FormCreate(Sender: TObject);
begin
Datamodule1.QueryTotalAg.close;
Datamodule1.QueryTotalAg.open;
end;

end.
