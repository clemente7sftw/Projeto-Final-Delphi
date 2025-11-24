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
    lbaviso: TLabel;
    Image4: TImage;
    BS: TImage;
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
    btncancelar: TImage;
    Timer1: TTimer;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    Lbagendamentos: TLabel;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure erro;
    procedure Timer1Timer(Sender: TObject);
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

  DBEdit1.DataSource := nil;
  DBEdit2.DataSource := nil;
  DBEdit3.DataSource := nil;
  DBGServicos.DataSource := nil;
  DataSource1.DataSet := nil;
  if DataModule1.QueryServicos.Active then
    DataModule1.QueryServicos.Close;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Form15.WindowState:=wsMaximized;
  BtnConf.Visible := false;
  lbaviso.visible := false;
  Lblrequired.Visible:= false;
  BtnCad.Visible:= false;
  btncancelar.Visible:= false;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
  DBGServicos.DataSource := DataSource1;

  with DataModule1.QueryServicos do
  begin
    Close;
    SQL.Text :=
      'SELECT * FROM servicos ' +
      'WHERE id_empresa = :id_empresa ' +
      'ORDER BY nome';

    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;

    Open;
  end;

  DataSource1.DataSet := DataModule1.QueryServicos;
  DBEdit1.DataSource := DataSource1;
  DBEdit2.DataSource := DataSource1;
  DBEdit3.DataSource := DataSource1;

  DBEdit1.DataField := 'nome';
  DBEdit2.DataField := 'duracao';
  DBEdit3.DataField := 'preco';
  EditsInativos;
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
form15.close;
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
var
  id_servico: Integer;
begin
  if Application.MessageBox(
    'Atenção: ao excluir este serviço, ele será removido também dos cargos associados. Deseja continuar?',
    'Exclusão de Serviços',
    MB_YESNO + MB_ICONQUESTION
  ) = IDYES then
  begin
    id_servico := DataModule1.queryservicos.FieldByName('id_servico').AsInteger;
    with DataModule1.queryservicos do
    begin
      Close;
      SQL.Text := 'DELETE FROM agendamento_servicos WHERE id_servico = :id_servico';
      ParamByName('id_servico').AsInteger := id_servico;
      ExecSQL;
    end;
    with DataModule1.queryservicos do
    begin
      Close;
      SQL.Text := 'DELETE FROM servicos WHERE id_servico = :id_servico';
      ParamByName('id_servico').AsInteger := id_servico;
      ExecSQL;
    end;

    Atualizar_Grid;
  end;
end;


procedure TForm15.PbtnAddClick(Sender: TObject);
begin
  Form10.show;
  Form15.Hide;
end;




procedure TForm15.Cadastrar;
begin
 var  id_empresa:integer;
begin
  if (dbEdit1.Text <> '') and (dbEdit2.Text <> '') and (dbEdit3.Text <> '') then
   begin

    with DataModule1.Query_conexao do
    begin
        Close;
        SQL.Text :=
          'INSERT INTO servicos (id_empresa, nome, duracao, preco) ' +
          'VALUES (:id_empresa, :nome, :duracao, :preco)';
        ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
        ParamByName('nome').AsString := dbEdit1.Text;
        ParamByName('duracao').AsInteger := StrToInt(dbEdit2.Text);
        ParamByName('preco').Asinteger := StrToInt(dbEdit3.Text);
        ExecSQL;
        BtnCad.Visible:= false;
        btncancelar.Visible := true;
        BtnExcluir.Visible := true;
        BtnEditar.Visible := true;
        addclie.Visible:= true;
        EditsInativos;


    end;
    atualizar_grid;
  end else begin
    erro;
  end;
end;
end;

procedure TForm15.Cancelar;
begin
  atualizar_grid;
  BtnCad.Visible:= false;
  addclie.Visible:= true;
  btncancelar.Visible:= false;
  BtnEditar.visible := true;
  BtnExcluir.visible := true;
  btnconf.Visible:= false;
  dbedit1.DataSource := datasource1;
  dbedit2.DataSource := datasource1;
  dbedit3.DataSource := datasource1;
end;

procedure TForm15.Salvar;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
  begin
    with datamodule1.queryservicos do
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
    dbedit1.DataSource := datasource1;
    dbedit2.DataSource := datasource1;
    dbedit3.DataSource := datasource1;
  end else begin
    lblrequired.visible := true;
  end;
end;


procedure TForm15.Timer1Timer(Sender: TObject);
begin
Lblrequired.visible:= false;
Timer1.Enabled := false;
end;

procedure TForm15.Adicionar;
begin
  EditsAtivos;
  BtnCad.Visible := true;
  BtnExcluir.Visible := false;
  BtnEditar.Visible := false;
  btncancelar.Visible := true;
  addclie.Visible:= false;
with DataModule1.queryservicos do
begin
   Append;
   dbedit1.Field.Clear;
end;

end;

procedure TForm15.atualizar_grid;
begin
with datamodule1.queryservicos do
begin
 Close;
  SQL.Text :=
  'SELECT * FROM servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome;';
  DataModule1.queryservicos.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
  EditsInativos;
  DataSource1.DataSet := DataModule1.queryservicos;
end;
end;

procedure TForm15.Editar;
begin
  addclie.Visible := false;
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
  btncancelar.Visible:= true;
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

procedure TForm15.erro;
begin
Lblrequired.visible:= true;
Timer1.Enabled := true;
end;

end.
