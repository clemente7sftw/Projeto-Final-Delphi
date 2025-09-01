unit CClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,AdicionarCliente, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Skia, Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    Image1: TImage;
    PbtnAddCliente: TPanel;
    Image2: TImage;
    Label5: TLabel;
    ListBox1: TListBox;
    CDados: TPanel;
    editar: TImage;
    Image3: TImage;
    Barra: TPanel;
    Image4: TImage;
    Label1: TLabel;
    Image5: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    Panel3: TPanel;
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
