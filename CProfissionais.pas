unit CProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Skia,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.CheckLst;

type
  TForm8 = class(TForm)
    Fundo: TPanel;
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DSconexao: TDataSource;
    LbPro: TLabel;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Image4: TImage;
    BS: TImage;
    addclie: TImage;
    EditBtn: TImage;
    ExclBtn: TImage;
    btncancelar: TImage;
    EdPesquisa: TEdit;
    Panel3: TPanel;
    Image2: TImage;
    Image1: TImage;
    Lblrequired: TLabel;
    BtnConf: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    CLBCargos: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure Excluir;
    procedure Editar;
    procedure Cancelar;
    procedure Salvar;
    procedure TrazerCargos;
    procedure AdicionarProfissional;
    procedure atualizar_grid;
    procedure BtnConf1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure addclieClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
    procedure LbagendamentosClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);

  private
    procedure Pesquisar;
    { Private declarations }
  public
    var  id_empresa:integer;
    { Public declarations }
  end;

var
  Form8: TForm8;
  id_pro: integer;

implementation

{$R *.dfm}

uses CClientes, TelaPrincipalN1, AdicionarProfissional, UDataModule,
  TelaInicialN3, Agendamentos, CServicos, CCargos, CFornecedores, CAgendamentos;

procedure TForm8.addclieClick(Sender: TObject);
begin
  AdicionarProfissional;
end;

procedure TForm8.AdicionarProfissional;
begin
  form9.show;
  form8.close;
end;

procedure TForm8.atualizar_grid;
begin
DataModule1.QueryRPC.SQL.Text :=
  'SELECT ' +
  '  p.id_pro, ' +
  '  p.nome, ' +
  '  p.email, ' +
  '  STRING_AGG(c.nome_cargo, '', '')::varchar(500) AS nome_cargo ' +
  'FROM profissionais p ' +
  'LEFT JOIN profissionais_cargos pc ON p.id_pro = pc.id_pro ' +
  'LEFT JOIN cargos c ON pc.id_cargo = c.id_cargo ' +
  'WHERE p.id_empresa = :id_empresa ' +
  'GROUP BY p.id_pro, p.nome, p.email ' +
  'ORDER BY p.nome;';
DataModule1.QueryRPC.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
DataModule1.QueryRPC.Open;
end;

procedure TForm8.BtnCadClick(Sender: TObject);
begin
CLBCargos.Visible:= false;
end;

procedure TForm8.btncancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TForm8.BtnConf1Click(Sender: TObject);
begin
  Salvar;
end;

procedure TForm8.BtnExcluirClick(Sender: TObject);
begin
datamodule1.QueryProfissionais.delete;
end;



procedure TForm8.Cancelar;
begin
  datamodule1.QueryRPC.Cancel;
  btncancelar.Visible := false;
  editsinativos;
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  Lblrequired.visible:= false;

end;

procedure TForm8.Editar;
begin
  TrazerCargos;
  BtnConf.Visible:= true;
  ExclBtn.Visible:= false;
  EditsAtivos;
  EditBtn.Visible:= false;
  addclie.Visible:= false;
  CLBCargos.Visible:= true;
  DBEdit3.Visible:= false;
end;

procedure TForm8.EditBtnClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm8.EditsAtivos;
begin
    DBEdit1.Enabled := true;
    DBEdit2.Enabled := true;
    DBEdit3.Enabled := true;
end;

procedure TForm8.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;
end;

procedure TForm8.ExclBtnClick(Sender: TObject);
begin
 Excluir;
end;

procedure TForm8.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Profissional? Essa ação não poderá ser desfeita.', 'Exclusão de Profissional', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    with datamodule1.query_conexao do
  begin
    id_pro := DataModule1.Query_conexao.FieldByName('id_pro').AsInteger;
    Close;
    SQL.Text := 'DELETE FROM profissionais WHERE id_pro = :id_pro';
    ParamByName('id_pro').AsInteger := id_pro;
    ExecSQL;
    atualizar_grid;
  end;
  end
  else
  begin
   exit;
  end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Form8.WindowState:=wsMaximized;
  Lblrequired.visible:= false;
  EditsInativos;
  BtnConf.Visible:= false;
  btncancelar.Visible:= false;
  CLBCargos.Visible:= false;
end;


procedure TForm8.FormShow(Sender: TObject);
begin
  datamodule1.QueryPC.close;
  datamodule1.QueryPC.open;
  datamodule1.QueryCargos.close;
  datamodule1.QueryCargos.open;
  datamodule1.Queryprofissionais.close;
  datamodule1.Queryprofissionais.open;
  DataModule1.QueryProfissionais.SQL.Text :=
  'SELECT * FROM profissionais ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome';
  DataModule1.QueryProfissionais.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  DataModule1.QueryRPC.close;
DataModule1.QueryRPC.SQL.Text :=
  'SELECT ' +
  '  p.id_pro, ' +
  '  p.nome, ' +
  '  p.email, ' +
  '  STRING_AGG(c.nome_cargo, '', '')::varchar(500) AS nome_cargo ' +
  'FROM profissionais p ' +
  'LEFT JOIN profissionais_cargos pc ON p.id_pro = pc.id_pro ' +
  'LEFT JOIN cargos c ON pc.id_cargo = c.id_cargo ' +
  'WHERE p.id_empresa = :id_empresa ' +
  'GROUP BY p.id_pro, p.nome, p.email ' +
  'ORDER BY p.nome;';
DataModule1.QueryRPC.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
DataModule1.QueryRPC.Open;



end;

procedure TForm8.Image1Click(Sender: TObject);
begin
  Form20.show;
  Form8.close;
end;

procedure TForm8.Image6Click(Sender: TObject);
begin
  Form3.Show;
  Form8.Hide;
end;



procedure TForm8.LbagendamentosClick(Sender: TObject);
begin
Form21.show;
end;

procedure TForm8.LbCargosClick(Sender: TObject);
begin
  Form14.show;
end;

procedure TForm8.LbClieClick(Sender: TObject);
begin
Form4.show;
end;

procedure TForm8.LbFornecedoresClick(Sender: TObject);
begin
  Form7.show;
end;


procedure TForm8.LbServicosClick(Sender: TObject);
begin
  Form15.show;
end;

procedure TForm8.Panel2Click(Sender: TObject);
begin
  BtnConf.Visible:= true;
  EditsAtivos;
end;

procedure TForm8.Panel3Click(Sender: TObject);
begin
  Pesquisar;
end;

procedure TForm8.PbtnAddClick(Sender: TObject);
begin
  Form9.Show;
  Form8.Close;
end;
procedure TForm8.Pesquisar;
begin
  if (EdPesquisa.Text <> '' )then
  begin
    datamodule1.QueryRPC.Filtered := true;
    datamodule1.QueryRPC.filter :=  'UPPER(nome_clie) LIKE ' + QuotedStr('%' + UpperCase(EdPesquisa.Text) + '%');
 end else
  begin
    datamodule1.QueryRPC.Filtered := false;
  end;
end;

procedure TForm8.Salvar;
var
  id_pro, id_cargo, i: Integer;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    id_pro := DataModule1.QueryRPC.FieldByName('id_pro').AsInteger;

    with DataModule1.QueryProfissionais do
    begin
      Close;
      SQL.Text :=
        'UPDATE profissionais ' +
        'SET nome = :nome, email = :email ' +
        'WHERE id_pro = :id_pro';
      ParamByName('nome').AsString := DBEdit1.Text;
      ParamByName('email').AsString := DBEdit2.Text;
      ParamByName('id_pro').AsInteger := id_pro;
      ExecSQL;
    end;

    with DataModule1.query_conexao do
    begin
      Close;
      SQL.Text := 'DELETE FROM profissionais_cargos WHERE id_pro = :id_pro';
      ParamByName('id_pro').AsInteger := id_pro;
      ExecSQL;

      for i := 0 to CLBCargos.Count - 1 do
      begin
        if CLBCargos.Checked[i] then
        begin
          id_cargo := Integer(CLBCargos.Items.Objects[i]);
          Close;
          SQL.Text :=
            'INSERT INTO profissionais_cargos (id_pro, id_cargo) ' +
            'VALUES (:id_pro, :id_cargo)';
          ParamByName('id_pro').AsInteger := id_pro;
          ParamByName('id_cargo').AsInteger := id_cargo;
          ExecSQL;
        end;
      end;
    end;
    DataModule1.QueryRPC.SQL.Text :=
    'SELECT ' +
    '  p.id_pro, ' +
    '  p.nome, ' +
    '  p.email, ' +
    '  STRING_AGG(c.nome_cargo, '', '')::varchar(500) AS nome_cargo ' +
    'FROM profissionais p ' +
    'LEFT JOIN profissionais_cargos pc ON p.id_pro = pc.id_pro ' +
    'LEFT JOIN cargos c ON pc.id_cargo = c.id_cargo ' +
    'WHERE p.id_empresa = :id_empresa ' +
    'GROUP BY p.id_pro, p.nome, p.email ' +
    'ORDER BY p.nome;';
    DataModule1.QueryRPC.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    DataModule1.QueryRPC.Open;
    EditsInativos;
    BtnConf.Visible := False;
    ExclBtn.Visible := True;
    EditBtn.Visible := True;
    addclie.Visible := True;
    DBEdit3.Visible:= true;
    Lblrequired.Visible := False;
    CLBCargos.Visible := False;
  end
  else
  begin
    Lblrequired.Visible := True;
  end;
end;



procedure TForm8.TrazerCargos;
var
  id_pro, i: Integer;
begin
  with DataModule1.query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT * FROM cargos ' +
                'WHERE id_empresa = :id_empresa ' +
                'ORDER BY nome_cargo';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;

    CLBCargos.Items.Clear;

    while not Eof do
    begin
      CLBCargos.Items.AddObject(
        FieldByName('nome_cargo').AsString,
        TObject(FieldByName('id_cargo').AsInteger)
      );
      Next;
    end;
  end;

  id_pro := DataModule1.QueryRPC.FieldByName('id_pro').AsInteger;

  with DataModule1.query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT id_cargo FROM profissionais_cargos WHERE id_pro = :id_pro';
    ParamByName('id_pro').AsInteger := id_pro;
    Open;
    while not Eof do
    begin
      for i := 0 to CLBCargos.Count - 1 do
      begin
        if Integer(CLBCargos.Items.Objects[i]) = FieldByName('id_cargo').AsInteger then
        begin
          CLBCargos.Checked[i] := True;
          Break;
        end;
      end;
      Next;
    end;
  end;
end;



end.
