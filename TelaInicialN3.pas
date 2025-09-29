unit TelaInicialN3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TForm20 = class(TForm)
    Label1: TLabel;
    Panel1: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    Label2: TLabel;
    procedure LbClieClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

uses CClientes, CProfissionais, AdicionarServico, CServicos, AdicionarCliente,
  CCargos, CFornecedores, Cadastro;

procedure TForm20.LbCargosClick(Sender: TObject);
begin
Form14.show;
end;

procedure TForm20.LbClieClick(Sender: TObject);
begin
  Form4.Show;
  Form20.Close;
end;

procedure TForm20.LbProfissionaisClick(Sender: TObject);
begin
  Form8.Show;
  Form20.Close;
end;

procedure TForm20.LbServicosClick(Sender: TObject);
begin
  Form15.show;
end;

end.
