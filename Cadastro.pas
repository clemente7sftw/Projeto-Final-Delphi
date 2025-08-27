unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm2 = class(TForm)
    LadoEsquerdo: TPanel;
    ImagemDeFundo: TImage;
    Image1: TImage;
    LbBeautyStage: TLabel;
    LbEmail: TLabel;
    LbCadastreseCom: TLabel;
    LbLogin: TLabel;
    LbTemConta: TLabel;
    LbSenha: TLabel;
    EdEmail: TEdit;
    EdSenha: TEdit;
    PbtnCadastrar: TPanel;
    PbtnFacebook: TPanel;
    Image3: TImage;
    PbtnGoogle: TPanel;
    Image2: TImage;
    procedure LbTemContaClick(Sender: TObject);
    procedure EdEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}

uses Login;

procedure TForm2.EdEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
   perform(WM_NEXTDLGCTL,0,0);
end;

procedure TForm2.FormCreate(Sender: TObject);
begin
    Form2.WindowState:=wsMaximized;
end;

procedure TForm2.LbTemContaClick(Sender: TObject);
begin
  Form2.Hide;
  Form1.Show;
end;

end.
