unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, UMetodos,TelaPrincipalN1, Cadastro, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, CServicos, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TForm1 = class(TForm)
    LadoEsquerdo: TPanel;
    ImagemDeFundo: TImage;
    BS: TImage;
    BtnEnt: TPanel;
    EdSenha: TEdit;
    LogoM: TImage;
    PbtnFacebook: TPanel;
    Image3: TImage;
    PbtnGoogle: TPanel;
    Image2: TImage;
    Image1: TImage;
    LbUser: TLabel;
    LbSenha: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    PnlEscsenha: TPanel;
    imgsenha: TImage;
    EdEmail: TEdit;
    procedure PbtnEntrarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure imgsenhaClick(Sender: TObject);
    procedure BtnEntClick(Sender: TObject);
  private
    { Private declarations }
  public
    MudarImg : Boolean;
  end;

var
  Form1: TForm1;
 

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm1.FormCreate(Sender: TObject);
begin
    WindowState:=wsMaximized;
    EdSenha.PasswordChar := '*';
end;


procedure TForm1.imgsenhaClick(Sender: TObject);
begin
if not MudarImg then
  begin
    imgsenha.Picture.LoadFromFile('C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\assets\versenha.png');
    MudarImg := true;
    EdSenha.PasswordChar := #0;
  end else begin
    imgsenha.Picture.LoadFromFile('C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\assets\escsenha.png');
    MudarImg := false;
    EdSenha.PasswordChar := '*';
  end;
end;

procedure TForm1.BtnEntClick(Sender: TObject);
begin
//if TMetodos.ValidarEmail(EdEmail.Text) then
// begin
// if EdSenha.Text <> '' then
//  begin
//     with DataModule1.FDQueryClientes do
//    begin
//      Close;
//      SQL.Text := 'SELECT * FROM clientes_cad WHERE email_clie = :email AND senha_clie = :senha';
//     ParamByName('email').AsString := EdEmail.Text;
//     ParamByName('senha').AsString := EdSenha.Text;
//      Open;
//
//    if not IsEmpty then
//    begin
      Form15.show;
//   end else begin
//         Showmessage('Email ou senha inválidos!');
//       end;
//   end;
//   end else begin
//       Showmessage('Digite sua senha');
//   end;
//
// end else begin
//   Showmessage('Digite seu endereço de e-mail ');
//end;
end;



procedure TForm1.Label2Click(Sender: TObject);
begin
  Form2.Show;
end;


procedure TForm1.PbtnEntrarClick(Sender: TObject);
begin
  Form3.Show;
end;

end.
