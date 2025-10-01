unit TelaPrincipalN1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CHorarios,CPacotesPromocionais, AdicionarPP, CCargos, CProfissionais ,CFornecedores,AdicionarCliente, AdicionarProfissional, CServicos, CClientes, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
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
    procedure FormCreate(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label5Click(Sender: TObject);
    procedure LbnProfissionaisClick(Sender: TObject);
    procedure Label6Click(Sender: TObject);
    procedure LbnClientesClick(Sender: TObject);
    procedure LbnFornecedoresClick(Sender: TObject);
    procedure LbnHMClick(Sender: TObject);
    procedure LbnServicosClick(Sender: TObject);
    procedure LbnCargosClick(Sender: TObject);
    procedure LbnPPClick(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }


  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}





procedure TForm3.FormCreate(Sender: TObject);
begin
    Form3.WindowState:=wsMaximized;
end;


procedure TForm3.FormShow(Sender: TObject);
begin
//  datamodule1.FDQueryReservas.close;
//  datamodule1.FDQueryReservas.Open;
end;

procedure TForm3.Label2Click(Sender: TObject);
begin
  Form4.Show;
  Form3.Hide;
end;

procedure TForm3.Label3Click(Sender: TObject);
begin
  Form3.Hide;
  Form17.Show;
end;

procedure TForm3.Label5Click(Sender: TObject);
begin
  Form7.Show;
  Form3.Hide;
end;


procedure TForm3.Label6Click(Sender: TObject);
begin
  Form3.Hide;
  Form7.Show;
end;

procedure TForm3.LbnCargosClick(Sender: TObject);
begin
  Form3.Hide;
  Form14.Show;
end;

procedure TForm3.LbnClientesClick(Sender: TObject);
begin
  Form4.Show;
  Form3.Hide;
end;

procedure TForm3.LbnFornecedoresClick(Sender: TObject);
begin
  Form3.Hide;
  Form7.Show;
end;

procedure TForm3.LbnHMClick(Sender: TObject);
begin
  Form3.Hide;
  Form17.Show;
end;

procedure TForm3.LbnPPClick(Sender: TObject);
begin
  Form3.Hide;
  Form16.Show;
end;

procedure TForm3.LbnProfissionaisClick(Sender: TObject);
begin
  Form8.Show;
  Form3.Hide;
end;

procedure TForm3.LbnServicosClick(Sender: TObject);
begin
  Form3.Hide;
  Form15.Show;
end;

end.
