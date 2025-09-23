unit CServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, AdicionarServico, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls;

type
  TForm15 = class(TForm)
    Fundo: TPanel;
    PbtnAdd: TPanel;
    DBGServicos: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnConf: TPanel;
    Image1: TImage;
    DBEdCaminhoF: TDBEdit;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure MostrarFoto;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

uses TelaPrincipalN1, UDataModule;

procedure TForm15.BtnConfClick(Sender: TObject);
begin
  if (Trim(DBEdit1.Text) <> '') and (Trim(DBEdit2.Text) <> '') and (Trim(DBEdit3.Text) <> '') then
  begin
    if not (DataModule1.FDQueryServicos.State in [dsEdit, dsInsert]) then
    DataModule1.FDQueryServicos.Edit;
    DataModule1.FDQueryServicos.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
  end;
end;

procedure TForm15.BtnEditarClick(Sender: TObject);
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;

end;

procedure TForm15.BtnExcluirClick(Sender: TObject);
begin
  datamodule1.FDQueryServicos.delete;
end;

procedure TForm15.EditsAtivos;
begin
  DBEdit1.Enabled := true;
  DBEdit2.Enabled := true;
  DBEdit3.Enabled := true;
end;

procedure TForm15.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Form15.WindowState:=wsMaximized;
  BtnConf.Visible := false;
  DBEdCaminhoF.Visible:= false;


end;


procedure TForm15.FormShow(Sender: TObject);
begin
  datamodule1.FDQueryServicos.Close;
  datamodule1.FDQueryServicos.Open;
  MostrarFoto;

end;

procedure TForm15.MostrarFoto;
begin
var
  Caminho: string;
begin
  if DataModule1.FDQueryServicos.IsEmpty then
  begin
    Image1.Picture := nil;
    Exit;
  end;
  Caminho := DataModule1.FDQueryServicos.FieldByName('foto_url').AsString;
  Caminho := 'C:\meu_app\images\' + Caminho;
  if FileExists(Caminho) then
    Image1.Picture.LoadFromFile(Caminho)
end;

end;

procedure TForm15.PbtnAddClick(Sender: TObject);
begin
  Form10.show;
  Form15.Hide;

end;

end.
