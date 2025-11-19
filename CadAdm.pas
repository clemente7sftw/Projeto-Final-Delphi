unit CadAdm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.Mask;

type
  TForm23 = class(TForm)
    BS: TImage;
    BtnCad: TPanel;
    CBGenero: TComboBox;
    EdBairro: TEdit;
    EdCEP: TEdit;
    EdCidade: TEdit;
    EdEmail: TEdit;
    EdEstado: TEdit;
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
    Lblrequired: TLabel;
    Timer1: TTimer;
    MaskCpf: TMaskEdit;
    MaskFone: TMaskEdit;
    Label1: TLabel;
    Timer2: TTimer;
    Label12: TLabel;
    Timer3: TTimer;
    procedure Cadastrar;
    procedure Erro;
    procedure Erro_cpf;
    procedure Erro_fone;
    procedure PesquisarCep;
    procedure PnlLupaClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
  public
  end;

var
  Form23: TForm23;

implementation

{$R *.dfm}

uses UDataModule, uDmCep, TelaInicialN3, UMetodos;

procedure TForm23.FormShow(Sender: TObject);
begin
  DataModule1.QueryAdm.Close;
  DataModule1.QueryAdm.Open;

  WindowState := wsMaximized;

  MaskCpf.EditMask := '999.999.999-99';
  MaskCpf.Text := '';

  MaskFone.EditMask := '(99)9 99999-9999';
  MaskFone.Text := '';

  Lblrequired.Visible := False;
  Label1.Visible := False;
  Label12.Visible := False;
end;

procedure TForm23.BtnCadClick(Sender: TObject);
begin
  Cadastrar;
end;

procedure TForm23.Cadastrar;
var
  id_empresa: integer;
  nome_senha: string;
begin
  try
    if not TMetodos.ValidarCPF(MaskCpf.Text) then
    begin
      Erro_cpf;
      Exit;
    end;

    nome_senha := Trim(edNome.Text);
    if Pos(' ', nome_senha) > 0 then
      nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);

    with DataModule1.QueryAdm do
    begin
      id_empresa := DataModule1.id_empresa;

      SQL.Text :=
        'INSERT INTO administradores (nome_adm, email_adm, senha_adm, cpf_adm, genero_adm, fone_adm, cep_adm, rua_adm, bairro_adm, cidade_adm, estado_adm, id_empresa) ' +
        'VALUES (:nome, :email, :senha, :cpf, :genero, :fone, :cep, :rua, :bairro, :cidade, :estado, :id_empresa)';

      ParamByName('nome').AsString := EdNome.Text;
      ParamByName('email').AsString := EdEmail.Text;
      ParamByName('cpf').AsString := MaskCpf.Text;
      ParamByName('genero').AsString := CBGenero.Text;
      ParamByName('fone').AsString := MaskFone.Text;
      ParamByName('cep').AsString := EdCEP.Text;
      ParamByName('rua').AsString := EdRua.Text;
      ParamByName('bairro').AsString := EdBairro.Text;
      ParamByName('cidade').AsString := EdCidade.Text;
      ParamByName('estado').AsString := EdEstado.Text;
      ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
      ParamByName('senha').AsString := TMetodos.MD5(Trim(nome_senha) + '123');

      ExecSQL;
    end;

    Close;
    Form20.Show;

  except
    Erro;
  end;
end;

procedure TForm23.Erro;
begin
  Lblrequired.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm23.Erro_cpf;
begin
  Label1.Visible := True;
  Timer2.Enabled := True;
end;

procedure TForm23.Erro_fone;
begin
  Label12.Visible := True;
  Timer2.Enabled := True;
end;

procedure TForm23.PesquisarCep;
begin
  try
    DMCep.RESTClient1.BaseURL := 'https://viacep.com.br/ws/' + EdCEP.Text + '/json/';
    DMCep.RESTRequest1.Execute;

    EdRua.Text := DMCep.FDMemTable1.FieldByName('logradouro').AsString;
    EdBairro.Text := DMCep.FDMemTable1.FieldByName('bairro').AsString;
    EdCidade.Text := DMCep.FDMemTable1.FieldByName('localidade').AsString;
    EdEstado.Text := DMCep.FDMemTable1.FieldByName('uf').AsString;
  except
    Erro;
  end;
end;

procedure TForm23.PnlLupaClick(Sender: TObject);
begin
  PesquisarCep;
end;

procedure TForm23.Timer1Timer(Sender: TObject);
begin
  Lblrequired.Visible := False;
  Timer1.Enabled := False;
end;

procedure TForm23.Timer2Timer(Sender: TObject);
begin
  Label1.Visible := False;
  Timer2.Enabled := False;
end;

procedure TForm23.Timer3Timer(Sender: TObject);
begin
  Label12.Visible := False;
  Timer3.Enabled := False;
end;

end.

