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
    EdCPF: TEdit;
    EdFone: TEdit;
    EdCEP: TEdit;
    EdRua: TEdit;
    EdBairro: TEdit;
    EdCidad: TEdit;
    EdEstad: TEdit;
    procedure FormCreate(Sender: TObject);

    procedure Image2Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

uses UDataCEP, Cadastro, UDataModule, UMetodos;



procedure TForm18.BtnCadClick(Sender: TObject);
begin
try
 with DataModule1.FDQueryClientes do
   begin
    SQL.Text := 'INSERT INTO clientes_cad (nome_clie, email_clie, senha_clie, cpf_clie, genero_clie, fone_clie, cep_clie, rua_clie, bairro_clie, cidade_clie, estado_clie ) ' +
                'VALUES (:nome, :email, :senha, :cpf, :genero, :fone, :cep, :rua, :bairro, :cidade, :estado)';
    ParamByName('nome').AsString := EdNome.Text;
    ParamByName('senha').AsString := Form2.EdSenha.Text;
    ParamByName('email').AsString := EdEmail.Text;
    ParamByName('cpf').AsString := EdCPF.Text;
    ParamByName('genero').AsString := CBGenero.Text;
    ParamByName('fone').AsString := EdFone.Text;
    ParamByName('cep').AsString := EdCEP.Text;
    ParamByName('rua').AsString := EdRua.Text;
    ParamByName('bairro').AsString := EdBairro.Text;
    ParamByName('cidade').AsString := EdCidad.Text;
    ParamByName('estado').AsString := EdEstad.Text;
    ExecSQL;
  end;
  showmessage ('Cadastro realizado, redirecionanco...');
  Sleep (1000);
  Form18.Hide;
  Form2.Hide;
  TMetodos.TelaPrincipal;
  except
      on E: Exception do
        ShowMessage('Erro ao cadastrar: ');
    end;
end;


procedure TForm18.FormCreate(Sender: TObject);
begin
 WindowState := wsMaximized;

end;


procedure TForm18.Image2Click(Sender: TObject);
begin
  DataModule2.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DataModule2.RESTRequest1.Execute;
  ///ShowMessage (DataModule2.RESTResponse1.Content);
  EdRua.Text := DataModule2.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DataModule2.FDMemTable1.FieldByName('bairro').AsString;
  EdCidad.Text := DataModule2.FDMemTable1.FieldByName('localidade').AsString;
  EdEstad.Text := DataModule2.FDMemTable1.FieldByName('estado').AsString;
end;


end.
