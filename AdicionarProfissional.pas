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
  datamodule1.QueryProfissionais.Close;
  datamodule1.QueryProfissionais.Open;
    datamodule1.QueryProfissionais.Append;
    datamodule1.QueryCargos.close;
    datamodule1.QueryCargos.open;
    datamodule1.QueryRPC.close;
    datamodule1.QueryRPC.open;
    PreencherListbox;
end;


procedure TForm9.PreencherListbox;
begin
if not datamodule1.QueryCargos.IsEmpty then
begin
  CLBCargos.Items.Clear;

  datamodule1.QueryCargos.First;
  while not datamodule1.QueryCargos.Eof do
  begin
    CLBCargos.Items.AddObject(
      datamodule1.QueryCargos.FieldByName('nome_cargo').AsString,
      TObject(datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger)
    );
    datamodule1.QueryCargos.Next;
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
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and
     (CLBCargos.Items.Count > 0) and (CLBCargos.ItemIndex <> -1) then
  begin
    if ValidarEmail(DBEDIT2.Text) then
    begin
      with DataModule1.query_conexao do
      begin
        Close;
        SQL.Text :=
          'INSERT INTO profissionais (nome, email, id_empresa) ' +
          'VALUES (:nome, :email, :id_empresa)';
        ParamByName('nome').AsString := DBEdit1.Text;
        ParamByName('email').AsString := DBEdit2.Text;
        ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
        ExecSQL;
        id_pro := FieldByName('id_pro').AsInteger;
      end;

      for i := 0 to CLBCargos.Count - 1 do
      begin
        if CLBCargos.Checked[i] then
        begin
          id_cargo := Integer(CLBCargos.Items.Objects[i]);
          with DataModule1.QueryPC do
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
