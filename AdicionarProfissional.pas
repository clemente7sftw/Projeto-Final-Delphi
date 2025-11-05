unit AdicionarProfissional;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, CProfissionais, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.DBCtrls, Vcl.Skia, Vcl.CheckLst, System.RegularExpressions;


type
  TForm9 = class(TForm)
    Fundo: TPanel;
    DataSource1: TDataSource;
    Image1: TImage;
    DataSource2: TDataSource;
    DataSource3: TDataSource;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
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
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure Cadastrar;
    procedure PreencherListbox;
    procedure BtnConfClick(Sender: TObject);
    function ValidarEmail(const Email: string):Boolean;

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
end;

procedure TForm9.FormShow(Sender: TObject);
begin

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
  i, id_empresa, id_pro, id_cargo: Integer;
  nome_senha:string;
begin
  nome_senha := Trim(dbEdit1.Text);

  if Pos(' ', nome_senha) > 0 then
    nome_senha := Copy(nome_senha, 1, Pos(' ', nome_senha) - 1);

  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and
     (CLBCargos.Items.Count > 0) and (CLBCargos.ItemIndex <> -1) then
  begin
    if ValidarEmail(DBEDIT2.Text) then
    begin
      with DataModule1.query_conexao do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO profissionais (nome, email, senha, id_empresa) ' +
          'VALUES (:nome, :email, :senha, :id_empresa)' +
          'RETURNING id_pro';
        ParamByName('nome').AsString := DBEdit1.Text;
        ParamByName('email').AsString := DBEdit2.Text;
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

      Form9.Close;
      Form8.Show;
      Lblrequired.Visible := False;
      lbEmail.Visible := False;
    end
    else
    begin
      Lblrequired.Visible := False;
      lbEmail.Visible := True;
    end;
  end
  else
  begin

    Lblrequired.Visible := True;
  end;
end;


procedure TForm9.PCadClick(Sender: TObject);
begin
   Cadastrar;
end;


end.
