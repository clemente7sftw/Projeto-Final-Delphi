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
    LbErroExcl: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure Excluir;
    procedure Editar;
    procedure Adicionar;
    procedure Salvar;
    procedure ErroExclusao;
    procedure TrazerServicos;
    procedure atualizar_grid;
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
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    var id_empresa:integer;
  end;

var
  Form14: TForm14;
  id_cargo: integer;

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
DBEdit1.DataSource := nil;
DBEdit2.DataSource := nil;
Form11.show;
Form14.Close;
end;

procedure TForm14.atualizar_grid;
begin
with datamodule1.query_conexao do
begin
  Close;
  SQL.Text :=
  'SELECT c.id_cargo, ' +
  '       c.nome_cargo, ' +
  '       STRING_AGG(s.nome, '','')::varchar(500) AS nome ' +
  'FROM cargos c ' +
  'LEFT JOIN cargos_servicos cp ON c.id_cargo = cp.id_cargo ' +
  'LEFT JOIN servicos s ON cp.id_servico = s.id_servico '  +
  'WHERE c.id_empresa = :id_empresa ' +
  'GROUP BY c.id_cargo, c.nome_cargo ' +
  'ORDER BY c.nome_cargo;';
  DataModule1.Query_conexao.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
end;
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
  TrazerServicos;
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

procedure TForm14.ErroExclusao;
begin
  LbErroExcl.Visible := True;
  Timer1.Enabled := True;
end;

procedure TForm14.ExclBtnClick(Sender: TObject);
begin
excluir;
end;

procedure TForm14.Excluir;
begin
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Cargo? Essa ação não poderá ser desfeita.', 'Exclusão de Cargo', MB_YESNO + MB_ICONQUESTION) = IDYES then
 with datamodule1.query_conexao do
  begin
    id_cargo := DataModule1.Query_conexao.FieldByName('id_cargo').AsInteger;
    Close;
    SQL.Text := 'DELETE FROM cargos WHERE id_cargo = :id_cargo';
    ParamByName('id_cargo').AsInteger := id_cargo;
    ExecSQL;
    atualizar_grid;

end else begin
exit;
end;
end;
end;



procedure TForm14.FormCreate(Sender: TObject);
begin
  Form14.WindowState:=wsMaximized;
  BtnConf.Visible := False;
  Lblrequired.visible:= false;
  EditsInativos;
  CLBServicos.Visible:= false;
  LbErroExcl.Visible:= false;

end;

procedure TForm14.FormShow(Sender: TObject);
begin
with datamodule1.query_conexao do
begin
  Close;
  SQL.Text :=
  'SELECT c.id_cargo, ' +
  '       c.nome_cargo, ' +
  '       STRING_AGG(s.nome, '','')::varchar(500) AS nome ' +
  'FROM cargos c ' +
  'LEFT JOIN cargos_servicos cp ON c.id_cargo = cp.id_cargo ' +
  'LEFT JOIN servicos s ON cp.id_servico = s.id_servico '  +
  'WHERE c.id_empresa = :id_empresa ' +
  'GROUP BY c.id_cargo, c.nome_cargo ' +
  'ORDER BY c.nome_cargo;';
  DataModule1.Query_conexao.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  Open;
  DataSource2.DataSet := DataModule1.query_conexao;
  dbedit1.DataField := 'nome_cargo';
  dbedit2.DataField := 'nome';
end;
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
var
  id_ser, id_cargo, i: Integer;
begin
  if dbEdit1.Text <> ''  then
  begin
  with datamodule1.query_conexao do
  begin
    Edit;
    FieldByName('nome_cargo').AsString := dbEdit1.Text;
    Post;
  end;
    atualizar_grid;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible := True;
    Lblrequired.Visible := False;
    CLBServicos.Visible := False;
    addclie.Visible := True;
  end;
  with datamodule1.query_conexao do
  begin
//    Close;
//    SQL.Text :=
//      'INSERT INTO cargos_servicos (id_cargo, id_servico) ' +
//      'VALUES (:id_cargo, :id_servico)';
//    ParamByName('id_cargo').AsInteger := id_cargo;
//    ParamByName('id_servico').AsInteger := id_servico;
//    ExecSQL;
  end;
end;

procedure TForm14.Timer1Timer(Sender: TObject);
begin
  LbErroExcl.Visible := False;
  Timer1.Enabled := False;
end;

procedure TForm14.TrazerServicos;
begin
//var
//  id_cargo, i: Integer;
//begin
//  with DataModule1.query_conexao do
//  begin
//    Close;
//    SQL.Text := 'SELECT * FROM servicos ' +
//                'WHERE id_empresa = :id_empresa ' +
//                'ORDER BY nome';
//    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
//    Open;
//    CLBServicos.Items.Clear;
//    while not Eof do
//    begin
//      CLBServicos.Items.AddObject(
//        FieldByName('nome').AsString,
//        TObject(FieldByName('id_servico').AsInteger)
//      );
//      Next;
//    end;
//  end;
//  id_cargo := DataModule1.Query_conexao.FieldByName('id_cargo').AsInteger;
//  with DataModule1.query_conexao do
//  begin
//    Close;
//    SQL.Text := 'SELECT id_servico FROM cargos_servicos WHERE id_cargo = :id_cargo';
//    ParamByName('id_cargo').AsInteger := id_cargo;
//    Open;
//
//    while not Eof do
//    begin
//      for i := 0 to CLBServicos.Count - 1 do
//      begin
//        if Integer(CLBServicos.Items.Objects[i]) = FieldByName('id_servico').AsInteger then
//        begin
//          CLBServicos.Checked[i] := True;
//          Break;
//        end;
//      end;
//      Next;
//    end;
//  end;
end;
end.
