unit CPacotesPromocionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm16 = class(TForm)
    Fundo: TPanel;
    DBGrid1: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form16: TForm16;

implementation

{$R *.dfm}

uses TelaPrincipalN1;

procedure TForm16.FormCreate(Sender: TObject);
begin
  Form16.WindowState:=wsMaximized;
end;

procedure TForm16.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form16.Hide;
end;

end.
