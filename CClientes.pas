unit CClientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,AdicionarCliente, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Vcl.Skia, Vcl.Imaging.jpeg, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TForm4 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BtnAdd: TPanel;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    BtnConf: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure BtnConfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CFornecedores, TelaInicialN3, UDataModule;

procedure TForm4.BtnAddClick(Sender: TObject);
begin
  Form5.Show;
  Form4.close;
end;

procedure TForm4.BtnConfClick(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    if not (DataModule1.QueryServicos.State in [dsEdit, dsInsert]) then
    DataModule1.QueryClientes.Edit;
    DataModule1.QueryClientes.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
  end;
end;

procedure TForm4.BtnEditarClick(Sender: TObject);
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
end;

procedure TForm4.BtnExcluirClick(Sender: TObject);
begin
  datamodule1.QueryClientes.delete;
end;

procedure TForm4.EditsAtivos;
begin
  DBEdit1.Enabled := true;
  DBEdit2.Enabled := true;
end;

procedure TForm4.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
    Form4.WindowState:=wsMaximized;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  datamodule1.QueryClientes.Close;
  datamodule1.QueryClientes.Open;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  Form20.Show;
  Form4.Close;
end;


procedure TForm4.PbtnAddClick(Sender: TObject);
begin
  Form5.Show;
  Form4.Hide;
end;


end.
