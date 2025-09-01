unit TelaPrincipalN1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,CFornecedores,AdicionarCliente, CClientes, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm3 = class(TForm)
    Barra: TPanel;
    Image2: TImage;
    Label1: TLabel;
    Image3: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label15: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
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

procedure TForm3.Label2Click(Sender: TObject);
begin
  Form4.Show;
  Form3.Hide;
end;

procedure TForm3.Label5Click(Sender: TObject);
begin
  Form7.Show;
  Form3.Hide;
end;

end.
