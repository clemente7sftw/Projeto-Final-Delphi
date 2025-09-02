unit CHorarios;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Grids, Vcl.Imaging.pngimage,
  Vcl.StdCtrls, Vcl.Skia, Vcl.ExtCtrls;

type
  TForm17 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    Label5: TLabel;
    Barra: TPanel;
    Image4: TImage;
    Label1: TLabel;
    Image5: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label15: TLabel;
    PbtnAdd: TPanel;
    Image2: TImage;
    StringGrid1: TStringGrid;
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

uses AdicionarHorario, TelaPrincipalN1;

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
  Form13.Show;
end;

end.
