unit CAgendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Imaging.pngimage, Vcl.StdCtrls, Vcl.Mask, Vcl.DBCtrls,
  Vcl.CheckLst, Vcl.ComCtrls;

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
    calendario: TMonthCalendar;
    CLBServicos: TCheckListBox;
    ComboBoxHorarios: TComboBox;
    procedure ListarHorarios;
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizarStatus;
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form21: TForm21;

var  dataselecionada: TDatetime;
var  i, ServicoSelecionado, id_agendamento, id_servico:integer;

implementation

{$R *.dfm}

uses UDataModule, Agendamentos;

procedure TForm21.AtualizarStatus;
begin
  DataModule1.QueryUpAg.Close;
  DataModule1.QueryUpAg.SQL.Text :=
    'UPDATE agendamentos ' +
    'SET status = TRUE ' +
    'WHERE data_agendamento < NOW() AND status = FALSE';
  DataModule1.QueryUpAg.ExecSQL;
  DataModule1.QueryUpAg.Close;
  DataModule1.QueryUpAg.SQL.Text :=
    'UPDATE agendamentos ' +
    'SET status = FALSE ' +
    'WHERE data_agendamento >= NOW() AND status = TRUE';
  DataModule1.QueryUpAg.ExecSQL;
  DataModule1.QueryAg.Close;
  DataModule1.QueryAg.Open;
  DataModule1.QueryAgendamentos.Close;
  DataModule1.QueryAgendamentos.Open;
end;

procedure TForm21.BtnAddClick(Sender: TObject);
begin
form13.show;
form21.close;
end;

procedure TForm21.BtnEditarClick(Sender: TObject);
begin
  btnconf.Visible := True;
  calendario.Visible := True;
  CLBServicos.Visible := True;
  dataselecionada := DataModule1.QueryAg.FieldByName('data_agendamento').AsDateTime;
  Calendario.Date := dataselecionada;
  ComboBoxHorarios.Visible:= true;
end;

procedure TForm21.BtnConfClick(Sender: TObject);
begin
  btnconf.Visible := False;
  if not DataModule1.QueryAg.IsEmpty then
  begin
    DataModule1.QueryAg.Edit;
    DataModule1.QueryAg.FieldByName('data_agendamento').AsDateTime := calendario.Date;
    DataModule1.QueryAg.FieldByName('hora_inicio').AsDateTime := StrToTime(ComboBoxHorarios.Text);
    btnconf.Visible := false;
    calendario.Visible := false;
    CLBServicos.Visible := false;
    ComboBoxHorarios.Visible:= false;
    DataModule1.QueryAg.Post;
    AtualizarStatus;
  end;
end;

procedure TForm21.BtnExcluirClick(Sender: TObject);
begin
  datamodule1.QueryAg.Delete;
end;

procedure TForm21.Button1Click(Sender: TObject);
begin
  AtualizarStatus;
end;

procedure TForm21.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  calendario.Visible:= false;
  CLBServicos.Visible:= false;
end;

procedure TForm21.FormShow(Sender: TObject);
begin
  AtualizarStatus;
  datamodule1.QueryAg.close;
  datamodule1.QueryAg.open;
  datamodule1.QueryAgendamentos.close;
  datamodule1.QueryAgendamentos.open;
  datamodule1.QueryRAS.close;
  datamodule1.QueryRAS.open;
  btnconf.Visible:= false;
  ComboBoxHorarios.Visible:= false;
  ListarHorarios;
end;

procedure TForm21.ListarHorarios;
begin
var
  i: Integer;
begin
  ComboBoxHorarios.Items.Clear;
  for i := 8 to 17 do
    ComboBoxHorarios.Items.Add(Format('%.2d:00', [i]));
    ComboBoxHorarios.ItemIndex := 0;
end;
end;

end.
