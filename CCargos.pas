unit CCargos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TForm14 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    BtnConf: TPanel;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnAdd: TPanel;
    Lblrequired: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure BtnAddClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

uses TelaPrincipalN1, UDataModule, AdicionarCargo;

procedure TForm14.BtnAddClick(Sender: TObject);
begin
Form11.show;
end;

procedure TForm14.BtnConfClick(Sender: TObject);
begin
  if DBEdit1.Text <> '' then
  begin
    if not (DataModule1.QueryCargos.State in [dsEdit, dsInsert]) then
    DataModule1.QueryCargos.Edit;
    DataModule1.QueryCargos.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
    Lblrequired.visible:= false;
  end else begin
    Lblrequired.visible:= true;
  end;
end;

procedure TForm14.BtnEditarClick(Sender: TObject);
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
end;

procedure TForm14.BtnExcluirClick(Sender: TObject);
begin
datamodule1.QueryCargos.delete;
end;

procedure TForm14.EditsAtivos;
begin
  DBEdit1.Enabled := true;

end;

procedure TForm14.EditsInativos;
begin
  DBEdit1.Enabled := false;

end;

procedure TForm14.FormCreate(Sender: TObject);
begin
  Form14.WindowState:=wsMaximized;
  BtnConf.Visible := False;
  Lblrequired.visible:= false;
end;

procedure TForm14.FormShow(Sender: TObject);
begin
  datamodule1.QueryCargos_Servicos.Close;
  datamodule1.QueryCargos_Servicos.open;

end;

procedure TForm14.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form14.Hide;
end;

end.
