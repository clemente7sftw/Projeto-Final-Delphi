unit CServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, AdicionarServico, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TForm15 = class(TForm)
    Fundo: TPanel;
    PbtnAdd: TPanel;
    GServicos: TStringGrid;
    procedure FormCreate(Sender: TObject);
    procedure PbtnAddClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form15: TForm15;

implementation

{$R *.dfm}

uses TelaPrincipalN1;

procedure TForm15.FormCreate(Sender: TObject);
begin
  Form15.WindowState:=wsMaximized;
end;


procedure TForm15.PbtnAddClick(Sender: TObject);
begin
  Form10.show;
  Form15.Hide;
end;

end.
