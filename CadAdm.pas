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
    Label1: TLabel;
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

uses UDataModule, UDataCEP, TelaInicialN3;

{ TForm23 }

procedure TForm23.BtnCadClick(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm23.Cadastrar;
begin
var id_empresa: integer;
try
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
    ParamByName('senha').AsString := '123';
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
  DataModule2.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DataModule2.RESTRequest1.Execute;
  ///ShowMessage (DataModule2.RESTResponse1.Content);
  EdRua.Text := DataModule2.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DataModule2.FDMemTable1.FieldByName('bairro').AsString;
  EdCidade.Text := DataModule2.FDMemTable1.FieldByName('localidade').AsString;
  EdEstado.Text := DataModule2.FDMemTable1.FieldByName('estado').AsString;
end;

procedure TForm23.PnlLupaClick(Sender: TObject);
begin
PesquisarCep;
end;

end.
