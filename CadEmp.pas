unit CadEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

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
    EdCNPJ: TEdit;
    EdFone: TEdit;
    EdNome: TEdit;
    EdRua: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
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
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

uses UDataCEP, UDataModule, UMetodos, Cadastro;

procedure TForm19.BtnCadClick(Sender: TObject);
begin
try
 with DataModule1.QueryEmpresa do
   begin
    SQL.Text := 'INSERT INTO empresas (nome, email, senha, cnpj, cep, rua, bairro, cidade, estado ) ' +
                'VALUES (:nome, :email, :senha, :cnpj, :cep, :rua, :bairro, :cidade, :estado)';
    ParamByName('nome').AsString := EdNome.Text;
    ParamByName('senha').AsString := Form2.EdSenha.Text;
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('cnpj').AsString := EdCNPJ.Text;
    ParamByName('cep').AsString := EdCEP.Text;
    ParamByName('rua').AsString := EdRua.Text;
    ParamByName('bairro').AsString := EdBairro.Text;
    ParamByName('cidade').AsString := EdCidade.Text;
    ParamByName('estado').AsString := EdEstado.Text;
    ExecSQL;
  end;
  Form19.Hide;
  Form2.Hide;
  TMetodos.TelaPrincipal;
  except
      on E: Exception do
        ShowMessage('Erro ao cadastrar: ' + E.Message);
    end;
end;

procedure TForm19.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;

procedure TForm19.Image2Click(Sender: TObject);
begin
  DataModule2.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DataModule2.RESTRequest1.Execute;
  EdRua.Text := DataModule2.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DataModule2.FDMemTable1.FieldByName('bairro').AsString;
  EdCidade.Text := DataModule2.FDMemTable1.FieldByName('localidade').AsString;
  EdEstado.Text := DataModule2.FDMemTable1.FieldByName('estado').AsString;
end;

end.
