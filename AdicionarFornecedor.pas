unit AdicionarFornecedor;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,CClientes, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Skia, Vcl.Mask, Vcl.DBCtrls;

type
  TForm6 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    Lblrequired: TLabel;
    PCad: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure PbtnVoltarClick(Sender: TObject);
    procedure LbClientesClick(Sender: TObject);
    procedure LbBSClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;

implementation

{$R *.dfm}

uses CFornecedores, UMetodos, UDataModule;

procedure TForm6.FormCreate(Sender: TObject);
begin
  Form6.WindowState:=wsMaximized;
  Lblrequired.Visible:= false;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
 datamodule1.Queryfornecedores.append;
end;

procedure TForm6.Image1Click(Sender: TObject);
begin
Form7.Show;
end;

procedure TForm6.LbBSClick(Sender: TObject);
begin
TMetodos.TelaPrincipal;
end;

procedure TForm6.LbClientesClick(Sender: TObject);
begin
  Form6.Hide;
  Form4.Show;
end;

procedure TForm6.PbtnVoltarClick(Sender: TObject);
begin
  Form7.Show;
  Form6.Hide;
end;

procedure TForm6.PCadClick(Sender: TObject);
begin
if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
   begin
    datamodule1.Queryfornecedores.Post;
    Form7.show;
    Form6.Close;
  end else begin
    Lblrequired.Visible:= true;
  end;
end;

end.
