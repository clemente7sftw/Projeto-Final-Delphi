unit n2_cclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Skia, System.RegularExpressions;

type
  TForm29 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Lblrequired: TLabel;
    Label4: TLabel;
    EditBtn: TImage;
    ExclBtn: TImage;
    addclie: TImage;
    btncancelar: TImage;
    Image3: TImage;
    LbEmail: TLabel;
    DBGrid1: TDBGrid;
    BtnConf: TPanel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    BtnCad: TPanel;
    Image4: TImage;
    BS: TImage;
    DataSource1: TDataSource;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    Lbagendamentos: TLabel;
    LbErro_Sistema: TLabel;
    Timer1: TTimer;
    Timer2: TTimer;
    Timer3: TTimer;
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
  dbedit1.Enabled := false;
  dbedit2.Enabled := false;
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
  with DataModule1.queryclientes do
begin
   Append;
   dbedit1.Field.Clear;
   dbedit2.Field.Clear;
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
  dbedit1.DataSource := datasource1;
  dbedit2.DataSource := datasource1;
  dbedit1.DataField := 'nome_clie';
  dbedit2.DataField := 'email_clie';
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
  nome_senha := Trim(dbedit1.Text);

  if Pos(' ', nome_senha) > 0 then
    nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);

  if (Trim(dbedit1.Text) = '') or (Trim(dbedit2.Text) = '') then
  begin
    erro_campos;
    Exit;
  end;
  if not ValidarEmail(dbedit2.Text) then
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
      ParamByName('nome_clie').AsString := dbedit1.Text;
      ParamByName('email_clie').AsString := dbedit2.Text;
      ParamByName('senha_clie').AsString := nome_senha + '123';
      ExecSQL;
    end;
    atualizar_grid;
    EditSinativos;
    BtnCad.Visible := False;
    btncancelar.Visible := false;
    EditBtn.Visible := True;
    ExclBtn.Visible := True;
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
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  Lblrequired.visible:= false;
  dbedit1.Visible:= true;
  dbedit2.Visible:= true;
end;

procedure TForm29.Editar;
begin
  BtnConf.Visible:= true;
  ExclBtn.Visible:= false;
  EditsAtivos;
  EditBtn.Visible:= false;
  addclie.Visible:= false;
end;

procedure TForm29.EditBtnClick(Sender: TObject);
begin
Editar;
end;

procedure TForm29.EditsAtivos;
begin
  dbedit1.Enabled := true;
  dbedit2.Enabled := true;
end;

procedure TForm29.FormCreate(Sender: TObject);
begin
WindowState := wsMaximized;
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
  icones_escondidos;
  DataSource1.DataSet := DataModule1.queryclientes;
  dbedit1.DataSource := datasource1;
  dbedit2.DataSource := datasource1;
  dbedit1.DataField := 'nome_clie';
  dbedit2.DataField := 'email_clie';
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
  if (Dbedit1.Text <> '') and (Dbedit2.Text <> '') then
  begin
    if ValidarEmail(Dbedit2.Text) then
    begin
      try
          with datamodule1.queryclientes do
          begin
            Edit;
            FieldByName('nome_clie').AsString := Dbedit1.Text;
            FieldByName('email_clie').AsString := Dbedit2.Text;
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

function TForm29.ValidarEmail(const Email: string): Boolean;
begin
Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

end.
