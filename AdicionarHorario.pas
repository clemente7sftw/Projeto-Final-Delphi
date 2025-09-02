unit AdicionarHorario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm13 = class(TForm)
    Fundo: TPanel;
    LbNome: TLabel;
    LbEmail: TLabel;
    LbCPF: TLabel;
    LbCEP: TLabel;
    LbNumero: TLabel;
    LbTele: TLabel;
    LbCidade: TLabel;
    LbRua: TLabel;
    Barra: TPanel;
    LogoBS: TImage;
    LbBS: TLabel;
    Image3: TImage;
    LbClientes: TLabel;
    LbHorarios: TLabel;
    LbMarketing: TLabel;
    LbFornecedores: TLabel;
    LbDashboard: TLabel;
    Panel3: TPanel;
    PbtnVoltar: TPanel;
    PbtnCadastrar: TPanel;
    EdNumero: TEdit;
    EdCEP: TEdit;
    EdNome: TEdit;
    EdEmail: TEdit;
    EdCPF: TEdit;
    EdCidade: TEdit;
    EdRua: TEdit;
    PbtnLimpar: TPanel;
    Image4: TImage;
    Label5: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

procedure TForm13.FormCreate(Sender: TObject);
begin
  Form13.WindowState:=wsMaximized;
end;

end.
