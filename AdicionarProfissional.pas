unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Skia, Vcl.CheckLst, System.RegularExpressions,
  Vcl.WinXPickers, Vcl.Grids, Vcl.DBGrids;


type
  TForm9 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    CLBCargos: TCheckListBox;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    Label3: TLabel;
    Label1: TLabel;
    Lblrequired: TLabel;
    BtnConf: TPanel;
    Label2: TLabel;
    LbPro: TLabel;
    LbEmail: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    TimePicker2: TTimePicker;
    TimePicker1: TTimePicker;
    Label4: TLabel;
    Label5: TLabel;
    CLBdias_semana: TCheckListBox;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    MaskEdit1: TMaskEdit;
    MaskEdit2: TMaskEdit;
    MaskEdit3: TMaskEdit;
    MaskEdit4: TMaskEdit;
    MaskEdit5: TMaskEdit;
    MaskEdit6: TMaskEdit;
    MaskEdit7: TMaskEdit;
    MaskEdit8: TMaskEdit;
    MaskEdit9: TMaskEdit;
    MaskEdit10: TMaskEdit;
    MaskEdit11: TMaskEdit;
    MaskEdit12: TMaskEdit;
    MaskEdit13: TMaskEdit;
    MaskEdit14: TMaskEdit;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    CheckBox7: TCheckBox;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    Label17: TLabel;
    Timer1: TTimer;
    Label18: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure Cadastrar;
    procedure PreencherListbox;
    procedure BtnConfClick(Sender: TObject);
    function ValidarEmail(const Email: string):Boolean;
    procedure Trazer_Dias;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Label6Click(Sender: TObject);
    procedure criar_horarios;
    procedure validar_horario(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses UMetodos, UDataModule, n3_horarios_profissionais;
var
  id_cargo, id_pro: Integer;

procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action:= cafree;
form9:= nil;
end;

procedure TForm9.FormCreate(Sender: TObject);
begin
  Form9.WindowState:=wsMaximized;
  Lblrequired.Visible:= false;
  lbEmail.visible:= false;
  Trazer_Dias;
  TimePicker1.Time := EncodeTime(12, 0, 0, 0);
  TimePicker2.Time := EncodeTime(12, 0, 0, 0);

end;

procedure TForm9.FormShow(Sender: TObject);
begin
edit1.Text :='';
edit2.Text :='';
PreencherListbox;
criar_horarios;

end;


procedure TForm9.Label6Click(Sender: TObject);
begin
Form33.Show;
end;

procedure TForm9.PreencherListbox;
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


procedure TForm9.Trazer_Dias;
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

function TForm9.ValidarEmail(const Email: string): Boolean;
begin
 Result := TRegEx.IsMatch(Email,'^[\w\.\-]+@([\w\-]+\.)+[a-zA-Z]{2,4}$');
end;




procedure TForm9.validar_horario(Sender: TObject);
var
  HoraStr: string;
  Hora, Minuto: Integer;
begin
  HoraStr := Trim((Sender as TMaskEdit).Text);
  if (HoraStr = '') or (Pos('_', HoraStr) > 0) then
    Exit;

  Hora := StrToIntDef(Copy(HoraStr, 1, 2), -1);
  Minuto := StrToIntDef(Copy(HoraStr, 4, 2), -1);

  if (Hora < 0) or (Hora > 23) or (Minuto < 0) or (Minuto > 59) then
  begin
    ShowMessage('Horário inválido! Use um valor entre 00:00 e 23:59.');
    (Sender as TMaskEdit).SetFocus;
    (Sender as TMaskEdit).Text := '';
  end;
end;

procedure TForm9.BtnConfClick(Sender: TObject);
begin
  Cadastrar;
end;

procedure TForm9.Cadastrar;
var
  i, j, id_empresa, id_pro, id_cargo: Integer;
  nome_senha:string;
begin
  nome_senha := Trim(Edit1.Text);

  if Pos(' ', nome_senha) > 0 then
    nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);

  if (Edit1.Text <> '') and (Edit2.Text <> '') and
     (CLBCargos.Items.Count > 0) and (CLBCargos.ItemIndex <> -1) then
  begin
    if ValidarEmail(EDIT2.Text) then
    begin
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
            Execsql;
          end;
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

      Lblrequired.Visible := False;
      lbEmail.Visible := False;
    end
    else
    begin
      Lblrequired.Visible := False;
      lbEmail.Visible := True;
    end;
  end;


procedure TForm9.criar_horarios;
begin
maskedit1.EditMask := '!90:00;1;_';
maskedit2.EditMask := '!90:00;1;_';
maskedit3.EditMask := '!90:00;1;_';
maskedit4.EditMask := '!90:00;1;_';
maskedit5.EditMask := '!90:00;1;_';
maskedit6.EditMask := '!90:00;1;_';
maskedit7.EditMask := '!90:00;1;_';
maskedit8.EditMask := '!90:00;1;_';
maskedit9.EditMask := '!90:00;1;_';
maskedit10.EditMask := '!90:00;1;_';
maskedit11.EditMask := '!90:00;1;_';
maskedit12.EditMask := '!90:00;1;_';
maskedit13.EditMask := '!90:00;1;_';
maskedit14.EditMask := '!90:00;1;_';

maskedit1.OnExit := validar_horario;
maskedit2.OnExit := validar_horario;
maskedit3.OnExit := validar_horario;
maskedit4.OnExit := validar_horario;
maskedit5.OnExit := validar_horario;
maskedit6.OnExit := validar_horario;
maskedit7.OnExit := validar_horario;
maskedit8.OnExit := validar_horario;
maskedit9.OnExit := validar_horario;
maskedit10.OnExit := validar_horario;
maskedit11.OnExit := validar_horario;
maskedit12.OnExit := validar_horario;
maskedit13.OnExit := validar_horario;
maskedit14.OnExit := validar_horario;
end;

procedure TForm9.PCadClick(Sender: TObject);
begin
   Cadastrar;
end;


end.
