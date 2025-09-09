unit TelaPrincipalN1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CHorarios,CPacotesPromocionais, AdicionarPP, CCargos, CProfissionais ,CFornecedores,AdicionarCliente, AdicionarHorario, AdicionarProfissional, CServicos, CClientes, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Fundo: TPanel;
    Barra: TPanel;
    Image4: TImage;
    Label1: TLabel;
    Image5: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label15: TLabel;
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
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Image10: TImage;
    Image11: TImage;
    Image12: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure FundoClick(Sender: TObject);
    procedure LbnProfissionaisClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure LbnClientesClick(Sender: TObject);
    procedure LbnFornecedoresClick(Sender: TObject);
    procedure LbnHMClick(Sender: TObject);
    procedure LbnServicosClick(Sender: TObject);
    procedure LbnCargosClick(Sender: TObject);
    procedure LbnPPClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure MostrarMenu;
    procedure TirarMenu;

  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
    Form3.WindowState:=wsMaximized;
    TirarMenu;
end;

procedure TForm3.MostrarMenu;
begin
  Menu.Visible := True;
end;

procedure TForm3.TirarMenu;
begin
  Menu.Visible := False;
end;

procedure TForm3.FundoClick(Sender: TObject);
begin
  TirarMenu;
end;

procedure TForm3.Image4Click(Sender: TObject);
begin
  MostrarMenu;
end;

procedure TForm3.Label2Click(Sender: TObject);
begin
  Form4.Show;
  Form3.Hide;
end;

procedure TForm3.Label3Click(Sender: TObject);
begin
  Form3.Hide;
  Form17.Show;
end;

procedure TForm3.Label5Click(Sender: TObject);
begin
  Form7.Show;
  Form3.Hide;
end;


procedure TForm3.Label6Click(Sender: TObject);
begin
  Form3.Hide;
  Form7.Show;
end;

procedure TForm3.LbnCargosClick(Sender: TObject);
begin
  Form3.Hide;
  Form14.Show;
end;

procedure TForm3.LbnClientesClick(Sender: TObject);
begin
  Form4.Show;
  Form3.Hide;
end;

procedure TForm3.LbnFornecedoresClick(Sender: TObject);
begin
  Form3.Hide;
  Form7.Show;
end;

procedure TForm3.LbnHMClick(Sender: TObject);
begin
  Form3.Hide;
  Form17.Show;
end;

procedure TForm3.LbnPPClick(Sender: TObject);
begin
  Form3.Hide;
  Form16.Show;
end;

procedure TForm3.LbnProfissionaisClick(Sender: TObject);
begin
  Form8.Show;
  Form3.Hide;
end;

procedure TForm3.LbnServicosClick(Sender: TObject);
begin
  Form3.Hide;
  Form15.Show;
end;

end.
