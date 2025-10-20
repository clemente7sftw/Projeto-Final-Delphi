unit TelaInicialN2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Image2: TImage;
    procedure Image2Click(Sender: TObject);
    procedure MudarSenha;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses CAdministrador;

procedure TForm5.Image2Click(Sender: TObject);
begin
MudarSenha;
end;

procedure TForm5.MudarSenha;
begin
Form22.show;
end;

end.
