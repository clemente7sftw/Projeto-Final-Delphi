unit CClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,AdicionarCliente, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Skia, Vcl.Imaging.jpeg, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

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
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure ExclBtnClick(Sender: TObject);
    procedure Excluir;
    procedure EditBtnClick(Sender: TObject);
    procedure AdicionarCliente;
    procedure addclieClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CFornecedores, TelaInicialN3, UDataModule;

procedure TForm4.FormCreate(Sender: TObject);
begin
    Form4.WindowState:=wsMaximized;
    BtnConf.Visible := False;
    lblrequired.Visible:= false;
    BtnCad.Visible:= false;
    btncancelar.Visible := false;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  datamodule1.QueryClientes.Close;
  datamodule1.QueryClientes.Open;
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
begin
if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
   begin
    datamodule1.QueryClientes.Post;
    Form4.show;
    Form5.Close;
    datamodule1.QueryClientes.close;
    datamodule1.QueryClientes.open;
    Lblrequired.Visible:= false;
    BtnCad.Visible:= false;
    editsinativos;
    EditBtn.Visible := true;
    ExclBtn.Visible := true;
  end else begin
    Lblrequired.Visible:= true;
    BtnCad.Visible:= true;
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
  if Application.MessageBox('Tem certeza de que deseja excluir este cliente? Essa ação não poderá ser desfeita.', 'Exclusão de cliente', MB_YESNO + MB_ICONQUESTION) = IDYES then
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
    if not (DataModule1.QueryClientes.State in [dsEdit, dsInsert]) then
    DataModule1.QueryClientes.Edit;
    DataModule1.QueryClientes.Post;
    EditsInativos;
    BtnConf.Visible := False;
    ExclBtn.Visible := True;
    EditBtn.Visible:= true;
    Lblrequired.visible:= false;
  end else begin
    Lblrequired.visible:= true;
  end;
end;

procedure TForm4.Voltar;
begin
  Form20.Show;
  Form4.Close;
end;

end.
