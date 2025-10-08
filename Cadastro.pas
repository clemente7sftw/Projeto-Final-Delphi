unit Cadastro;

interface

uses
  Winapi.Windows, System.RegularExpressions, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Param,Winapi.ShellAPI;

type
  TForm2 = class(TForm)
    LadoEsquerdo: TPanel;
    ImagemDeFundo: TImage;
    LogoM: TImage;
    BS: TImage;
    LbNome: TLabel;
    LbSenha: TLabel;
    BtnCad: TPanel;
    EdSenha: TEdit;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Label2: TLabel;
    PbtnGoogle: TPanel;
    Image2: TImage;
    CheckBox2: TCheckBox;
    PbtnFacebook: TPanel;
    Image3: TImage;
    PnlEscsenha: TPanel;
    imgsenha: TImage;
    EdEmail: TEdit;
    Label3: TLabel;
    LbErro: TLabel;
    LbTermos: TLabel;
    LbSenhaErro: TLabel;
    procedure LbTemContaClick(Sender: TObject);
    procedure EdEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure imgsenhaClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);

  private
    { Private declarations }
  public

  end;

var
  Form2: TForm2;



implementation

{$R *.dfm}



uses Login, UDataModule, CadClie, CadEmp, UMetodos;

procedure TForm2.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  EdSenha.PasswordChar := '*';
  lberro.Visible:= false;
  LbTermos.Visible:= false;
  Lbsenhaerro.Visible:= false;

end;


procedure TForm2.imgsenhaClick(Sender: TObject);
begin
if not Form1.MudarImg then
  begin
    imgsenha.Picture.LoadFromFile('C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\assets\versenha.png');
    Form1.MudarImg := true;
    EdSenha.PasswordChar := #0;
  end else begin
    imgsenha.Picture.LoadFromFile('C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\assets\escsenha.png');
    Form1.MudarImg := false;
    EdSenha.PasswordChar := '*';
  end;
end;

procedure TForm2.BtnCadClick(Sender: TObject);
begin
   if CheckBox1.Checked then
    begin
      if tmetodos.ValidarEmail (EdEmail.Text) then
         if edsenha.text <> '' then
         begin
           if CheckBox2.Checked then
            begin
              if Length(EdSenha.Text) >= 5  then
              begin
              Form19.Show;
              Form19.EdEmail.Text := EdEmail.Text;
              LbTermos.Visible:= false;
              Lberro.Visible:= false;
              end else begin
              Lbsenhaerro.Visible:= true;
              end;
              end else begin
                LbTermos.Visible:= true;
              end;
          end else begin
            Lbsenhaerro.Visible:= true;
         end else
       begin
        Lbsenhaerro.Visible:= false;
       end;
    end;
    if not checkbox1.Checked then
    begin
      if checkbox2.Checked then
      begin
        if tmetodos.ValidarEmail (EdEmail.Text) then
        if edsenha.text <> '' then
        begin
          Form18.Show;
          Form18.EdEmail.Text := EdEmail.Text;
          lberro.Visible:= false;
          LbTermos.Visible:= false;
          end else begin
          lberro.Visible:= true;
        end else
        begin
          lberro.Visible:=true;
        end;
      end else begin
        lbtermos.Visible:= true;
      end;
    end;
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

procedure TForm2.Label3Click(Sender: TObject);
begin
ShellExecute(0, 'open', 'file:///C:/Users/gabri/OneDrive/Documentos/Termos-e-condicoes-BS/termos%20bs/termosecondicoes.html', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm2.LbTemContaClick(Sender: TObject);
begin
  Form2.Close;
  Form1.Show;
end;


end.
