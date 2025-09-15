unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param;

type
  TForm2 = class(TForm)
    LadoEsquerdo: TPanel;
    ImagemDeFundo: TImage;
    LogoM: TImage;
    BS: TImage;
    LbUser: TLabel;
    LbNome: TLabel;
    LbSenha: TLabel;
    BtnCad: TPanel;
    EdEmail: TEdit;
    EdSenha: TEdit;
    EdNome: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    PbtnFacebook: TPanel;
    Image3: TImage;
    PbtnGoogle: TPanel;
    Image2: TImage;
    Label3: TLabel;
    procedure LbTemContaClick(Sender: TObject);
    procedure EdEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;


implementation

{$R *.dfm}

uses Login, UDataModule, CadClie;
procedure TForm2.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
end;

procedure TForm2.BtnCadClick(Sender: TObject);
begin
  Form2.Close;
  Form18.Show;
end;

procedure TForm2.EdEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
   perform(WM_NEXTDLGCTL,0,0);
end;



procedure TForm2.Label2Click(Sender: TObject);
begin
  Form1.Show;
  Form2.Close;
end;

procedure TForm2.LbTemContaClick(Sender: TObject);
begin
  Form2.Close;
  Form1.Show;
end;

end.
