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
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    PbtnAdd: TPanel;
    DBGServicos: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnConf: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure FundoClick(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure MostrarMenu;
    procedure TirarMenu;
    { Public declarations }
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses CClientes, TelaPrincipalN1, AdicionarProfissional;

procedure TForm8.FormCreate(Sender: TObject);
begin
  Form8.WindowState:=wsMaximized;
  MostrarMenu;
end;

procedure TForm8.FundoClick(Sender: TObject);
begin
  Menu.Visible := False;
end;

procedure TForm8.Image6Click(Sender: TObject);
begin
  Form3.Show;
  Form8.Hide;
end;

procedure TForm8.Label2Click(Sender: TObject);
begin
  ///Form4.Show;  para mostrar clientes
  Form8.Hide;
  Form4.Show;

end;

procedure TForm8.MostrarMenu;
begin
  Menu.Visible := True;
end;

procedure TForm8.PbtnAddClick(Sender: TObject);
begin
  Form9.Show;
  Form8.Hide;
end;

procedure TForm8.TirarMenu;
begin
  Menu.Visible := False;
end;

end.
