unit CServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, AdicionarServico, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Error,   Vcl.ComCtrls;

type
  TForm15 = class(TForm)
    Fundo: TPanel;
    DBGServicos: TDBGrid;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    StatusBar1: TStatusBar;
    lbaviso: TLabel;
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
    addclie: TImage;
    BtnEditar: TImage;
    BtnExcluir: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnConf: TPanel;
    Label1: TLabel;
    Lblrequired: TLabel;
    BtnCad: TPanel;
    Voltar: TImage;
    Panel2: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    btncancelar: TImage;
    procedure Excluir;
    procedure FormCreate(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Editar;
    procedure Salvar;
    procedure Cadastrar;
    procedure Cancelar;
    procedure Adicionar;
    procedure atualizar_grid;
    procedure Procurar;
    procedure edits_cadastro_visiveis;
    procedure edits_cadastro_escondidos;
    procedure dbedits_escondidos;
    procedure dbedits_visiveis;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure addclieClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure VoltarClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure LbagendamentosClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;
  id_servico: integer;

implementation

{$R *.dfm}

uses TelaPrincipalN1, UDataModule, TelaInicialN3, CClientes, CAgendamentos,
  CProfissionais, CCargos, CFornecedores;


procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  lbaviso.visible := false;
  Lblrequired.Visible:= false;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Form15.WindowState:=wsMaximized;
  BtnConf.Visible := false;
  lbaviso.visible := false;
  Lblrequired.Visible:= false;
  BtnCad.Visible:= false;
  edits_cadastro_escondidos;
  btncancelar.Visible:= false;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
with datamodule1.query_conexao do
begin
 Close;
  SQL.Text :=
  'SELECT * FROM servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome;';
  DataModule1.Query_conexao.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
  EditsInativos;
  DataSource1.DataSet := DataModule1.query_conexao;
end;
end;


procedure TForm15.VoltarClick(Sender: TObject);
begin
Form20.show;
Form15.close;
end;

procedure TForm15.Image3Click(Sender: TObject);
begin
Excluir;
end;

procedure TForm15.LbagendamentosClick(Sender: TObject);
begin
  Form21.show;
end;

procedure TForm15.LbCargosClick(Sender: TObject);
begin
  Form14.show;
end;

procedure TForm15.LbClieClick(Sender: TObject);
begin
  Form4.show;
end;

procedure TForm15.LbFornecedoresClick(Sender: TObject);
begin
  Form7.show;
end;

procedure TForm15.LbProfissionaisClick(Sender: TObject);
begin
  Form8.show;
end;

procedure TForm15.addclieClick(Sender: TObject);
begin
Adicionar;
end;

procedure TForm15.Adicionar;
begin
  dbedits_escondidos;
  edits_cadastro_visiveis;
  EditsAtivos;
  BtnCad.Visible := true;
  BtnExcluir.Visible := false;
  BtnEditar.Visible := false;
  btncancelar.Visible := true;
end;

procedure TForm15.atualizar_grid;
begin
with datamodule1.query_conexao do
begin
 Close;
  SQL.Text :=
  'SELECT * FROM servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome;';
  DataModule1.Query_conexao.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
  EditsInativos;
  DataSource1.DataSet := DataModule1.query_conexao;
end;
end;

procedure TForm15.BtnCadClick(Sender: TObject);
begin
  Cadastrar;
end;

procedure TForm15.btncancelarClick(Sender: TObject);
begin
Cancelar;
end;

procedure TForm15.BtnConfClick(Sender: TObject);
begin
  Salvar;
end;

procedure TForm15.BtnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm15.BtnExcluirClick(Sender: TObject);
begin
 Excluir;
end;

procedure TForm15.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(Sender as TWinControl, True, True);
  end;
end;


procedure TForm15.Excluir;
begin
  if Application.MessageBox(
    'Atenção: ao excluir este serviço, ele será removido também dos cargos associados. Deseja continuar?',
    'Exclusão de Serviços',
    MB_YESNO + MB_ICONQUESTION
  ) = IDYES then
  begin
  with datamodule1.query_conexao do
  begin
    id_servico := DataModule1.Query_conexao.FieldByName('id_servico').AsInteger;
    Close;
    SQL.Text := 'DELETE FROM servicos WHERE id_servico = :id_servico';
    ParamByName('id_servico').AsInteger := id_servico;
    ExecSQL;
    atualizar_grid;
  end;
  end
  else
  begin

  end;
end;



procedure TForm15.PbtnAddClick(Sender: TObject);
begin
  Form10.show;
  Form15.Hide;
end;

procedure TForm15.Procurar;
begin
  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT * FROM servicos ' +
                'WHERE UPPER(nome) LIKE :nome ' +
                'ORDER BY nome';
    ParamByName('nome').AsString := '%' + UpperCase(EdPesquisa.Text) + '%';
    Open;
  end;
end;


procedure TForm15.Cadastrar;
begin
 var  id_empresa:integer;
begin
  if (Edit1.Text <> '') and (Edit2.Text <> '') and (Edit3.Text <> '') then
   begin

    with DataModule1.Query_conexao do
    begin
        Close;
        SQL.Text :=
          'INSERT INTO servicos (id_empresa, nome, duracao, preco) ' +
          'VALUES (:id_empresa, :nome, :duracao, :preco)';
        ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
        ParamByName('nome').AsString := Edit1.Text;
        ParamByName('duracao').AsInteger := StrToInt(Edit2.Text);
        ParamByName('preco').Asinteger := StrToInt(Edit3.Text);
        ExecSQL;
        BtnCad.Visible:= false;
        Lblrequired.Visible:= false;
        EditsInativos;
        atualizar_grid;
        edits_cadastro_escondidos;
        dbedits_visiveis;
    end;
  end else begin
    Lblrequired.Visible:= true;
  end;
end;
end;

procedure TForm15.Cancelar;
begin
  atualizar_grid;
  edits_cadastro_escondidos;
  BtnCad.Visible:= false;
  btncancelar.Visible:= false;
  BtnEditar.visible := true;
  BtnExcluir.visible := true;
end;

procedure TForm15.Salvar;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
  begin
    with datamodule1.query_conexao do
    begin
    Edit;
    FieldByName('nome').AsString := dbEdit1.Text;
    FieldByName('duracao').AsString := dbEdit2.Text;
    FieldByName('preco').AsString := dbEdit3.Text;
    Post;
    end;
    atualizar_grid;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
    lblrequired.visible := false;
    addclie.Visible:= true;
  end else begin
    lblrequired.visible := true;
  end;
end;
procedure TForm15.dbedits_escondidos;
begin
  dbedit1.Visible:= true;
  dbedit2.Visible:= true;
  dbedit3.Visible:= true;
end;

procedure TForm15.dbedits_visiveis;
begin
  Dbedit1.Visible:= false;
  Dbedit2.Visible:= false;
  Dbedit3.Visible:= false;
end;

procedure TForm15.Editar;
begin
  addclie.Visible := false;
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
end;

procedure TForm15.EditsAtivos;
begin
  DBEdit1.Enabled := true;
  DBEdit2.Enabled := true;
  DBEdit3.Enabled := true;

end;

procedure TForm15.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;

end;

procedure TForm15.edits_cadastro_escondidos;
begin
  edit1.Visible:= false;
  edit2.Visible:= false;
  edit3.Visible:= false;
end;

procedure TForm15.edits_cadastro_visiveis;
begin
  edit1.Visible:= true;
  edit2.Visible:= true;
  edit3.Visible:= true;
end;


end.
