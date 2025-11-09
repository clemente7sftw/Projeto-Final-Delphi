unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Skia, Vcl.CheckLst, System.RegularExpressions,
  Vcl.WinXPickers;


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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure Cadastrar;
    procedure PreencherListbox;
    procedure BtnConfClick(Sender: TObject);
    function ValidarEmail(const Email: string):Boolean;
    procedure Trazer_Dias;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}
uses UMetodos, UDataModule;
var
  id_cargo, id_pro: Integer;

procedure TForm9.FormCreate(Sender: TObject);
begin
  Form9.WindowState:=wsMaximized;
  Lblrequired.Visible:= false;
  lbEmail.visible:= false;
  Trazer_Dias;

end;

procedure TForm9.FormShow(Sender: TObject);
begin
edit1.Text :='';
edit2.Text :='';
PreencherListbox;

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
      with DataModule1.query_conexao do
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
          with DataModule1.query_conexao do
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
      with DataModule1.query_conexao do
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
  end;

      Form9.Close;
      form8.show;
      Lblrequired.Visible := False;
      lbEmail.Visible := False;
    end
    else
    begin
      Lblrequired.Visible := False;
      lbEmail.Visible := True;
    end;
  end;


procedure TForm9.PCadClick(Sender: TObject);
begin
   Cadastrar;
end;


end.
