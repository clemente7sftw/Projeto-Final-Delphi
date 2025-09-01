unit CFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, AdicionarFornecedor, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Skia,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm7 = class(TForm)
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CClientes, AdicionarCliente;

procedure TForm7.FormCreate(Sender: TObject);
begin
  Form7.WindowState:=wsMaximized;
end;

procedure TForm7.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form7.Hide;
end;

procedure TForm7.Label2Click(Sender: TObject);
begin
  Form7.Hide;
  Form4.Show;
end;

procedure TForm7.PbtnAddClick(Sender: TObject);
begin
  Form6.Show;
  Form7.Hide;
end;

end.
