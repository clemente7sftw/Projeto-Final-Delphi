unit CPacotesPromocionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls;

type
  TForm16 = class(TForm)
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
    CDados: TPanel;
    editar: TImage;
    Image3: TImage;
    ListBox1: TListBox;
    PbtnAdd: TPanel;
    Image2: TImage;
    Image7: TImage;
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
