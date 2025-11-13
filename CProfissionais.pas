unit CProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Skia,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.CheckLst, Vcl.WinXPickers;

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
    Label4: TLabel;
    Label5: TLabel;
    CLBDias: TCheckListBox;
    TimePicker1: TTimePicker;
    TimePicker2: TTimePicker;
    Label6: TLabel;
    Label7: TLabel;
    DBEdit4: TDBEdit;
    Label8: TLabel;
    DBEdit6: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure Excluir;
    procedure Editar;
    procedure Cancelar;
    procedure Salvar;
    procedure TrazerCargos;
    procedure TrazerDias;
    procedure AdicionarProfissional;
    procedure atualizar_grid;
    procedure icones_escondidos;
    procedure icones_visiveis;
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
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    procedure Pesquisar;
    { Private declarations }
  public
    var  id_empresa:integer;
    { Public declarations }
  end;

var
  Form8: TForm8;
  id_pro, id_dia: integer;

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
DBEdit1.DataSource := nil;
DBEdit2.DataSource := nil;
DBEdit3.DataSource := nil;
  form9.show;
  form8.close;
end;

procedure TForm8.atualizar_grid;
begin
with datamodule1.queryprofissionais do
begin
Close;
SQL.Text :=
  'SELECT ' +
  '  p.id_pro, ' +
  '  p.nome, ' +
  '  p.email, ' +
  '  STRING_AGG(DISTINCT c.nome_cargo, '', '')::varchar(500) AS nome_cargo, ' +
  '  STRING_AGG(DISTINCT ' +
  '    CASE h.dia_semana ' +
  '      WHEN 0 THEN ''Domingo'' ' +
  '      WHEN 1 THEN ''Segunda'' ' +
  '      WHEN 2 THEN ''Terça'' ' +
  '      WHEN 3 THEN ''Quarta'' ' +
  '      WHEN 4 THEN ''Quinta'' ' +
  '      WHEN 5 THEN ''Sexta'' ' +
  '      WHEN 6 THEN ''Sábado'' ' +
  '    END, '','')::varchar(200) AS dias_semana ' +
  'FROM profissionais p ' +
  'LEFT JOIN profissionais_cargos pc ON p.id_pro = pc.id_pro ' +
  'LEFT JOIN cargos c ON pc.id_cargo = c.id_cargo ' +
  'LEFT JOIN horarios_profissionais h ON p.id_pro = h.id_pro ' +
  'WHERE p.id_empresa = :id_empresa ' +
  'GROUP BY p.id_pro, p.nome, p.email ' +
  'ORDER BY p.nome;';


ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
Open;
DSconexao.DataSet := DataModule1.queryprofissionais;
dbgrid1.DataSource := dsconexao;
DBEdit1.DataField := 'nome';
DBEdit2.DataField := 'email';
DBEdit3.DataField := 'nome_cargo';
TimePicker1.Time := EncodeTime(12, 0, 0, 0);
TimePicker2.Time := EncodeTime(12, 0, 0, 0);

end;
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


procedure TForm8.Cancelar;
begin
  btncancelar.Visible := false;
  editsinativos;
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  Lblrequired.visible:= false;
  icones_escondidos;
  addclie.Visible := true;
  clbcargos.Visible := false;
  dbedit3.Visible := true;

end;

procedure TForm8.Editar;
begin
  TimePicker1.Time := EncodeTime(12, 0, 0, 0);
  TimePicker2.Time := EncodeTime(12, 0, 0, 0);
  DBEdit3.Visible := False;
  BtnConf.Visible := True;
  ExclBtn.Visible := False;
  EditsAtivos;
  EditBtn.Visible := False;
  addclie.Visible := False;
  CLBCargos.Visible := True;
  TrazerCargos;
  icones_visiveis;
  TrazerDias;
  btncancelar.Visible := True;
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
    DBEdit4.Enabled := true;
    DBEdit6.Enabled := true;
end;

procedure TForm8.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;
  DBEdit4.Enabled := false;
  DBEdit6.Enabled := false;
end;

procedure TForm8.ExclBtnClick(Sender: TObject);
begin
 Excluir;
end;

procedure TForm8.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Profissional? Essa ação não poderá ser desfeita.', 'Exclusão de Profissional', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
    with datamodule1.queryprofissionais do
  begin
    id_pro := DataModule1.queryprofissionais.FieldByName('id_pro').AsInteger;
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

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
DBEdit1.DataSource := nil;
DBEdit2.DataSource := nil;
DBEdit3.DataSource := nil;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Form8.WindowState:=wsMaximized;
  Lblrequired.visible:= false;
  EditsInativos;
  BtnConf.Visible:= false;
  btncancelar.Visible:= false;
  CLBCargos.Visible:= false;
  icones_escondidos;
end;


procedure TForm8.FormShow(Sender: TObject);
begin
atualizar_grid;
end;

procedure TForm8.icones_escondidos;
begin
Label7.Visible := false;
TimePicker1.Visible := false;
TimePicker2.Visible := false;
Label6.Visible := false;
Label5.Visible := false;
CLBDias.Visible := false;
Label4.Visible := false;
end;

procedure TForm8.icones_visiveis;
begin
Label7.Visible := true;
TimePicker1.Visible := true;
TimePicker2.Visible := true;
Label6.Visible := true;
Label5.Visible := true;
CLBDias.Visible := true;
Label4.Visible := true;
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
//  if (EdPesquisa.Text <> '' )then
//  begin
//    datamodule1.QueryRPC.Filtered := true;
//    datamodule1.QueryRPC.filter :=  'UPPER(nome_clie) LIKE ' + QuotedStr('%' + UpperCase(EdPesquisa.Text) + '%');
// end else
//  begin
//    datamodule1.QueryRPC.Filtered := false;
//  end;
end;

procedure TForm8.Salvar;
var
  id_pro, id_cargo, i: Integer;
begin
  if (dbEdit1.Text <> '') and (dbEdit2.Text <> '') then
  begin
    id_pro := DataModule1.queryprofissionais.FieldByName('id_pro').AsInteger;

    with DataModule1.queryprofissionais do
    begin
    begin
    Edit;
    FieldByName('nome').AsString := dbEdit1.Text;
    FieldByName('email').AsString := dbEdit2.Text;
    Post;
    end;
    end;

    with DataModule1.queryprofissionais do
    begin
      Close;
      SQL.Text := 'DELETE FROM profissionais_cargos WHERE id_pro = :id_pro';
      ParamByName('id_pro').AsInteger := id_pro;
      ExecSQL;
      end;

      for i := 0 to CLBCargos.Count - 1 do
      begin
        if CLBCargos.Checked[i] then
        begin
          id_cargo := Integer(CLBCargos.Items.Objects[i]);
          with datamodule1.queryprofissionais do
          begin
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

    with DataModule1.queryprofissionais do
    begin
      Close;
      SQL.Text := 'DELETE FROM horarios_profissionais WHERE id_pro = :id_pro';
      ParamByName('id_pro').AsInteger := id_pro;
      ExecSQL;
      end;
          for i := 0 to CLBDias.Count - 1 do
      begin
        if CLBDias.Checked[i] then
        begin
          id_dia := Integer(CLBDias.Items.Objects[i]);
          with datamodule1.queryprofissionais do
          begin
          Close;
          SQL.Text :=
            'INSERT INTO horarios_profissionais (id_empresa, id_pro, dia_semana, hora_inicio, hora_fim) ' +
            'VALUES (:id_empresa, :id_pro, :dia_semana, :hora_inicio, :hora_fim)';
          ParamByName('id_pro').AsInteger := id_pro;
          ParamByName('dia_semana').AsInteger := id_dia;
          ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
          ParamByName('hora_inicio').AsTime := TimePicker1.Time;
          ParamByName('hora_fim').AsTime := TimePicker2.Time;
          ExecSQL;
        end;
      end;
    end;
end;
    EditsInativos;
    BtnConf.Visible := False;
    ExclBtn.Visible := True;
    EditBtn.Visible := True;
    addclie.Visible := True;
    Lblrequired.Visible := False;
    CLBCargos.Visible := False;
    dbgrid1.Enabled:= true;
    atualizar_grid;
    dbedit3.Visible := true;
    icones_escondidos;
  end;

procedure TForm8.TrazerCargos;
var
  id_pro, i: Integer;
begin

  with DataModule1.query_conexao do
  begin
    id_pro := DataModule1.queryprofissionais.FieldByName('id_pro').AsInteger;

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
  atualizar_grid;
end;
procedure TForm8.TrazerDias;
var
  id_pro, i: Integer;
begin
  CLBDias.Items.Clear;
  CLBDias.Items.AddObject('Domingo', TObject(0));
  CLBDias.Items.AddObject('Segunda-feira', TObject(1));
  CLBDias.Items.AddObject('Terça-feira', TObject(2));
  CLBDias.Items.AddObject('Quarta-feira', TObject(3));
  CLBDias.Items.AddObject('Quinta-feira', TObject(4));
  CLBDias.Items.AddObject('Sexta-feira', TObject(5));
  CLBDias.Items.AddObject('Sábado', TObject(6));

  id_pro := DataModule1.queryprofissionais.FieldByName('id_pro').AsInteger;

  with DataModule1.query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT dia_semana FROM horarios_profissionais WHERE id_pro = :id_pro';
    ParamByName('id_pro').AsInteger := id_pro;
    Open;

    while not Eof do
    begin
      for i := 0 to CLBDias.Count - 1 do
      begin
        if Integer(CLBDias.Items.Objects[i]) = FieldByName('dia_semana').AsInteger then
        begin
          CLBDias.Checked[i] := True;
          Break;
        end;
      end;
      Next;
    end;
  end;
end;


end.
