unit TelaInicialN3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.CheckLst, system.JSON, uSuperChartLight;

type
  TForm20 = class(TForm)
    Label1: TLabel;
    Fundo: TPanel;
    Image1: TImage;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Panel1: TPanel;
    Image2: TImage;
    procedure LbClieClick(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbServicosClick(Sender: TObject);
    procedure LbCargosClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Label3Click(Sender: TObject);
    procedure Label2Click(Sender: TObject);
    procedure Label4Click(Sender: TObject);
    procedure LbagendamentosClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure AddAdm;
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  Form20: TForm20;


implementation

{$R *.dfm}

uses CClientes, CProfissionais, AdicionarServico, CServicos,
  CCargos, CFornecedores, Cadastro, CHorarios, Agendamentos, UDataModule,
  CAgendamentos, CadAdm;
procedure TForm20.AddAdm;
begin
Form23.show;
form20.close;
end;

procedure TForm20.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;

end;

procedure TForm20.FormShow(Sender: TObject);
begin
ShowMessage('ID da empresa logada: ' + IntToStr(DataModule1.id_empresa));

end;

procedure TForm20.Image2Click(Sender: TObject);
begin
AddAdm;
end;

procedure TForm20.Label2Click(Sender: TObject);
begin
Form7.Show;
form20.close;
end;

procedure TForm20.Label3Click(Sender: TObject);
begin
Form13.show;
end;

procedure TForm20.Label4Click(Sender: TObject);
begin
 form21.Show;
 form20.close;
end;

procedure TForm20.LbagendamentosClick(Sender: TObject);
begin
  Form21.Show;
  Form2.Close;
end;

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
