unit n2_addprofissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.WinXPickers,
  Vcl.StdCtrls, Vcl.CheckLst, Vcl.Skia, Vcl.Imaging.pngimage, System.RegularExpressions;

type
  TForm33 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    Label3: TLabel;
    Label1: TLabel;
    Lblrequired: TLabel;
    Label2: TLabel;
    LbPro: TLabel;
    LbEmail: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    CLBCargos: TCheckListBox;
    BtnConf: TPanel;
    Edit1: TEdit;
    Edit2: TEdit;
    TimePicker2: TTimePicker;
    TimePicker1: TTimePicker;
    CLBdias_semana: TCheckListBox;
    Timer1: TTimer;
    Timer2: TTimer;
    BS: TImage;
    Image4: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    Lbagendamentos: TLabel;
    procedure FormShow(Sender: TObject);
    procedure PreencherListbox;
    procedure FormCreate(Sender: TObject);
    procedure Trazer_Dias;
    procedure Cadastrar;
    procedure erro;
    procedure erro_email;
    function ValidarEmail(const Email: string):Boolean;
    procedure BtnConfClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form33: TForm33;

implementation

{$R *.dfm}

uses UDataModule, n2_profissionais;

procedure TForm33.BtnConfClick(Sender: TObject);
begin
  Cadastrar;
end;

procedure TForm33.Cadastrar;
var
  i, j, id_empresa, id_pro, id_cargo: Integer;
  nome_senha: string;
begin

  if Trim(Edit1.Text) = '' then
  begin
    erro;
    Exit;
  end;

  if Trim(Edit2.Text) = '' then
  begin
    erro_email;
    Exit;
  end;

  if (CLBCargos.Items.Count = 0) or (CLBCargos.ItemIndex = -1) then
  begin
    erro;
    Exit;
  end;

  nome_senha := Trim(Edit1.Text);

  if Pos(' ', nome_senha) > 0 then
    nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);

  if not ValidarEmail(Edit2.Text) then
  begin

    erro_email;
    Exit;
  end;

  with DataModule1.queryprofissionais do
  begin
    Close;
    SQL.Text :=
      'INSERT INTO profissionais (nome, email, senha, id_empresa) ' +
      'VALUES (:nome, :email, :senha, :id_empresa)' +
      'RETURNING id_pro';
    ParamByName('nome').AsString := Edit1.Text;
    ParamByName('email').AsString := Edit2.Text;
    ParamByName('senha').AsString := nome_senha + '123';
    ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    Open;
    id_pro := FieldByName('id_pro').AsInteger;
  end;
  for i := 0 to CLBCargos.Count - 1 do
  begin
    if CLBCargos.Checked[i] then
    begin
      id_cargo := Integer(CLBCargos.Items.Objects[i]);
      with DataModule1.queryprofissionais do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO profissionais_cargos (id_pro, id_cargo) ' +
          'VALUES (:id_pro, :id_cargo)';
        ParamByName('id_pro').AsInteger := id_pro;
        ParamByName('id_cargo').AsInteger := id_cargo;
        ExecSQL;
      end;
    end;
  end;
  with DataModule1.queryprofissionais do
  begin
    for i := 0 to CLBdias_semana.Items.Count - 1 do
    begin
      if CLBdias_semana.Checked[i] then
      begin
        Close;
        SQL.Text :=
          'INSERT INTO horarios_profissionais ' +
          '(id_empresa, id_pro, dia_semana, hora_inicio, hora_fim) ' +
          'VALUES (:id_empresa, :id_pro, :dia_semana, :hora_inicio, :hora_fim)';
        ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
        ParamByName('id_pro').AsInteger := id_pro;
        ParamByName('dia_semana').AsInteger := i;
        ParamByName('hora_inicio').AsTime := TimePicker1.Time;
        ParamByName('hora_fim').AsTime := TimePicker2.Time;
        ExecSQL;
      end;
    end;
  end;
  form31.Show;
  form33.close;
end;


procedure TForm33.erro;
begin
Lblrequired.visible:= true;
Timer1.Enabled := true;
end;

procedure TForm33.erro_email;
begin
LbEmail.visible:= true;
Timer2.Enabled := true;
end;



procedure TForm33.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  Lblrequired.Visible:= false;
  lbEmail.visible:= false;
  Trazer_Dias;
  TimePicker1.Time := EncodeTime(12, 0, 0, 0);
  TimePicker2.Time := EncodeTime(12, 0, 0, 0);
end;

procedure TForm33.FormShow(Sender: TObject);
begin
edit1.Text :='';
edit2.Text :='';
PreencherListbox;
end;

procedure TForm33.PreencherListbox;
begin
  with datamodule1.query_conexao do
  begin
  close;
  sql.Text := 'SELECT * FROM cargos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome_cargo';
  DataModule1.query_conexao.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  open;
  CLBCargos.Items.Clear;
  if not IsEmpty then
    begin
     First;
     while not Eof do
      begin
      CLBCargos.Items.AddObject(
      FieldByName('nome_cargo').AsString,
      TObject(FieldByName('id_cargo').AsInteger)
      );
      Next;
      end;
    end;
  end;
end;
procedure TForm33.Timer1Timer(Sender: TObject);
begin
Lblrequired.Visible:= false;
Timer1.Enabled := false;
end;

procedure TForm33.Timer2Timer(Sender: TObject);
begin
LbEmail.Visible:= false;
Timer2.Enabled := false;
end;

procedure TForm33.Trazer_Dias;
begin
  CLBdias_semana.Items.Clear;
  CLBdias_semana.Items.Add('Domingo');
  CLBdias_semana.Items.Add('Segunda-feira');
  CLBdias_semana.Items.Add('Terça-feira');
  CLBdias_semana.Items.Add('Quarta-feira');
  CLBdias_semana.Items.Add('Quinta-feira');
  CLBdias_semana.Items.Add('Sexta-feira');
  CLBdias_semana.Items.Add('Sábado');
end;

function TForm33.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;

end.
