unit AdicionarServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm10 = class(TForm)
    Fundo: TPanel;
    Barra: TPanel;
    LogoBS: TImage;
    LbBS: TLabel;
    Image3: TImage;
    LbClientes: TLabel;
    LbHorarios: TLabel;
    LbMarketing: TLabel;
    LbFornecedores: TLabel;
    LbDashboard: TLabel;
    EdCEP: TEdit;
    EdEmail: TEdit;
    EdNome: TEdit;
    LbCEP: TLabel;
    LbEmail: TLabel;
    LbNome: TLabel;
    PbtnCadastrar: TPanel;
    PbtnVoltar: TPanel;
    PbtnAdd: TPanel;
    Image2: TImage;
    Image1: TImage;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}

end.
