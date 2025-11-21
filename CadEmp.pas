unit CadEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask;

type
  TForm19 = class(TForm)
    Fundo: TImage;
    Image1: TImage;
    BS: TImage;
    EdBairro: TEdit;
    EdCEP: TEdit;
    EdCidade: TEdit;
    EdEstado: TEdit;
    EdEmail: TEdit;
    EdNome: TEdit;
    EdRua: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    LbUser: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BtnCad: TPanel;
    PnlLupa: TPanel;
    Image2: TImage;
    MaskCnpj: TMaskEdit;
    Timer1: TTimer;
    Lblrequired: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Cadastrar;
    procedure Erro;
    procedure Image2Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

uses uDmCep, UDataModule, UMetodos, Cadastro, TelaInicialN3, Login;

procedure TForm19.BtnCadClick(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm19.Cadastrar;
begin
try
 with DataModule1.query_conexao do
   begin
    SQL.Text := 'INSERT INTO empresas (nome, email, senha, cnpj, cep, rua, bairro, cidade, estado ) ' +
                'VALUES (:nome, :email, :senha, :cnpj, :cep, :rua, :bairro, :cidade, :estado)';
    ParamByName('nome').AsString := EdNome.Text;
    ParamByName('senha').AsString := TMetodos.MD5(Form2.EdSenha.Text);
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('cnpj').AsString := MaskCnpj.Text;
    ParamByName('cep').AsString := EdCEP.Text;
    ParamByName('rua').AsString := EdRua.Text;
    ParamByName('bairro').AsString := EdBairro.Text;
    ParamByName('cidade').AsString := EdCidade.Text;
    ParamByName('estado').AsString := EdEstado.Text;
    ExecSQL;
  end;
  Form19.close;
  Form2.close;
  Form1.show;
  except
  erro;
  end;
end;

procedure TForm19.Erro;
begin
  Lblrequired.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
MaskCnpj.EditMask:= '99.999.999/9999-99';
MaskCnpj.Text := '';
lblrequired.visible := false;
end;

procedure TForm19.Image2Click(Sender: TObject);
begin
  DMCep.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DMCep.RESTRequest1.Execute;
  EdRua.Text := DMCep.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DMCep.FDMemTable1.FieldByName('bairro').AsString;
  EdCidade.Text := DMCep.FDMemTable1.FieldByName('localidade').AsString;
  EdEstado.Text := DMCep.FDMemTable1.FieldByName('estado').AsString;


end;

procedure TForm19.Timer1Timer(Sender: TObject);
begin
lblrequired.visible := false;
Timer1.Enabled := False;
end;

end.
