unit TelaPrincipalN1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CClientes, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Barra: TPanel;
    ImageLogo: TImage;
    Label1: TLabel;
    ImageUser: TImage;
    Clientes: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Linha: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure ClientesClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

procedure TForm3.FormCreate(Sender: TObject);
begin
    Form3.WindowState:=wsMaximized;
end;

procedure TForm3.ClientesClick(Sender: TObject);
begin
  Form4.Show;
end;
end.
