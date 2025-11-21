unit TelaInicialN2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm5 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    Lbagendamentos: TLabel;
    Image2: TImage;
    Label2: TLabel;
    BS: TImage;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Image3: TImage;
    procedure Image2Click(Sender: TObject);
    procedure MudarSenha;
    procedure FormShow(Sender: TObject);
    procedure LbClieClick(Sender: TObject);
    procedure Panel1Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure LbProfissionaisClick(Sender: TObject);
    procedure LbagendamentosClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

implementation

{$R *.dfm}

uses CAdministrador, UDataModule, n2_cclientes, relatorio_clientes,
  relatorios_servicos, relatorios_profissionais, n2_profissionais,
  n2_cagendamentos;

procedure TForm5.FormShow(Sender: TObject);
begin
 WindowState := wsMaximized;
end;

procedure TForm5.Image2Click(Sender: TObject);
begin
MudarSenha;
end;

procedure TForm5.Image3Click(Sender: TObject);
begin
form5.close;
end;

procedure TForm5.LbagendamentosClick(Sender: TObject);
begin
Form32.show;
form5.close;
end;

procedure TForm5.LbClieClick(Sender: TObject);
begin
Form29.Show;
form5.close;
end;

procedure TForm5.LbProfissionaisClick(Sender: TObject);
begin
Form31.Show;
form5.close;
end;

procedure TForm5.MudarSenha;
begin
Form22.show;
end;

procedure TForm5.Panel1Click(Sender: TObject);
begin
  Form28 := TForm28.Create(Self);
  Form28.Id_empresa := DataModule1.id_empresa;
  Form28.RelatorioClientes.Preview();
end;

procedure TForm5.Panel2Click(Sender: TObject);
begin
Form25 := TForm25.Create(Self);
form25.Id_empresa := DataModule1.id_empresa;
Form25.RelatorioServicos.Preview();
end;

procedure TForm5.Panel3Click(Sender: TObject);
begin
Form27 := TForm27.Create(Self);
form27.Id_empresa := DataModule1.id_empresa;
Form27.RelatorioProfissionais.Preview();
end;

end.
