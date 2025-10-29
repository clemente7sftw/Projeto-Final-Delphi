unit n2_cclientes;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls, Vcl.StdCtrls, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.pngimage,
  Vcl.Skia;

type
  TForm29 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Lblrequired: TLabel;
    Label4: TLabel;
    EditBtn: TImage;
    ExclBtn: TImage;
    addclie: TImage;
    btncancelar: TImage;
    Image3: TImage;
    LbEmail: TLabel;
    DBGrid1: TDBGrid;
    BtnConf: TPanel;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    DBEdit2: TDBEdit;
    DBEdit1: TDBEdit;
    BtnCad: TPanel;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form29: TForm29;

implementation

{$R *.dfm}

uses UMetodos;

procedure TForm29.FormCreate(Sender: TObject);
begin
WindowState := wsMaximized;
end;

end.
