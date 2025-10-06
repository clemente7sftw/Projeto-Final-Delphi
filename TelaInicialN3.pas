unit TelaInicialN3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.CheckLst;

type
  TForm20 = class(TForm)
    Label1: TLabel;
    Fundo: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    Label2: TLabel;
    Image4: TImage;
    BS: TImage;
    Image1: TImage;
    Barra: TPanel;
    Label3: TLabel;
    PaintBox1: TPaintBox;
    Button1: TButton;
    procedure LbClieClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure PaintBox1Paint(Sender: TObject);
  private
    { Private declarations }
    type
    TDadosGrafico = record
    Categoria: string;
    Valor: Integer;
    end;
    var  Dados: array[0..4] of TDadosGrafico;

  public
    { Public declarations }
  end;

var
  Form20: TForm20;


implementation

{$R *.dfm}

uses CClientes, CProfissionais, AdicionarServico, CServicos, AdicionarCliente,
  CCargos, CFornecedores, Cadastro, CHorarios, Agendamentos, UDataModule;
procedure TForm20.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
CarregarDashboard;
end;

procedure TForm20.Label3Click(Sender: TObject);
begin
Form13.show;
end;

procedure TForm20.LbCargosClick(Sender: TObject);
begin
  Form14.show;
end;

procedure TForm20.LbClieClick(Sender: TObject);
begin
  Form4.Show;
  Form20.Close;
end;

procedure TForm20.LbProfissionaisClick(Sender: TObject);
begin
  Form8.Show;
  Form20.Close;
end;

procedure TForm20.LbServicosClick(Sender: TObject);
begin
  Form15.show;
end;

procedure TForm20.PaintBox1Paint(Sender: TObject);
begin
var
  i, BarraLargura, MaxValor: Integer;
  var Escala: Double;
begin
  PaintBox1.Canvas.FillRect(PaintBox1.ClientRect);
  BarraLargura := PaintBox1.Width div Length(Dados);

  MaxValor := 0;
  for i := 0 to High(Dados) do
    if Dados[i].Valor > MaxValor then
      MaxValor := Dados[i].Valor;

  for i := 0 to High(Dados) do
  begin
    Escala := Dados[i].Valor / MaxValor;
    PaintBox1.Canvas.Brush.Color := clBlue;
    PaintBox1.Canvas.Rectangle(
      i * BarraLargura + 10,
      PaintBox1.Height - Round(Escala * PaintBox1.Height),
      (i + 1) * BarraLargura - 10,
      PaintBox1.Height
    );

    PaintBox1.Canvas.TextOut(
      i * BarraLargura + 10,
      PaintBox1.Height - 15,
      Dados[i].Categoria
    );
  end;
end;
end;

end.
