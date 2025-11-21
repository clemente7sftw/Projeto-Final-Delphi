unit n2_cclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Skia, System.RegularExpressions;

type
  TForm29 = class(TForm)
    DataSource1: TDataSource;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Fundo: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Lblrequired: TLabel;
    Label4: TLabel;
    EditBtn: TImage;
    ExclBtn: TImage;
    addclie: TImage;
    btncancelar: TImage;
    LbEmail: TLabel;
    LbErro_Sistema: TLabel;
    DBGrid1: TDBGrid;
    BtnConf: TPanel;
    EdEmail: TDBEdit;
    EdNome: TDBEdit;
    BtnCad: TPanel;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
    Image4: TImage;
    BS: TImage;
    Panel2: TPanel;
    Label3: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure EditsInativos;
    procedure EditsAtivos;
    procedure Cadastrar;
    procedure Editar;
    procedure Salvar;
    procedure Cancelar;
    procedure erro_campos;
    procedure erro_email;
    procedure erro;
    procedure Excluir;
    procedure icones_escondidos;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure AdicionarCliente;
    function ValidarEmail(const Email: string):Boolean;
    procedure atualizar_grid;
    procedure addclieClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;
  id_clie:integer;
implementation

{$R *.dfm}

uses UMetodos, UDataModule;

procedure TForm29.EditsInativos;
begin
  EdNome.Enabled := false;
  EdEmail.Enabled := false;
end;

procedure TForm29.erro;
begin
  Timer3.Enabled := true;
  LbErro_Sistema.visible := true;
end;

procedure TForm29.erro_campos;
begin
  Timer1.Enabled := true;
  Lblrequired.visible := true;
end;

procedure TForm29.erro_email;
begin
  Timer2.Enabled := true;
  LbEmail.visible := true;
end;

procedure TForm29.ExclBtnClick(Sender: TObject);
begin
Excluir;
end;

procedure TForm29.Excluir;
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

procedure TForm29.addclieClick(Sender: TObject);
begin
AdicionarCliente;
end;

procedure TForm29.AdicionarCliente;
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

procedure TForm29.atualizar_grid;
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


procedure TForm29.BtnCadClick(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm29.btncancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure TForm29.BtnConfClick(Sender: TObject);
begin
Salvar;
end;

procedure TForm29.Cadastrar;
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
      ParamByName('senha_clie').AsString := TMetodos.MD5(Trim(nome_senha) + '123');
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



procedure TForm29.Cancelar;
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


procedure TForm29.Editar;
begin
  BtnConf.Visible:= true;
  ExclBtn.Visible:= false;
  EditsAtivos;
  EditBtn.Visible:= false;
  addclie.Visible:= false;
  btncancelar.Visible := true;
  BtnCad.Visible:= false;
end;

procedure TForm29.EditBtnClick(Sender: TObject);
begin
Editar;
end;

procedure TForm29.EditsAtivos;
begin
  EdNome.Enabled := true;
  EdEmail.Enabled := true;
end;

procedure TForm29.FormCreate(Sender: TObject);
begin
WindowState := wsMaximized;
icones_escondidos;
end;

procedure TForm29.FormShow(Sender: TObject);
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

procedure TForm29.icones_escondidos;
begin
  lblrequired.Visible:= false;
  lbEmail.Visible:= false;
  LbErro_Sistema.Visible := false;
  BtnCad.Visible:= false;
  btncancelar.Visible := false;
  BtnConf.Visible := False;
end;

procedure TForm29.Salvar;
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

procedure TForm29.Timer1Timer(Sender: TObject);
begin
Lblrequired.visible:= false;
Timer1.Enabled := false;
end;

procedure TForm29.Timer2Timer(Sender: TObject);
begin
LbEmail.visible:= false;
Timer2.Enabled := false;
end;

procedure TForm29.Timer3Timer(Sender: TObject);
begin
LbErro_Sistema.Visible := false;
timer3.Enabled := false;
end;

function TForm29.ValidarEmail(const Email: string): Boolean;
begin
Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

end.
