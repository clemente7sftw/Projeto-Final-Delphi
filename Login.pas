unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, UMetodos,TelaPrincipalN1, Cadastro, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, CServicos, Data.DB, Vcl.Mask, Vcl.DBCtrls, ShellAPI;

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
    LbErro: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure imgsenhaClick(Sender: TObject);
    procedure BtnEntClick(Sender: TObject);
    procedure EdEmailChange(Sender: TObject);
    procedure testeClick(Sender: TObject);
    procedure Login;
    procedure erro;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EdEmailKeyPress(Sender: TObject; var Key: Char);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    MudarImg : Boolean;
  end;

var
  Form1: TForm1;




implementation

{$R *.dfm}

uses UDataModule, TelaInicialN3, CClientes,
  CHorarios, TelaInicialN2;

procedure TForm1.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  EdSenha.PasswordChar := '*';
  LbErro.Visible:= false;
end;

procedure TForm1.EdEmailChange(Sender: TObject);
begin
  LbErro.Visible := False;
end;

procedure TForm1.EdEmailKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure TForm1.erro;
begin
LbErro.visible:= true;
Timer1.Enabled := true;
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
Login;
end;

procedure TForm1.Label2Click(Sender: TObject);
begin
  Form2.Show;
end;

procedure TForm1.Login;
var
  LoginCorreto: Boolean;
  id_empresa:integer;
begin
  if not TMetodos.ValidarEmail(EdEmail.Text) or (EdSenha.Text = '') then
  begin
    LbErro.Visible := True;
    Exit;
  end;

  LoginCorreto := False;

  with DataModule1.query_conexao do
  begin
  try
        Close;
      SQL.Text := 'SELECT * FROM clientes WHERE email_clie = :email AND senha_clie = :senha';
      ParamByName('email').AsString := EdEmail.Text;
      ParamByName('senha').AsString := EdSenha.Text;
      Open;

      if not IsEmpty then
      begin
        Form3.Show;
        LoginCorreto := True;
        Exit;
      end;
  except
  erro;
  end;
  end;
  with DataModule1.query_conexao do
  begin
  try
    Close;
    SQL.Text := 'SELECT * FROM empresas WHERE email = :email AND senha = :senha';
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('senha').AsString := EdSenha.Text;
    Open;

    if not IsEmpty then
    begin
    DataModule1.id_empresa := FieldByName('id_empresa').AsInteger;
    Form20.Show;
    LoginCorreto := True;
    Exit;
    end;
  except
  erro;

  end;
  end;
  with DataModule1.query_conexao do
  begin
    try
    Close;
    SQL.Text := 'SELECT * FROM administradores WHERE email_adm = :email AND senha_adm = :senha';
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('senha').AsString := EdSenha.Text;
    Open;

    if not IsEmpty then
    begin
    DataModule1.id_adm := FieldByName('id_adm').AsInteger;
    Form5.Show;
    LoginCorreto := True;
    Exit;
    end;
    except
    erro;

    end;
  end;
  if not LoginCorreto then
    begin
      erro;
    end;

end;

procedure TForm1.testeClick(Sender: TObject);
begin
 ShellExecute(0, 'open', 'file:///C:/Users/gabri/OneDrive/Documentos/Termos-e-condicoes-BS/termos%20bs/termosecondicoes.html', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
LbErro.visible:= false;
Timer1.Enabled := false;
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
if Application.MessageBox('Tem certeza de que deseja sair da aplicação?', 'Sair', MB_YESNO + MB_ICONQUESTION) = IDYES then
begin
  Action := caFree;
end else begin
  Action := caNone;
end;
end;


end.
