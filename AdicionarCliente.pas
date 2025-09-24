unit AdicionarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Skia;

type
  TForm5 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure PbtnVoltarClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses CClientes, UMetodos, CFornecedores;

procedure TForm5.FormCreate(Sender: TObject);
begin

  Form5.WindowState:=wsMaximized;
end;


procedure TForm5.Image1Click(Sender: TObject);
begin
  Form5.Close;
  Form4.Show;
end;

procedure TForm5.LbFornecedoresClick(Sender: TObject);
begin
  Form5.Hide;
  Form7.Show;
end;

procedure TForm5.PbtnVoltarClick(Sender: TObject);
begin
    Form5.Hide;
    Form4.Show;
end;

end.
