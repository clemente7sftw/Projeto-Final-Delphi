unit CClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,AdicionarCliente, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Skia, Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    Linha: TPanel;
    Image1: TImage;
    PbtnAddCliente: TPanel;
    Image2: TImage;
    Label5: TLabel;
    ListBox1: TListBox;
    CDados: TPanel;
    editar: TImage;
    Image3: TImage;
    Barra: TPanel;
    ImageLogo: TImage;
    Label1: TLabel;
    ImageUser: TImage;
    Clientes: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure PbtnAddClienteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses TelaPrincipalN1;

procedure TForm4.FormCreate(Sender: TObject);
begin
    Form4.WindowState:=wsMaximized;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form4.Hide;
end;

procedure TForm4.PbtnAddClienteClick(Sender: TObject);
begin
  Form5.Show;
  Form4.Hide;
end;

end.
