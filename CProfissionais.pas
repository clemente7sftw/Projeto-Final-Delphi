unit CProfissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Skia,
  Vcl.Imaging.pngimage, Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.CheckLst;

type
  TForm8 = class(TForm)
    Fundo: TPanel;
    Panel1: TPanel;
    PbtnAdd: TPanel;
    BtnExcluir: TPanel;
    BtnConf1: TPanel;
    Panel2: TPanel;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    DataSourceRPC: TDataSource;
    LbPro: TLabel;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Image4: TImage;
    BS: TImage;
    addclie: TImage;
    EditBtn: TImage;
    ExclBtn: TImage;
    btncancelar: TImage;
    EdPesquisa: TEdit;
    Panel3: TPanel;
    Image2: TImage;
    Image1: TImage;
    Lblrequired: TLabel;
    BtnCad: TPanel;
    BtnConf: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    CLBCargos: TCheckListBox;
    procedure FormCreate(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure EditsAtivos;
    procedure EditsInativos;
    procedure Excluir;
    procedure Editar;
    procedure Cancelar;
    procedure AdicionarProfissional;
    procedure BtnConf1Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure addclieClick(Sender: TObject);
    procedure BtnCadClick(Sender: TObject);

  private
    procedure Pesquisar;
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

procedure TForm8.addclieClick(Sender: TObject);
begin
  AdicionarProfissional;
end;

procedure TForm8.AdicionarProfissional;
begin
  DataModule1.QueryRPC.Append;
  DataModule1.QueryRPC.FieldByName('nome').Clear;
  DataModule1.QueryRPC.FieldByName('email').Clear;
  CLBCargos.Visible:= True;
  DBEdit3.Visible:= false;
  EditsAtivos;
  BtnCad.Visible := true;
  EditBtn.Visible := false;
  ExclBtn.Visible := false;
  btncancelar.Visible := true;
end;

procedure TForm8.BtnCadClick(Sender: TObject);
begin
CLBCargos.Visible:= false;
end;

procedure TForm8.btncancelarClick(Sender: TObject);
begin
  Cancelar;
end;

procedure TForm8.BtnConf1Click(Sender: TObject);
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    if not (DataModule1.QueryServicos.State in [dsEdit, dsInsert]) then
    DataModule1.QueryProfissionais.Edit;
    DataModule1.QueryProfissionais.Post;
    EditsInativos;
    BtnConf.Visible := False;
    ExclBtn.Visible := True;
    EditBtn.Visible:= true;
    addclie.Visible:= true;
    Lblrequired.visible:= false;
    CLBCargos.Visible:= false;
  end else begin
    Lblrequired.visible:= true;
  end;
end;

procedure TForm8.BtnExcluirClick(Sender: TObject);
begin
datamodule1.QueryProfissionais.delete;
end;



procedure TForm8.Cancelar;
begin
  datamodule1.QueryRPC.Cancel;
  btncancelar.Visible := false;
  editsinativos;
  BtnCad.Visible:= false;
  EditBtn.Visible := true;
  ExclBtn.Visible := true;
  Lblrequired.visible:= false;

end;

procedure TForm8.Editar;
begin
  BtnConf.Visible:= true;
  ExclBtn.Visible:= false;
  EditsAtivos;
  EditBtn.Visible:= false;
  addclie.Visible:= false;
  CLBCargos.Visible:= true;
  DBEdit3.Visible:= false;
end;

procedure TForm8.EditBtnClick(Sender: TObject);
begin
  Editar;
end;

procedure TForm8.EditsAtivos;
begin
    DBEdit1.Enabled := true;
    DBEdit2.Enabled := true;
    DBEdit3.Enabled := true;
end;

procedure TForm8.EditsInativos;
begin
  DBEdit1.Enabled := false;
  DBEdit2.Enabled := false;
  DBEdit3.Enabled := false;
end;

procedure TForm8.ExclBtnClick(Sender: TObject);
begin
 Excluir;
end;

procedure TForm8.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Profissional? Essa ação não poderá ser desfeita.', 'Exclusão de Profissional', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
  datamodule1.QueryRPC.delete;
  end
  else
  begin
   exit;
  end;
end;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Form8.WindowState:=wsMaximized;
  Lblrequired.visible:= false;
  EditsInativos;
  BtnConf.Visible:= false;
  BtnCad.Visible:= false;
  btncancelar.Visible:= false;
  CLBCargos.Visible:= false;
end;


procedure TForm8.FormShow(Sender: TObject);
begin

  datamodule1.QueryPC.close;
  datamodule1.QueryPC.open;
//  datamodule1.QueryCargos.close;
//  datamodule1.QueryCargos.open;
  datamodule1.Queryprofissionais.close;
  datamodule1.Queryprofissionais.open;
  DataModule1.QueryRPC.close;
  DataModule1.QueryRPC.Open;

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



procedure TForm8.LbClieClick(Sender: TObject);
begin
Form4.show;
Form8.close;
end;

procedure TForm8.Panel2Click(Sender: TObject);
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
end;

procedure TForm8.Panel3Click(Sender: TObject);
begin
  Pesquisar;
end;

procedure TForm8.PbtnAddClick(Sender: TObject);
begin
  Form9.Show;
  Form8.Close;
end;
procedure TForm8.Pesquisar;
begin
  if (EdPesquisa.Text <> '' )then
  begin
    datamodule1.QueryClientes.Filtered := true;
    datamodule1.QueryClientes.filter :=  'UPPER(nome_clie) LIKE ' + QuotedStr('%' + UpperCase(EdPesquisa.Text) + '%');
 end else
  begin
    datamodule1.QueryClientes.Filtered := false;
  end;
end;


end.
