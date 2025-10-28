unit CadClie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm18 = class(TForm)
    Fundo: TImage;
    Image1: TImage;
    BS: TImage;
    Label2: TLabel;
    Label1: TLabel;
    LbUser: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnCad: TPanel;
    CBGenero: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PnlLupa: TPanel;
    Image2: TImage;
    EdNome: TEdit;
    EdEmail: TEdit;
    EdCEP: TEdit;
    EdRua: TEdit;
    EdBairro: TEdit;
    EdCidade: TEdit;
    EdEstado: TEdit;
    MaskCpf: TMaskEdit;
    MaskFone: TMaskEdit;
    Timer1: TTimer;
    Lblrequired: TLabel;
    procedure Cadastrar;
    procedure Erro;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

uses UDataCEP, Cadastro, UDataModule, UMetodos, TelaPrincipalN1;


procedure TForm18.FormCreate(Sender: TObject);
begin
 WindowState := wsMaximized;
 MaskCpf.EditMask:= '999.999.999-99';
 MaskCpf.Text := '';
 MaskFone.EditMask := '(99)9 99999-9999';
 MaskFone.Text := '';
 Lblrequired.Visible := false;
end;

procedure TForm18.BtnCadClick(Sender: TObject);
begin
Cadastrar;
end;


procedure TForm18.Image2Click(Sender: TObject);
begin
try
  DMCep.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DMCep.RESTRequest1.Execute;
  ///ShowMessage (DataModule2.RESTResponse1.Content);
  EdRua.Text := DMCep.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DMCep.FDMemTable1.FieldByName('bairro').AsString;
  EdCidade.Text := DMCep.FDMemTable1.FieldByName('localidade').AsString;
  EdEstado.Text := DMCep.FDMemTable1.FieldByName('estado').AsString;
except
erro;
end;
end;

procedure TForm18.Timer1Timer(Sender: TObject);
begin
  Lblrequired.Visible := false;
  Timer1.Enabled := false;
end;

procedure TForm18.Cadastrar;
begin
try
 with DataModule1.query_conexao do
   begin
    SQL.Text := 'INSERT INTO clientes (nome_clie, email_clie, senha_clie, cpf_clie, genero_clie, fone_clie, cep_clie, rua_clie, bairro_clie, cidade_clie, estado_clie ) ' +
                'VALUES (:nome, :email, :senha, :cpf, :genero, :fone, :cep, :rua, :bairro, :cidade, :estado)';
    ParamByName('nome').AsString := EdNome.Text;
    ParamByName('senha').AsString := Form2.EdSenha.Text;
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('cpf').AsString :=  MaskCpf.Text;
    ParamByName('genero').AsString := CBGenero.Text;
    ParamByName('fone').AsString :=  MaskFone.Text;
    ParamByName('cep').AsString := EdCEP.Text;
    ParamByName('rua').AsString := EdRua.Text;
    ParamByName('bairro').AsString := EdBairro.Text;
    ParamByName('cidade').AsString := EdCidade.Text;
    ParamByName('estado').AsString := EdEstado.Text;
    ExecSQL;
  end;
  Form18.close;
  Form2.close;
  form3.show;
  except
 erro;
end;
end;

procedure TForm18.Erro;
begin
  Lblrequired.Visible := True;
  Timer1.Enabled := True;
end;

end.
