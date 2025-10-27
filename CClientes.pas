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
    Image1: TImage;
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
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    EditBtn: TImage;
    ExclBtn: TImage;
    addclie: TImage;
    Lbagendamentos: TLabel;
    BtnCad: TPanel;
    btncancelar: TImage;
    Image3: TImage;
    LbEmail: TLabel;
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
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CFornecedores, TelaInicialN3, UDataModule, CProfissionais,
  Agendamentos, CAgendamentos, CServicos, CCargos;

procedure TForm4.FormCreate(Sender: TObject);
begin
  Form4.WindowState:=wsMaximized;
  BtnConf.Visible := False;
  lblrequired.Visible:= false;
  BtnCad.Visible:= false;
  btncancelar.Visible := false;
  lbEmail.Visible:= false;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  DataModule1.QueryClientes.Close;
  DataModule1.QueryClientes.SQL.Text :=
    'SELECT * FROM clientes ' +
    'WHERE id_empresa = :id_empresa ' +
    'ORDER BY nome_clie';
  DataModule1.QueryClientes.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  DataModule1.QueryClientes.Open;
  EditsInativos;
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
  DataModule1.QueryClientes.Append;
  DataModule1.QueryClientes.FieldByName('nome_clie').Clear;
  DataModule1.QueryClientes.FieldByName('email_clie').Clear;
  EditsAtivos;
  BtnCad.Visible := true;
  EditBtn.Visible := false;
  ExclBtn.Visible := false;
  btncancelar.Visible := true;
end;


procedure TForm4.BtnExcluirClick(Sender: TObject);
begin
 if Application.MessageBox('Tem certeza de que deseja excluir este cliente? Essa ação não poderá ser desfeita.', 'Exclusão de cliente', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
  datamodule1.QueryClientes.delete;
  end else
  begin
   exit;
  end;
end;

procedure TForm4.Cadastrar;
var  id_empresa:integer;
begin
if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
begin
  if  ValidarEmail(DBEDIT2.Text)  then
  begin
  id_empresa:= DataModule1.id_empresa;
  DataModule1.QueryClientes.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;
  datamodule1.QueryClientes.FieldByName('senha_clie').AsString := '123';
  datamodule1.QueryClientes.Post;
  datamodule1.QueryClientes.close;
  datamodule1.QueryClientes.open;
  Lblrequired.Visible:= false;
  BtnCad.Visible:= false;
  editsinativos;
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  lbEmail.visible:= false;
  Lblrequired.Visible:= false;
  end else begin
  Lblrequired.Visible:= false;
   lbEmail.visible:= true;
  end;
  end else begin
   Lblrequired.Visible:= true;
  end;
end;

procedure TForm4.Cancelar;
begin
  datamodule1.QueryClientes.Cancel;
  btncancelar.Visible := false;
  editsinativos;
  BtnCad.Visible:= false;
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  Lblrequired.visible:= false;
end;

procedure TForm4.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TForm4.Editar;
begin
  BtnConf.Visible:= true;
  ExclBtn.Visible:= false;
  EditsAtivos;
  EditBtn.Visible:= false;
  addclie.Visible:= false;
end;

procedure TForm4.EditsAtivos;
begin
  DBEdit1.Enabled := true;
  DBEdit2.Enabled := true;
end;

procedure TForm4.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
end;

procedure TForm4.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Cliente? Essa ação não poderá ser desfeita.', 'Exclusão de Cliente', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
  datamodule1.QueryClientes.delete;
  end
  else
  begin
   exit;
  end;
end;


procedure TForm4.Procurar;
begin
  if (EdPesquisa.Text <> '' )then
  begin
    datamodule1.QueryClientes.Filtered := true;
    datamodule1.QueryClientes.filter :=  'UPPER(nome_clie) LIKE ' + QuotedStr('%' + UpperCase(EdPesquisa.Text) + '%');
  end else begin
    datamodule1.QueryClientes.Filtered := false;
  end;
end;

procedure TForm4.Salvar;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
  if ValidarEmail(DBEDIT2.Text) then
  begin
    if not (DataModule1.QueryClientes.State in [dsEdit, dsInsert]) then
    DataModule1.QueryClientes.Edit;
    DataModule1.QueryClientes.Post;
    EditsInativos;
    BtnConf.Visible := False;
    ExclBtn.Visible := True;
    EditBtn.Visible:= true;
    addclie.Visible:= true;
    Lblrequired.visible:= false;
    lbEmail.visible:= false;
  end else begin
  lbEmail.Visible:=true;
  end;
  end else begin
    Lblrequired.visible:= true;
  end;
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
