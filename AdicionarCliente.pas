unit AdicionarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm5 = class(TForm)
    Fundo: TPanel;
    Barra: TPanel;
    Image2: TImage;
    LbBS: TLabel;
    Image3: TImage;
    LbClientes: TLabel;
    LbHorarios: TLabel;
    LbMarketing: TLabel;
    LbFornecedores: TLabel;
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
    LbNome: TLabel;
    LbEmail: TLabel;
    LbCPF: TLabel;
    LbCEP: TLabel;
    LbNumero: TLabel;
    LbTele: TLabel;
    LbCidade: TLabel;
    LbBairro: TLabel;
    LbRua: TLabel;
    PbtnLimpar: TPanel;
    Image4: TImage;
    LbDashboard: TLabel;
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
    procedure LbClientesClick(Sender: TObject);
    procedure PbtnVoltarClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure FundoClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses CClientes;

procedure TForm5.FormCreate(Sender: TObject);
begin
  TirarMenu;
  Form5.WindowState:=wsMaximized;
end;

procedure TForm5.FundoClick(Sender: TObject);
begin
TirarMenu;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
Menu.Visible := True;
end;

procedure TForm5.LbClientesClick(Sender: TObject);
begin
  Form5.Hide;
  Form4.Show;
end;



procedure TForm5.PbtnVoltarClick(Sender: TObject);
begin
//  colocar condiçao do if e  ShowMessage('Cliente Cadastrado com Sucesso');
    Form5.Hide;
    Form4.Show;
end;


end.
