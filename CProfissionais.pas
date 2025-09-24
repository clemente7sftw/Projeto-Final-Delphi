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
    DBGProfissionais: TDBGrid;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    BtnConf: TPanel;
    DataSource1: TDataSource;
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Image6Click(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
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

procedure TForm8.FormCreate(Sender: TObject);
begin
  Form8.WindowState:=wsMaximized;
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

procedure TForm8.Label2Click(Sender: TObject);
begin
  ///Form4.Show;  para mostrar clientes
  Form8.Hide;
  Form4.Show;

end;


procedure TForm8.PbtnAddClick(Sender: TObject);
begin
  Form9.Show;
  Form8.Hide;
end;
end.
