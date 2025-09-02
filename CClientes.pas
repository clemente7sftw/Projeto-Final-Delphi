unit CClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,AdicionarCliente, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Skia, Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    Fundo: TPanel;
    Barra: TPanel;
    Logo: TImage;
    Label1: TLabel;
    Image5: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Panel3: TPanel;
    CDados: TPanel;
    editar: TImage;
    Image3: TImage;
    Image1: TImage;
    Label5: TLabel;
    ListBox1: TListBox;
    PbtnAdd: TPanel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure LogoClick(Sender: TObject);
    procedure FundoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure MostrarMenu;
    procedure TirarMenu;
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CFornecedores;

procedure TForm4.FormCreate(Sender: TObject);
begin
    ///Menu.Visible := False;
    Form4.WindowState:=wsMaximized;
end;

procedure TForm4.FundoClick(Sender: TObject);
begin
  TirarMenu;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form4.Hide;
end;

procedure TForm4.Label2Click(Sender: TObject);
begin
  Form4.Hide;
  Form3.Show;
end;

procedure TForm4.Label6Click(Sender: TObject);
begin
  Form4.Hide;
  Form7.Show;
end;

procedure TForm4.LogoClick(Sender: TObject);
begin
  MostrarMenu;
end;

procedure TForm4.MostrarMenu;
begin
  ///Menu.Visible := True;
end;

procedure TForm4.PbtnAddClick(Sender: TObject);
begin
  Form5.Show;
  Form4.Hide;
end;

procedure TForm4.TirarMenu;
begin
  ///Menu.Visible:= False;
end;

end.
