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
    ComboBoxHorarios: TComboBox;
    Panel2: TPanel;
    Lblrequired: TLabel;
    DataSource2: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure PreencherServicos;
    procedure DBGrid1CellClick(Column: TColumn);
    procedure DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form26: TForm26;
  var
  id_empresa: Integer;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm26.DBGrid1CellClick(Column: TColumn);
begin
PreencherServicos;
end;

procedure TForm26.DBGrid1DragOver(Sender, Source: TObject; X, Y: Integer;
  State: TDragState; var Accept: Boolean);
begin
PreencherServicos;
end;

procedure TForm26.FormShow(Sender: TObject);
begin
datamodule1.QueryEmpresa.close;
datamodule1.QueryEmpresa.open;

    DataModule1.QueryServicos.Close;
    DataModule1.QueryServicos.SQL.Text :=
      'SELECT * FROM servicos WHERE id_empresa = :id_empresa ORDER BY nome';
    DataModule1.QueryServicos.ParamByName('id_empresa').AsInteger := id_empresa;
    DataModule1.QueryServicos.Open;
PreencherServicos;
end;

procedure TForm26.PreencherServicos;

begin
  if not DataSource1.DataSet.IsEmpty then
  begin
    id_empresa := DataSource1.DataSet.FieldByName('id_empresa').AsInteger;

    CheckListBoxServicos.Items.Clear;
    DataModule1.QueryServicos.First;
    while not DataModule1.QueryServicos.Eof do
    begin
      CheckListBoxServicos.Items.AddObject(
        DataModule1.QueryServicos.FieldByName('nome').AsString,
        TObject(DataModule1.QueryServicos.FieldByName('id_servico').AsInteger)
      );
      DataModule1.QueryServicos.Next;
    end;
  end;
end;


end.
