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
    BtnAdd: TPanel;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    BtnConf: TPanel;
    Lblrequired: TLabel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Image3: TImage;
    DataSource1: TDataSource;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
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
    procedure Image2Click(Sender: TObject);
    procedure Procurar;
    procedure Editar;
    procedure Salvar;
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
Salvar;
end;

procedure TForm4.BtnEditarClick(Sender: TObject);
begin
Editar;
end;

procedure TForm4.BtnExcluirClick(Sender: TObject);
begin
  datamodule1.QueryClientes.delete;
end;

procedure TForm4.Editar;
begin
  BtnConf.Visible:= true;
  BtnExcluir.Visible:= false;
  EditsAtivos;
  BtnEditar.Visible:= false;
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
    BtnConf.Visible := False;
    lblrequired.Visible:= false;
end;

procedure TForm4.FormShow(Sender: TObject);
begin
  datamodule1.QueryClientes.Close;
  datamodule1.QueryClientes.Open;
  EditsInativos;
end;

procedure TForm4.Image1Click(Sender: TObject);
begin
  Form20.Show;
  Form4.Close;
end;


procedure TForm4.Image2Click(Sender: TObject);
begin
  Procurar;
end;

procedure TForm4.PbtnAddClick(Sender: TObject);
begin
  Form5.Show;
  Form4.Hide;
end;


procedure TForm4.Procurar;
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

procedure TForm4.Salvar;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
  begin
    if not (DataModule1.QueryClientes.State in [dsEdit, dsInsert]) then
    DataModule1.QueryClientes.Edit;
    DataModule1.QueryClientes.Post;
    EditsInativos;
    BtnConf.Visible := False;
    BtnExcluir.Visible := True;
    BtnEditar.Visible:= true;
    Lblrequired.visible:= false;
  end else begin
    Lblrequired.visible:= true;
  end;
end;

end.
