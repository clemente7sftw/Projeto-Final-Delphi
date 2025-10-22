unit CCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls,
  Vcl.CheckLst;

type
  TForm14 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    BtnConf: TPanel;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Label4: TLabel;
    addclie: TImage;
    BtnEditar: TImage;
    BtnExcluir: TImage;
    Lblrequired: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    CLBServicos: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure Excluir;
    procedure Editar;
    procedure Adicionar;
    procedure Salvar;
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure addclieClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure LbagendamentosClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var id_empresa:integer;
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

uses TelaPrincipalN1, UDataModule, AdicionarCargo, TelaInicialN3, CClientes,
  CAgendamentos, CProfissionais, CServicos, CFornecedores;

procedure TForm14.addclieClick(Sender: TObject);
begin
Adicionar;
end;

procedure TForm14.Adicionar;
begin
Form11.show;
Form14.Close;
end;

procedure TForm14.BtnAddClick(Sender: TObject);
begin
  Adicionar;
end;

procedure TForm14.BtnConfClick(Sender: TObject);
begin
  Salvar;
end;

procedure TForm14.BtnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm14.BtnExcluirClick(Sender: TObject);
begin
  Excluir;
end;

procedure TForm14.Editar;
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
  addclie.Visible:= false;
end;

procedure TForm14.EditBtnClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm14.EditsAtivos;
begin
  DBEdit1.Enabled := true;
  CLBServicos.Visible:= True;
end;

procedure TForm14.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
end;

procedure TForm14.ExclBtnClick(Sender: TObject);
begin
Excluir;
end;

procedure TForm14.Excluir;
begin
if Application.MessageBox('Tem certeza de que deseja excluir este Cargo? Essa ação não poderá ser desfeita.', 'Exclusão de Cargo', MB_YESNO + MB_ICONQUESTION) = IDYES then
begin
 datamodule1.QueryCargos.delete;
 datamodule1.QueryRCS.delete;
end else begin
exit;
end;
end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  Form14.WindowState:=wsMaximized;
  BtnConf.Visible := False;
  Lblrequired.visible:= false;
  EditsInativos;
  CLBServicos.Visible:= false;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
  datamodule1.QueryCargos.close;
    DataModule1.Querycargos.SQL.Text :=
    'SELECT * FROM cargos ' +
    'WHERE id_empresa = :id_empresa ' +
    'ORDER BY nome_cargo';
     DataModule1.Querycargos.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  datamodule1.QueryCargos.open;

  datamodule1.QueryServicos.close;
    DataModule1.QueryServicos.SQL.Text :=
  'SELECT * FROM servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome;';
   DataModule1.QueryServicos.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  datamodule1.QueryServicos.open;
  datamodule1.QueryCS.close;
  DataModule1.QueryCS.SQL.Text :=
  'SELECT * FROM cargos_servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY id_cargo;';
   DataModule1.QueryCS.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  datamodule1.QueryCS.open;
 datamodule1.QueryRCS.Close;
datamodule1.QueryRCS.open;

end;

procedure TForm14.Image1Click(Sender: TObject);
begin
  Form20.Show;
  Form14.close;
end;

procedure TForm14.LbagendamentosClick(Sender: TObject);
begin
  Form21.show;
end;

procedure TForm14.LbClieClick(Sender: TObject);
begin
  Form4.Show;
end;

procedure TForm14.LbFornecedoresClick(Sender: TObject);
begin
  Form7.show;
end;

procedure TForm14.LbProfissionaisClick(Sender: TObject);
begin
  Form8.show;
end;

procedure TForm14.LbServicosClick(Sender: TObject);
begin
  Form15.show;
end;

procedure TForm14.Salvar;
begin
  if (DBEdit1.Text <> '' ) and (DBEdit2.Text <> '' )then
  begin
    if not (DataModule1.QueryCargos.State in [dsEdit, dsInsert]) then
    DataModule1.QueryCargos.Edit;
    DataModule1.QueryCargos.Post;
    DataModule1.QueryRCS.Edit;
    DataModule1.QueryRCS.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
    Lblrequired.visible:= false;
    CLBServicos.Visible:= false;
    addclie.Visible:= true;
  end else begin
    Lblrequired.visible:= true;

  end;
end;

end.
