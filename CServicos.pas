unit CServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, AdicionarServico, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Error,   Vcl.ComCtrls;

type
  TForm15 = class(TForm)
    Fundo: TPanel;
    PbtnAdd: TPanel;
    DBGServicos: TDBGrid;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnConf: TPanel;
    DataSource1: TDataSource;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Label3: TLabel;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    StatusBar1: TStatusBar;
    lbaviso: TLabel;
    procedure Excluir;
    procedure FormCreate(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Editar;
    procedure Salvar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
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


procedure TForm15.FormClose(Sender: TObject; var Action: TCloseAction);
begin
lbaviso.visible := false;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Form15.WindowState:=wsMaximized;
  BtnConf.Visible := false;
  lbaviso.visible := false;
end;

procedure TForm15.FormShow(Sender: TObject);
begin
  datamodule1.QueryServicos.Close;
  DataModule1.QueryServicos.SQL.Text :=
  'SELECT * FROM servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome;';
   DataModule1.QueryServicos.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  datamodule1.QueryServicos.Open;
  EditsInativos;
end;


procedure TForm15.BtnConfClick(Sender: TObject);
begin
  Salvar;
end;

procedure TForm15.BtnEditarClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm15.BtnExcluirClick(Sender: TObject);
begin
 Excluir;
end;

procedure TForm15.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TForm15.Editar;
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
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

procedure TForm15.Excluir;
begin
  if Application.MessageBox(
    'Atenção: ao excluir este serviço, ele será removido também dos cargos associados. Deseja continuar?',
    'Exclusão de Serviços',
    MB_YESNO + MB_ICONQUESTION
  ) = IDYES then
  begin
    try
      DataModule1.QueryServicos.Delete;

    except
      on E: EFDDBEngineException do
      begin
        if Pos('chave estrangeira', LowerCase(E.Message)) > 0 then
        lbaviso.visible := true
        else
      end;
    end;
  end
  else
    Exit;
end;



procedure TForm15.PbtnAddClick(Sender: TObject);
begin
  Form10.show;
  Form15.Hide;
end;

procedure TForm15.Salvar;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
  begin
    if not (DataModule1.QueryServicos.State in [dsEdit, dsInsert]) then
    DataModule1.QueryServicos.Edit;
    DataModule1.QueryServicos.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
  end;
end;

end.
