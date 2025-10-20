unit CServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, AdicionarServico, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Mask, Vcl.DBCtrls, FireDAC.Comp.Client, FireDAC.Stan.Error,   Vcl.ComCtrls;

type
  TForm15 = class(TForm)
    Fundo: TPanel;
    DBGServicos: TDBGrid;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DBEdit1: TDBEdit;
    StatusBar1: TStatusBar;
    lbaviso: TLabel;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    addclie: TImage;
    BtnEditar: TImage;
    BtnExcluir: TImage;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnConf: TPanel;
    Label1: TLabel;
    Lblrequired: TLabel;
    BtnCad: TPanel;
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
    procedure Cadastrar;
    procedure Adicionar;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure addclieClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);
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
 Lblrequired.Visible:= false;
end;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Form15.WindowState:=wsMaximized;
  BtnConf.Visible := false;
  lbaviso.visible := false;
  Lblrequired.Visible:= false;
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


procedure TForm15.Image1Click(Sender: TObject);
begin
Editar;
end;

procedure TForm15.Image3Click(Sender: TObject);
begin
Excluir;
end;

procedure TForm15.addclieClick(Sender: TObject);
begin
Adicionar;
end;

procedure TForm15.Adicionar;
begin
editsativos;
 datamodule1.QueryServicos.Append;
end;

procedure TForm15.BtnCadClick(Sender: TObject);
begin
  Cadastrar;
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

procedure TForm15.Cadastrar;
begin
 var  id_empresa:integer;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
     begin

      with DataModule1.QueryServicos do
      begin
          id_empresa:= DataModule1.id_empresa;
          DataModule1.Queryservicos.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;
          datamodule1.QueryServicos.Post;
          Form15.show;
          Form10.Close;
      end;
    end else begin
      Lblrequired.Visible:= true;
    end;
end;
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
