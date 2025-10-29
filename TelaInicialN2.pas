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
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Image2: TImage;
    Label2: TLabel;
    BS: TImage;
    procedure Image2Click(Sender: TObject);
    procedure MudarSenha;
    procedure FormShow(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses CAdministrador, UDataModule, n2_cclientes;

procedure TForm5.FormShow(Sender: TObject);
begin
 WindowState := wsMaximized;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
MudarSenha;
end;

procedure TForm5.LbClieClick(Sender: TObject);
begin
Form29.Show;
end;

procedure TForm5.MudarSenha;
begin
Form22.show;
end;

end.
