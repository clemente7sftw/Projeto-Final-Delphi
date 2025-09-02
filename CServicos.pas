unit CServicos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.Skia, Vcl.ExtCtrls;

type
  TForm15 = class(TForm)
    Fundo: TPanel;
    Image6: TImage;
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
    CDados: TPanel;
    editar: TImage;
    Image3: TImage;
    Image7: TImage;
    ListBox1: TListBox;
    procedure FormCreate(Sender: TObject);
    procedure Image6Click(Sender: TObject);
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

procedure TForm15.Image6Click(Sender: TObject);
begin
  Form3.Show;
  Form15.Hide;
end;

end.
