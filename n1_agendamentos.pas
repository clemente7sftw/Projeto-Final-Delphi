unit n1_agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.CheckLst;

type
  TForm26 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    Image5: TImage;
    BS: TImage;
    Label1: TLabel;
    Image2: TImage;
    Barra: TPanel;
    LbEst: TLabel;
    LbAgn: TLabel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    CheckListBoxProfissionais: TCheckListBox;
    CheckListBoxServicos: TCheckListBox;
    Panel2: TPanel;
    Lblrequired: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image1: TImage;
    DBGrid2: TDBGrid;
    DataSource2: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    procedure FormShow(Sender: TObject);
    procedure PreencherServicos;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure Trazerservicos;
    procedure TrazerProfissionaisPorServico(id_servico: Integer);
    procedure DBGrid2CellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;
  id_empresa: integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm26.DBGrid1CellClick(Column: TColumn);
begin
TrazerServicos;
end;

procedure TForm26.DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
TrazerServicos;
end;

procedure TForm26.DBGrid2CellClick(Column: TColumn);
var
  id_servico: Integer;
begin

  if not DataSource2.DataSet.IsEmpty then
  begin
    id_servico := DataSource2.DataSet.FieldByName('id_servico').AsInteger;
    TrazerProfissionaisPorServico(id_servico);
  end;
end;

procedure TForm26.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;

procedure TForm26.FormShow(Sender: TObject);
begin
  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text := 'SELECT id_empresa, nome FROM empresas ORDER BY nome';
    Open;

    DataSource1.DataSet := DataModule1.Query_conexao;
    DBGrid1.DataSource := DataSource1;

    DBGrid1.Columns.Clear;
    DBGrid1.Columns.Add;
    DBGrid1.Columns[0].FieldName := 'nome';
    DBGrid1.Columns[0].Title.Caption := 'Empresas';
    DBGrid1.Columns[0].Width := 250;
  end;

end;

procedure TForm26.PreencherServicos;
begin
//var
//  id_empresa: Integer;
//begin
//  if not DataSource1.DataSet.IsEmpty then
//  begin
//    id_empresa := DataSource1.DataSet.FieldByName('id_empresa').AsInteger;
//
//    CheckListBoxServicos.Items.Clear;
//    DataModule1.QueryServicos.First;
//    while not DataModule1.QueryServicos.Eof do
//    begin
//      CheckListBoxServicos.Items.AddObject(
//        DataModule1.QueryServicos.FieldByName('nome').AsString,
//        TObject(DataModule1.QueryServicos.FieldByName('id_servico').AsInteger)
//      );
//      DataModule1.QueryServicos.Next;
//    end;
//  end;
end;


procedure TForm26.TrazerProfissionaisPorServico(id_servico: Integer);
begin
  with DataModule1.Query_aux do
  begin
    Close;
    SQL.Text :=
      'SELECT DISTINCT p.id_pro, p.nome ' +
      'FROM profissionais p ' +
      'JOIN profissionais_cargos pc ON p.id_pro = pc.id_pro ' +
      'JOIN cargos_servicos cs ON pc.id_cargo = cs.id_cargo ' +
      'WHERE cs.id_servico = :id_servico ' +
      '  AND p.id_empresa = :id_empresa ' +
      'ORDER BY p.nome';
    ParamByName('id_servico').AsInteger := id_servico;
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;

    CheckListBoxProfissionais.Clear;
    while not Eof do
    begin
      CheckListBoxProfissionais.Items.AddObject(
        FieldByName('nome').AsString,
        TObject(FieldByName('id_pro').AsInteger)
      );
      Next;
    end;
  end;
end;

procedure TForm26.TrazerServicos;
begin
  if not DataSource1.DataSet.IsEmpty then
  begin
    id_empresa := DataSource1.DataSet.FieldByName('id_empresa').AsInteger;

    with DataModule1.Query_aux do
    begin
      Close;
      SQL.Text :=
        'SELECT id_servico,duracao, preco, nome ' +
        'FROM servicos ' +
        'WHERE id_empresa = :id_empresa ' +
        'ORDER BY nome';
      ParamByName('id_empresa').AsInteger := id_empresa;
      Open;
    end;

    DataSource2.DataSet := DataModule1.Query_aux;
    DBGrid2.DataSource := DataSource2;

    DBGrid2.Columns.Clear;
    DBGrid2.Columns.Add;
    DBGrid2.Columns[0].FieldName := 'nome';
    DBGrid2.Columns[0].Title.Caption := 'Serviços da empresa';
    DBGrid2.Columns[0].Width := 250;
    DBedit1.DataSource := datasource2;
    DBedit2.DataSource := datasource2;
    DBedit3.DataSource := datasource2;
    dbedit1.DataField := 'nome';
    dbedit2.DataField := 'duracao';
    dbedit3.DataField := 'preco';
  end;
end;




end.
