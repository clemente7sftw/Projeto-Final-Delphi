unit CAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls;

type
  TForm21 = class(TForm)
    Fundo: TPanel;
    DBGrid1: TDBGrid;
    DataSource1: TDataSource;
    BtnAdd: TPanel;
    Image3: TImage;
    BtnConf: TPanel;
    BtnEditar: TPanel;
    BtnExcluir: TPanel;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    Label2: TLabel;
    DBEdit2: TDBEdit;
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizarStatus;
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

implementation

{$R *.dfm}

uses UDataModule, Agendamentos;

procedure TForm21.AtualizarStatus;
begin
  DataModule1.QueryUpAg.Close;
  DataModule1.QueryUpAg.SQL.Text :=
    'UPDATE agendamentos ' +
    'SET status = TRUE ' +
    'WHERE data_agendamento < CURRENT_DATE AND status = FALSE';
  DataModule1.QueryUpAg.ExecSQL;
end;

procedure TForm21.BtnAddClick(Sender: TObject);
begin
form13.show;
form21.close;
end;

procedure TForm21.BtnConfClick(Sender: TObject);
begin
btnconf.Visible:= false;
end;

procedure TForm21.BtnEditarClick(Sender: TObject);
begin
btnconf.Visible:= true;
end;



procedure TForm21.BtnExcluirClick(Sender: TObject);
begin
datamodule1.QueryAg.Delete;
end;

procedure TForm21.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;

procedure TForm21.FormShow(Sender: TObject);
begin
AtualizarStatus;
datamodule1.QueryAg.close;
datamodule1.QueryAg.open;
btnconf.Visible:= false;
end;

end.
