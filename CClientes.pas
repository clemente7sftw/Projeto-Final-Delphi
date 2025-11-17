unit CClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Skia, Vcl.Imaging.jpeg, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, System.RegularExpressions;

type
  TForm4 = class(TForm)
    Fundo: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    BtnConf: TPanel;
    Lblrequired: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Label4: TLabel;
    DataSource1: TDataSource;
    EdEmail: TDBEdit;
    EdNome: TDBEdit;
    EditBtn: TImage;
    ExclBtn: TImage;
    addclie: TImage;
    Lbagendamentos: TLabel;
    BtnCad: TPanel;
    btncancelar: TImage;
    Image3: TImage;
    LbEmail: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    LbErro_Sistema: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure BtnConfClick(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Procurar;
    procedure Editar;
    procedure Salvar;
    procedure Cadastrar;
    procedure Cancelar;
    procedure Voltar;
    procedure Excluir;
    procedure AdicionarCliente;
    procedure erro_campos;
    procedure erro_email;
    procedure erro;
    procedure atualizar_grid;
    procedure icones_escondidos;
    procedure EdNomeKeyPress(Sender: TObject; var Key: Char);
    procedure ExclBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure addclieClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    function ValidarEmail(const Email: string):Boolean;
    procedure LbagendamentosClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;
 id_clie:integer;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CFornecedores, TelaInicialN3, UDataModule, CProfissionais,
  Agendamentos, CAgendamentos, CServicos, CCargos;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Form4.WindowState:=wsMaximized;
  icones_escondidos;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
with datamodule1.queryclientes do
begin
  Close;
  SQL.Text :=
    'SELECT * FROM clientes ' +
    'WHERE id_empresa = :id_empresa ' +
    'ORDER BY nome_clie';
  DataModule1.queryclientes.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
  EditsInativos;
  DataSource1.DataSet := DataModule1.queryclientes;
  ednome.DataSource := datasource1;
  edemail.DataSource := datasource1;
  ednome.DataField := 'nome_clie';
  edemail.DataField := 'email_clie';
end;
end;

procedure TForm4.BtnConfClick(Sender: TObject);
begin
  Salvar;
end;

procedure TForm4.BtnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  Voltar;
end;

procedure TForm4.Image2Click(Sender: TObject);
begin
  Procurar;
end;

procedure TForm4.LbagendamentosClick(Sender: TObject);
begin
  Form21.Show;
end;

procedure TForm4.LbCargosClick(Sender: TObject);
begin
  Form14.show;
end;

procedure TForm4.LbFornecedoresClick(Sender: TObject);
begin
  Form7.show;
end;

procedure TForm4.LbProfissionaisClick(Sender: TObject);
begin
  Form8.show;
end;

procedure TForm4.LbServicosClick(Sender: TObject);
begin
  Form15.show;
end;

procedure TForm4.addclieClick(Sender: TObject);
begin
  AdicionarCliente;
end;

procedure TForm4.EditBtnClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm4.ExclBtnClick(Sender: TObject);
begin
  Excluir;
end;

procedure TForm4.BtnCadClick(Sender: TObject);
begin
 Cadastrar;
end;

procedure TForm4.btncancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TForm4.AdicionarCliente;
begin
  editsativos;
  BtnCad.Visible := true;
  EditBtn.Visible := false;
  ExclBtn.Visible := false;
  btncancelar.Visible := true;
  addclie.Visible := false;
  with DataModule1.queryclientes do
begin
   Append;
   ednome.Field.Clear;
   edemail.Field.Clear;
end;
end;

procedure TForm4.BtnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TForm4.Cadastrar;
var
  id_empresa: Integer;
  nome_senha: string;
begin
  nome_senha := Trim(ednome.Text);

  if Pos(' ', nome_senha) > 0 then
    nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);

  if (Trim(ednome.Text) = '') or (Trim(edemail.Text) = '') then
  begin
    erro_campos;
    Exit;
  end;
  if not ValidarEmail(edemail.Text) then
  begin
    erro_email;
    Exit;
  end;

  try
    with DataModule1.Query_Conexao do
    begin
      Close;
      SQL.Text :=
        'INSERT INTO clientes (id_empresa, nome_clie, email_clie, senha_clie) ' +
        'VALUES (:id_empresa, :nome_clie, :email_clie, :senha_clie)';
      ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
      ParamByName('nome_clie').AsString := ednome.Text;
      ParamByName('email_clie').AsString := edemail.Text;
      ParamByName('senha_clie').AsString := nome_senha + '123';
      ExecSQL;
    end;
    atualizar_grid;
    EditSinativos;
    BtnCad.Visible := False;
    btncancelar.Visible := false;
    EditBtn.Visible := True;
    ExclBtn.Visible := True;
    ednome.Visible:= true;
    edemail.Visible:= true;
    btncancelar.Visible:= true;
    addclie.Visible := true;
  except
  erro;
  end;
end;

procedure TForm4.icones_escondidos;
begin
  lblrequired.Visible:= false;
  lbEmail.Visible:= false;
  LbErro_Sistema.Visible := false;
  BtnCad.Visible:= false;
  btncancelar.Visible := false;
  BtnConf.Visible := False;
end;

procedure TForm4.atualizar_grid;
begin
with datamodule1.queryclientes do
begin
  Close;
  SQL.Text :=
    'SELECT * FROM clientes ' +
    'WHERE id_empresa = :id_empresa ' +
    'ORDER BY nome_clie';
  DataModule1.queryclientes.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
  EditsInativos;
  DataSource1.DataSet := DataModule1.queryclientes;
  ednome.DataSource := datasource1;
  edemail.DataSource := datasource1;
  ednome.DataField := 'nome_clie';
  edemail.DataField := 'email_clie';
end;
end;

procedure TForm4.Cancelar;
begin
  atualizar_grid;
  btncancelar.Visible := false;
  editsinativos;
  BtnCad.Visible:= false;
  BtnConf.Visible:= false;
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  Lblrequired.visible:= false;
  ednome.Visible:= true;
  edemail.Visible:= true;
  addclie.Visible := true;
end;

procedure TForm4.EdNomeKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TForm4.erro;
begin
  Timer3.Enabled := true;
  LbErro_Sistema.visible := true;
end;

procedure TForm4.erro_campos;
begin
  Timer1.Enabled := true;
  Lblrequired.visible := true;
end;

procedure TForm4.erro_email;
begin
  Timer2.Enabled := true;
  LbEmail.visible := true;
end;

procedure TForm4.Editar;
begin
  BtnConf.Visible:= true;
  ExclBtn.Visible:= false;
  EditsAtivos;
  EditBtn.Visible:= false;
  addclie.Visible:= false;
  btncancelar.Visible := true;
  BtnCad.Visible:= false;
end;

procedure TForm4.EditsAtivos;
begin
  EdNome.Enabled := true;
  EdEmail.Enabled := true;
end;

procedure TForm4.EditsInativos;
begin
  EdNome.Enabled := false;
  EdEmail.Enabled := false;
end;


procedure TForm4.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Cliente? Essa ação não poderá ser desfeita.', 'Exclusão de Cliente', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
  with datamodule1.queryclientes do
  begin
    id_clie := DataModule1.queryclientes.FieldByName('id_clie').AsInteger;
    Close;
    SQL.Text := 'DELETE FROM clientes WHERE id_clie = :id_clie';
    ParamByName('id_clie').AsInteger := id_clie;
    ExecSQL;
    atualizar_grid;
  end;
  end
  else
  begin
   exit;
  end;
end;

procedure TForm4.Procurar;
begin
  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT * FROM clientes ' +
                'WHERE UPPER(nome_clie) LIKE :nome ' +
                'ORDER BY nome_clie';
    ParamByName('nome').AsString := '%' + UpperCase(EdPesquisa.Text) + '%';
    Open;
  end;
end;

procedure TForm4.Salvar;
var
  id_clie: Integer;
begin
  if (EdNome.Text <> '') and (EdEmail.Text <> '') then
  begin
    if ValidarEmail(EdEmail.Text) then
    begin
      try
          with datamodule1.queryclientes do
          begin
            Edit;
            FieldByName('nome_clie').AsString := EdNome.Text;
            FieldByName('email_clie').AsString := EdEmail.Text;
            Post;
          end;
        atualizar_grid;
        EditsInativos;
        BtnConf.Visible := False;
        ExclBtn.Visible := True;
        EditBtn.Visible := True;
        addclie.Visible := True;

      except
        erro;
      end;
    end
    else
      erro_email;
  end
  else
    erro_campos;
end;



procedure TForm4.Timer1Timer(Sender: TObject);
begin
Lblrequired.visible:= false;
Timer1.Enabled := false;
end;

procedure TForm4.Timer2Timer(Sender: TObject);
begin
LbEmail.visible:= false;
Timer2.Enabled := false;
end;

procedure TForm4.Timer3Timer(Sender: TObject);
begin
LbErro_Sistema.Visible := false;
timer3.Enabled := false;
end;

function TForm4.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

procedure TForm4.Voltar;
begin
  Form20.Show;
  Form4.Close;
end;

end.
