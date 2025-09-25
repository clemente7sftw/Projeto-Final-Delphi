unit CProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,  AdicionarCliente, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Skia,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids;

type
  TForm8 = class(TForm)
    Fundo: TPanel;
    BtnAddFoto: TPanel;
    Panel1: TPanel;
    PbtnAdd: TPanel;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnConf: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure BtnConfClick(Sender: TObject);
  private
    { Private declarations }
  public

    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses CClientes, TelaPrincipalN1, AdicionarProfissional, UDataModule,
  TelaInicialN3;

procedure TForm8.BtnConfClick(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    if not (DataModule1.QueryServicos.State in [dsEdit, dsInsert]) then
    DataModule1.QueryProfissionais.Edit;
    DataModule1.QueryProfissionais.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
  end;
end;

procedure TForm8.BtnExcluirClick(Sender: TObject);
begin
datamodule1.QueryProfissionais.delete;
end;

procedure TForm8.EditsAtivos;
begin
    DBEdit1.Enabled := true;
  DBEdit2.Enabled := true;
end;

procedure TForm8.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Form8.WindowState:=wsMaximized;
end;


procedure TForm8.FormShow(Sender: TObject);
begin
  datamodule1.QueryProfissionais.Close;
  datamodule1.QueryProfissionais.Open;
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



procedure TForm8.Panel2Click(Sender: TObject);
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
end;

procedure TForm8.PbtnAddClick(Sender: TObject);
begin
  Form9.Show;
  Form8.Hide;
end;
end.
