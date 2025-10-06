unit Agendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.CheckLst, Vcl.Mask, Vcl.ComCtrls,
  Vcl.WinXPickers;

type
  TForm13 = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    DataSource2: TDataSource;
    Panel2: TPanel;
    CheckListBoxServicos: TCheckListBox;
    TimePicker1: TTimePicker;
    CheckListBoxProfissionais: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PreencherListBoxServicos;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm13.FormShow(Sender: TObject);
begin
  datamodule1.QueryClientes.close;
  datamodule1.QueryClientes.open;
  datamodule1.QueryServicos.close;
  datamodule1.QueryServicos.open;
  datamodule1.QueryProfissionais.close;
  datamodule1.QueryProfissionais.open;
  PreencherListBoxServicos;
end;

procedure TForm13.PreencherListBoxServicos;
begin
if not datamodule1.QueryServicos.IsEmpty then
begin
  CheckListBoxServicos.Items.Clear;
  datamodule1.QueryServicos.First;
  while not datamodule1.QueryServicos.Eof do
  begin
    CheckListBoxServicos.Items.AddObject(
      datamodule1.QueryServicos.FieldByName('nome').AsString,
      TObject(datamodule1.QueryServicos.FieldByName('id_servico').AsInteger)
    );
    datamodule1.QueryServicos.Next;
  end;
end;
end;

procedure TForm13.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;
end.
