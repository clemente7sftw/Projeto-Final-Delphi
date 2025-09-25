unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage;

type
  TForm9 = class(TForm)
    Fundo: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PbtnCadastrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses UMetodos;
procedure TForm9.FormCreate(Sender: TObject);
begin
  Form9.WindowState:=wsMaximized;


end;

procedure TForm9.PbtnCadastrarClick(Sender: TObject);
begin
TMetodos.MensagemCadSucesso;
end;



end.
