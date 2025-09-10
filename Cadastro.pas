unit Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls;

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
    Edit2: TEdit;
    Edit3: TEdit;
    Edit1: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    PbtnFacebook: TPanel;
    Image3: TImage;
    PbtnGoogle: TPanel;
    Image2: TImage;
    procedure LbTemContaClick(Sender: TObject);
    procedure EdEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
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

procedure TForm2.Label2Click(Sender: TObject);
begin
  Form1.Show;
  Form2.close;
end;

procedure TForm2.LbTemContaClick(Sender: TObject);
begin
  Form2.close;
  Form1.Show;
end;

end.
