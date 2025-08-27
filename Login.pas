unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, UMetodos,TelaPrincipalN1, Cadastro, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    LadoEsquerdo: TPanel;
    ImagemDeFundo: TImage;
    EdEmail: TEdit;
    EdSenha: TEdit;
    Image1: TImage;
    LbBeautyStage: TLabel;
    LbEmail: TLabel;
    LbEsqSenha: TLabel;
    LbFacaLoginCom: TLabel;
    LbLogin: TLabel;
    LbNaoTemConta: TLabel;
    LbSenha: TLabel;
    PbtnEntrar: TPanel;
    PbtnFacebook: TPanel;
    Image3: TImage;
    PbtnGoogle: TPanel;
    Image2: TImage;
    procedure EdEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure LbNaoTemContaClick(Sender: TObject);
    procedure PbtnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}


procedure TForm1.FormCreate(Sender: TObject);
begin
    Form1.WindowState:=wsMaximized;
end;

procedure TForm1.EdEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
   perform(WM_NEXTDLGCTL,0,0);
end;

procedure TForm1.LbNaoTemContaClick(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.PbtnEntrarClick(Sender: TObject);
begin
  Form3.Show;
end;

end.
