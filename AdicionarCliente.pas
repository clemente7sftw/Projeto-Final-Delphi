unit AdicionarCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Skia, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TForm5 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    PCad: TPanel;
    Lblrequired: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure PbtnVoltarClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses CClientes, UMetodos, CFornecedores, UDataModule;

procedure TForm5.FormCreate(Sender: TObject);
begin

  Form5.WindowState:=wsMaximized;
  lblrequired.Visible:= false;
end;


procedure TForm5.FormShow(Sender: TObject);
begin
  datamodule1.QueryClientes.Append;
end;

procedure TForm5.Image1Click(Sender: TObject);
begin
  Form5.Close;
  Form4.Show;
end;

procedure TForm5.LbFornecedoresClick(Sender: TObject);
begin
  Form5.Hide;
  Form7.Show;
end;

procedure TForm5.PbtnVoltarClick(Sender: TObject);
begin
    Form5.Hide;
    Form4.Show;
end;

procedure TForm5.PCadClick(Sender: TObject);
begin
if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') then
   begin
    datamodule1.QueryClientes.Post;
    Form4.show;
    Form5.Close;
  end else begin
    Lblrequired.Visible:= true;
  end;
end;

end.
