unit CFornecedores;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, AdicionarFornecedor, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Skia,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask,
  Vcl.DBCtrls;

type
  TForm7 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    BtnConf: TPanel;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnAdd: TPanel;
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Lblrequired: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure FormShow(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;

implementation

{$R *.dfm}

uses TelaPrincipalN1, CClientes, AdicionarCliente, UDataModule;

procedure TForm7.BtnAddClick(Sender: TObject);
begin
Form6.Show;
Form7.Close;
end;

procedure TForm7.BtnConfClick(Sender: TObject);
begin
  if (DBEdit1.Text <> '' ) and (DBEdit2.Text <> '' )then
  begin
    if not (DataModule1.QueryCargos.State in [dsEdit, dsInsert]) then
    DataModule1.Queryfornecedores.Edit;
    DataModule1.Queryfornecedores.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
    Lblrequired.visible:= false;
  end else begin
    Lblrequired.visible:= true;
  end;
end;

procedure TForm7.BtnEditarClick(Sender: TObject);
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
end;

procedure TForm7.BtnExcluirClick(Sender: TObject);
begin
   datamodule1.Queryfornecedores.delete;
end;

procedure TForm7.EditsAtivos;
begin
  DBEdit1.Enabled := true;
  DBEdit2.Enabled := true;
end;

procedure TForm7.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
end;

procedure TForm7.FormCreate(Sender: TObject);
begin
  Form7.WindowState:=wsMaximized;
  BtnConf.Visible := False;
  EditsInativos;
  Lblrequired.visible:= false;

end;

procedure TForm7.FormShow(Sender: TObject);
begin
  datamodule1.Queryfornecedores.Close;
  datamodule1.Queryfornecedores.Open;
end;

procedure TForm7.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form7.Hide;
end;

procedure TForm7.Label2Click(Sender: TObject);
begin
  Form7.Hide;
  Form4.Show;
end;

procedure TForm7.PbtnAddClick(Sender: TObject);
begin
  Form6.Show;
  Form7.Hide;
end;

end.
