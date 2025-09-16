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
    LbNome: TLabel;
    LbSenha: TLabel;
    BtnCad: TPanel;
    EdEmail: TEdit;
    EdSenha: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    PbtnGoogle: TPanel;
    Image2: TImage;
    CheckBox2: TCheckBox;
    PbtnFacebook: TPanel;
    Image3: TImage;
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



uses Login, UDataModule, CadClie, CadEmp, UMetodos;
procedure TForm2.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
end;

procedure TForm2.BtnCadClick(Sender: TObject);
begin
  if TMetodos.ValidarEmail(EdEmail.Text) then
  begin
   if CheckBox1.Checked then
    begin
    Form19.Show;
    Form19.EdEmail.Text := EdEmail.Text;

    end else begin
    Form18.Show;
    Form18.EdEmail.Text := EdEmail.Text;
    end;
  end
  else
    ShowMessage('Insira um Email válido');


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
