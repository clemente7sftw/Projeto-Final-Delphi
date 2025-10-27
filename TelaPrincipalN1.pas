unit TelaPrincipalN1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, UDataModule, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm3 = class(TForm)
    Fundo: TPanel;
    Barra: TPanel;
    Image4: TImage;
    Image5: TImage;
    BS: TImage;
    LbEst: TLabel;
    LbAgn: TLabel;
    Label1: TLabel;
    Panel1: TPanel;
    Image1: TImage;
    DBGrid1: TDBGrid;
    Image2: TImage;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Panel1Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

uses N1MudarSenha, n1_agendamentos, relatorios_servicos;

procedure TForm3.FormCreate(Sender: TObject);
begin
    Form3.WindowState:=wsMaximized;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
//  datamodule1.FDQueryReservas.close;
//  datamodule1.FDQueryReservas.Open;
end;

procedure TForm3.Image2Click(Sender: TObject);
begin
Form24.show;
end;


procedure TForm3.Panel1Click(Sender: TObject);
begin
  Form26.show;
end;

end.
