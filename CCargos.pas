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
  if not DataModule1.QueryRCS.IsEmpty then
  begin
    Excluir;
  end else begin
    ErroExclusao;
  end;

end;

procedure TForm14.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Cargo? Essa ação não poderá ser desfeita.', 'Exclusão de Cargo', MB_YESNO + MB_ICONQUESTION) = IDYES then
begin
 datamodule1.QueryCargos.delete;
 datamodule1.QueryCargos.close;
 datamodule1.QueryCargos.open;
 datamodule1.QueryRCS.close;
 datamodule1.QueryRCS.open;
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
  LbErroExcl.Visible:= false;
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
  'ORDER BY nome';
  DataModule1.QueryServicos.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  datamodule1.QueryServicos.open;

  DataModule1.QueryRCS.Close;
  DataModule1.QueryRCS.SQL.Text :=
  'SELECT c.id_cargo, ' +
  '       c.nome_cargo, ' +
  '       STRING_AGG(s.nome, '','')::varchar(500) AS nome ' +
  'FROM cargos c ' +
  'LEFT JOIN cargos_servicos cp ON c.id_cargo = cp.id_cargo ' +
  'LEFT JOIN servicos s ON cp.id_servico = s.id_servico '  +
  'WHERE c.id_empresa = :id_empresa ' +
  'GROUP BY c.id_cargo, c.nome_cargo ' +
  'ORDER BY c.nome_cargo;';
  DataModule1.QueryRCS.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  DataModule1.QueryRCS.Open;


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
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    if DataModule1.QueryCargos.State in [dsEdit, dsInsert] then
      DataModule1.QueryCargos.Post;

    id_cargo := DataModule1.QueryCargos.FieldByName('id_cargo').AsInteger;
    for i := 0 to CLBServicos.Items.Count - 1 do
    begin
      if CLBServicos.Checked[i] then
      begin
        id_ser := Integer(CLBServicos.Items.Objects[i]);
        with DataModule1.QueryCS do
        begin
          Close;
          SQL.Text := 'DELETE FROM cargos_servicos WHERE id_cargo = :id_cargo';
          ParamByName('id_cargo').AsInteger := id_cargo;
          ExecSQL;
        end;

        with DataModule1.QueryCS do
        begin
          Close;
          SQL.Text := 'INSERT INTO cargos_servicos (id_cargo, id_servico, id_empresa) VALUES (:id_cargo, :id_servico, :id_empresa)';
          ParamByName('id_cargo').AsInteger := id_cargo;
          ParamByName('id_servico').AsInteger := id_ser;
          parambyname('id_empresa').AsInteger := datamodule1.id_empresa;
          ExecSQL;
          datamodule1.QueryRCS.Close;
          datamodule1.QueryRCS.open;
        end;
      end;
    end;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible := True;
    Lblrequired.Visible := False;
    CLBServicos.Visible := False;
    addclie.Visible := True;
  end
  else
  begin
    Lblrequired.Visible := True;
  end;
end;




procedure TForm14.Timer1Timer(Sender: TObject);
begin
  LbErroExcl.Visible := False;
  Timer1.Enabled := False;
end;

procedure TForm14.TrazerServicos;
begin
if not datamodule1.QueryServicos.IsEmpty then
begin
  CLBServicos.Items.Clear;
  datamodule1.QueryServicos.First;
  while not datamodule1.QueryServicos.Eof do
  begin
    CLBServicos.Items.AddObject(
      datamodule1.QueryServicos.FieldByName('nome').AsString,
      TObject(datamodule1.QueryServicos.FieldByName('id_servico').AsInteger)
    );
    datamodule1.QueryServicos.Next;
  end;
end;
end;

end.
