unit TelaInicialN3;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage, Vcl.CheckLst, system.JSON, uSuperChartLight,
  FireDAC.Moni.Base, FireDAC.Moni.Custom, FireDAC.Moni.FlatFile, RLReport,
  Data.DB, Vcl.WinXPickers, Vcl.Mask;

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
    FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
    BtnRelat: TPanel;
    RelatPeriodo: TMaskEdit;
    RelatPeriodo1: TMaskEdit;
    Label2: TLabel;
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
    procedure BtnRelatClick(Sender: TObject);
    procedure LbFornecedoresClick(Sender: TObject);
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
  CAgendamentos, CadAdm, relatorios_servicos;
procedure TForm20.AddAdm;
begin
Form23.show;
form20.close;
end;



procedure TForm20.BtnRelatClick(Sender: TObject);
begin
Form25 := TForm25.Create(Self);
Form25.RLPeriodo.Caption := RelatPeriodo.text + ' At� ' + RelatPeriodo1.text;
Form25.RLDBPeriodo1.Caption := RelatPeriodo.text + ' At� ' + RelatPeriodo1.text;
Form25.RelatorioServicos.Preview();
end;

procedure TForm20.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
RelatPeriodo.EditMask := '99/99/9999';
RelatPeriodo.Text := '';
RelatPeriodo1.EditMask := '99/99/9999';
RelatPeriodo1.Text := '';
DataModule1.QueryClientes.Close;
DataModule1.QueryClientes.Open;
DataModule1.QueryClientes.SQL.Text :=
'SELECT * FROM clientes ' +
'WHERE id_empresa = :id_empresa ' +
'ORDER BY nome_clie';
DataModule1.QueryClientes.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
end;

procedure TForm20.FormShow(Sender: TObject);
begin
//ShowMessage('ID da empresa logada: ' + IntToStr(DataModule1.id_empresa));
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
  Form20.close;
end;

procedure TForm20.LbClieClick(Sender: TObject);
begin
  Form4.Show;
  Form20.Close;
end;

procedure TForm20.LbFornecedoresClick(Sender: TObject);
begin
Form7.show;
Form20.close;
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
