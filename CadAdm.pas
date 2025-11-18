unit CadAdm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TForm23 = class(TForm)
    BS: TImage;
    BtnCad: TPanel;
    CBGenero: TComboBox;
    EdBairro: TEdit;
    EdCEP: TEdit;
    EdCidade: TEdit;
    EdCPF: TEdit;
    EdEmail: TEdit;
    EdEstado: TEdit;
    EdFone: TEdit;
    EdNome: TEdit;
    EdRua: TEdit;
    Fundo: TImage;
    Image1: TImage;
    Label10: TLabel;
    Label11: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    LbUser: TLabel;
    PnlLupa: TPanel;
    Image2: TImage;
    Image3: TImage;
    procedure Cadastrar;
    procedure PesquisarCep;
    procedure PnlLupaClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form23: TForm23;

implementation

{$R *.dfm}

uses UDataModule, uDmCep, TelaInicialN3, UMetodos;

{ TForm23 }

procedure TForm23.BtnCadClick(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm23.Cadastrar;

var id_empresa: integer;
    nome_senha: string;
begin
try
  nome_senha := Trim(edNome.Text);
  if Pos(' ', nome_senha) > 0 then
  begin
   nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);
 end;
 with DataModule1.QueryAdm do
   begin
   id_empresa:= DataModule1.id_empresa;


    SQL.Text := 'INSERT INTO administradores (nome_adm, email_adm,senha_adm, cpf_adm, genero_adm, fone_adm, cep_adm, rua_adm, bairro_adm, cidade_adm, estado_adm, id_empresa ) ' +
                'VALUES (:nome, :email, :senha, :cpf, :genero, :fone, :cep, :rua, :bairro, :cidade, :estado, :id_empresa)';
    ParamByName('nome').AsString := EdNome.Text;
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('cpf').AsString := EdCPF.Text;
    ParamByName('genero').AsString := CBGenero.Text;
    ParamByName('fone').AsString := EdFone.Text;
    ParamByName('cep').AsString := EdCEP.Text;
    ParamByName('rua').AsString := EdRua.Text;
    ParamByName('bairro').AsString := EdBairro.Text;
    ParamByName('cidade').AsString := EdCidade.Text;
    ParamByName('estado').AsString := EdEstado.Text;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    ParamByName('senha_adm').AsString := TMetodos.MD5(Trim(nome_senha) + '123');
    ExecSQL;
  end;
  Form23.close;
  Form20.show;
  except
      on E: Exception do
        ShowMessage('Erro ao cadastrar: ' + E.Message);
    end;
end;

procedure TForm23.FormShow(Sender: TObject);
begin
  datamodule1.queryadm.close;
  datamodule1.queryadm.open;
  WindowState := wsMaximized;
end;

procedure TForm23.PesquisarCep;
begin
  DMCep.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DMCep.RESTRequest1.Execute;
  ///ShowMessage (DataModule2.RESTResponse1.Content);
  EdRua.Text := DMCep.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DMCep.FDMemTable1.FieldByName('bairro').AsString;
  EdCidade.Text := DMCep.FDMemTable1.FieldByName('localidade').AsString;
  EdEstado.Text := DMCep.FDMemTable1.FieldByName('estado').AsString;
end;

procedure TForm23.PnlLupaClick(Sender: TObject);
begin
PesquisarCep;
end;

end.
