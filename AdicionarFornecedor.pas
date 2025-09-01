unit AdicionarFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm6 = class(TForm)
    Fundo: TPanel;
    LbNome: TLabel;
    LbEmail: TLabel;
    LbCPF: TLabel;
    LbCEP: TLabel;
    LbNumero: TLabel;
    LbTele: TLabel;
    LbCidade: TLabel;
    LbBairro: TLabel;
    LbRua: TLabel;
    Barra: TPanel;
    Image2: TImage;
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
    EdTelefone: TEdit;
    EdNumero: TEdit;
    EdCEP: TEdit;
    EdNome: TEdit;
    Lupa: TPanel;
    Image1: TImage;
    EdEmail: TEdit;
    EdCPF: TEdit;
    EdCidade: TEdit;
    EdBairro: TEdit;
    EdRua: TEdit;
    PbtnLimpar: TPanel;
    Image4: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

procedure TForm6.FormCreate(Sender: TObject);
begin
  Form6.WindowState:=wsMaximized;
end;

end.
