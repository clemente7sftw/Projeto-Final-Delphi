unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm9 = class(TForm)
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
    Panel3: TPanel;
    EdBairro: TEdit;
    EdCEP: TEdit;
    EdCidade: TEdit;
    EdCPF: TEdit;
    EdEmail: TEdit;
    EdNome: TEdit;
    EdNumero: TEdit;
    EdRua: TEdit;
    EdTelefone: TEdit;
    LbBairro: TLabel;
    LbCEP: TLabel;
    LbCidade: TLabel;
    LbCPF: TLabel;
    LbEmail: TLabel;
    LbNome: TLabel;
    LbNumero: TLabel;
    LbRua: TLabel;
    LbTele: TLabel;
    Lupa: TPanel;
    Image1: TImage;
    PbtnCadastrar: TPanel;
    PbtnLimpar: TPanel;
    Image4: TImage;
    PbtnVoltar: TPanel;
    Menu: TPanel;
    LbnSalao: TLabel;
    LbnClientes: TLabel;
    LbnFornecedores: TLabel;
    LbnHM: TLabel;
    LbnMarketing: TLabel;
    LbnDB: TLabel;
    LbnProfissionais: TLabel;
    LbnServicos: TLabel;
    LbnCargos: TLabel;
    LbnPP: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PbtnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure MostrarMenu;
    procedure TirarMenu;
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses UMetodos;
procedure TForm9.FormCreate(Sender: TObject);
begin
  Form9.WindowState:=wsMaximized;
  TirarMenu;

end;

procedure TForm9.MostrarMenu;
begin
  Menu.Visible := True;
end;

procedure TForm9.PbtnCadastrarClick(Sender: TObject);
begin
TMetodos.MensagemCadSucesso;
end;

procedure TForm9.TirarMenu;
begin
  Menu.Visible := False;
end;

end.
