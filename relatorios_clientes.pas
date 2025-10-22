unit relatorios_clientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, RLReport, Data.DB, Datasnap.DBClient;

type
  TForm25 = class(TForm)
    RelatorioClientes: TRLReport;
    DSClie: TDataSource;
    RLBHeader: TRLBand;
    RLBTitulo: TRLBand;
    RLBCabecalho: TRLBand;
    RLBConteudo: TRLBand;
    RLBFooter: TRLBand;
    RLSystemInfo1: TRLSystemInfo;
    RLSystemInfo2: TRLSystemInfo;
    RLLabel1: TRLLabel;
    RLLabel2: TRLLabel;
    RLPeriodo: TRLLabel;
    RLLabel3: TRLLabel;
    RLLabel4: TRLLabel;
    RLLabel6: TRLLabel;
    RLDBText1: TRLDBText;
    RLDBText2: TRLDBText;
    RLDBText3: TRLDBText;
    ClientDataSet1: TClientDataSet;
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

end.
