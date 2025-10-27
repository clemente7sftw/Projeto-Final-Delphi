unit relatorios_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Vcl.Imaging.pngimage;

type
  TForm27 = class(TForm)
    RelatorioServicos: TRLReport;
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form27: TForm27;

implementation

{$R *.dfm}

end.
