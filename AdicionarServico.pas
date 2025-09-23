unit AdicionarServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm10 = class(TForm)
    Fundo: TPanel;
    EdNomeS: TEdit;
    EdDuracao: TEdit;
    EdPreco: TEdit;
    PVoltar: TPanel;
    PCad: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}
uses UMetodos, CServicos;

procedure TForm10.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;


procedure TForm10.PCadClick(Sender: TObject);
var NovaLinha: integer;
begin
  NovaLinha := Form15.GServicos.RowCount;
  Form15.GServicos.RowCount := NovaLinha + 1;
  Form15.GServicos.Cells[0, NovaLinha] := EdNomeS.Text;
  Form15.GServicos.Cells[1, NovaLinha] := EdDuracao.Text;
  Form15.GServicos.Cells[2, NovaLinha] := EdPreco.Text;
  Form15.show;

end;

end.
