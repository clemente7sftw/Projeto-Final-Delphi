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
    procedure LbClieClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form20: TForm20;

implementation

{$R *.dfm}

uses CClientes, CProfissionais;

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

end.
