unit CHorarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Skia, Vcl.ExtCtrls;

type
  TForm17 = class(TForm)
    procedure FormCreate(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form17: TForm17;

implementation

{$R *.dfm}

uses TelaPrincipalN1;

procedure TForm17.FormCreate(Sender: TObject);
begin
  Form17.WindowState:=wsMaximized;
end;

procedure TForm17.Image1Click(Sender: TObject);
begin
  Form3.Show;
  Form17.Hide;
end;

procedure TForm17.PbtnAddClick(Sender: TObject);
begin
  Form17.Hide;

end;

end.
