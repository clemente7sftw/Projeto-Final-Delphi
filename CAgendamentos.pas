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
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    calendario: TMonthCalendar;
    CLBServicos: TCheckListBox;
    ComboBoxHorarios: TComboBox;
    ExclBtn: TImage;
    EditBtn: TImage;
    btncancelar: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Image4: TImage;
    BS: TImage;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    Label3: TLabel;
    Label4: TLabel;
    addbtn: TImage;
    BtnConf: TPanel;
    procedure ListarHorarios;
    procedure BtnAddClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure AtualizarStatus;
    procedure Excluir;
    procedure Adicionar;
    procedure Editar;
    procedure Confirmar;
    procedure BtnExcluirClick(Sender: TObject);
    procedure BtnEditarClick(Sender: TObject);
    procedure BtnConfClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ExclBtnClick(Sender: TObject);
    procedure EditBtnClick(Sender: TObject);
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

procedure TForm21.Adicionar;
begin
form13.show;
form21.close;
end;

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
Confirmar;
end;

procedure TForm21.BtnExcluirClick(Sender: TObject);
begin
  datamodule1.QueryAg.Delete;
end;

procedure TForm21.Button1Click(Sender: TObject);
begin
  AtualizarStatus;
end;

procedure TForm21.Confirmar;
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

procedure TForm21.Editar;
begin
  btnconf.Visible := True;
  calendario.Visible := True;
  CLBServicos.Visible := True;
  dataselecionada := DataModule1.QueryAg.FieldByName('data_agendamento').AsDateTime;
  Calendario.Date := dataselecionada;
  ComboBoxHorarios.Visible:= true;
end;

procedure TForm21.EditBtnClick(Sender: TObject);
begin
Editar;
end;

procedure TForm21.ExclBtnClick(Sender: TObject);
begin
Excluir;
end;

procedure TForm21.Excluir;
begin
  if Application.MessageBox('Tem certeza de que deseja excluir este Agendamento? Essa ação não poderá ser desfeita.', 'Exclusão de Agendamento', MB_YESNO + MB_ICONQUESTION) = IDYES then
  begin
  datamodule1.QueryRAS.close;
  datamodule1.QueryRAS.open;
  datamodule1.QueryRAS.delete;
  datamodule1.QueryRAS.close;
  datamodule1.QueryRAS.open;
  datamodule1.Queryag.delete;
  sleep(100);
  datamodule1.queryag.close;
  datamodule1.Queryag.open;
  end
  else
  begin
   exit;
  end;
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
