unit AdicionarCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls;

type
  TForm11 = class(TForm)
    Fundo: TPanel;
    LbCEP: TLabel;
    LbNome: TLabel;
    Image1: TImage;
    Barra: TPanel;
    LogoBS: TImage;
    LbBS: TLabel;
    Image3: TImage;
    LbClientes: TLabel;
    LbHorarios: TLabel;
    LbMarketing: TLabel;
    LbFornecedores: TLabel;
    LbDashboard: TLabel;
    EdCEP: TEdit;
    EdNome: TEdit;
    PbtnCadastrar: TPanel;
    PbtnVoltar: TPanel;
    PbtnAdd: TPanel;
    Image2: TImage;
    Label1: TLabel;
    ListBox1: TListBox;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

end.
