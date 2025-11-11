unit n4_tela_inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm30 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    Image5: TImage;
    BS: TImage;
    Label1: TLabel;
    Image2: TImage;
    DBGrid1: TDBGrid;
    Barra: TPanel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

procedure TForm30.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
end;

end.
