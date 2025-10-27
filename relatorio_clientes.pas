unit relatorio_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage;

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
    RLDBText4: TRLDBText;
    RLDBPeriodo1: TRLLabel;
    RLDBText5: TRLDBText;
    RLSystemInfo3: TRLSystemInfo;
    RLSystemInfo4: TRLSystemInfo;
    RLLabel1: TRLLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form28: TForm28;

implementation

{$R *.dfm}

end.
