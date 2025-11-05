unit AdicionarCargo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Vcl.Skia, Data.DB, Vcl.DBCtrls, Vcl.Mask, Vcl.CheckLst;

type
  TForm11 = class(TForm)
    Fundo: TPanel;
    Image1: TImage;
    DataSource1: TDataSource;
    DBEdit1: TDBEdit;
    DataSource2: TDataSource;
    CLBServicos: TCheckListBox;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    LbServicos: TLabel;
    LbCargos: TLabel;
    LbFornecedores: TLabel;
    Lbagendamentos: TLabel;
    BtnConf: TPanel;
    Lblrequired: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PreencherListbox;
    function CLBvazia(aCheckListBox: TCheckListBox): Boolean;
    procedure Cadastrar;
    procedure ErroInclusao;
    procedure BtnConfClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

implementation

{$R *.dfm}

uses UDataModule, CCargos;


procedure TForm11.BtnConfClick(Sender: TObject);
begin
Cadastrar;
end;

procedure TForm11.Cadastrar;
var
  id_ser, id_cargo, id_servico, id_empresa, i: Integer;
begin
if dbedit1.text = '' then
begin
  erroinclusao;
end else begin
  if CLBvazia(CLBServicos) then
  begin
   erroinclusao;
  end else begin
    with DataModule1.query_conexao do
    begin
      Close;
      SQL.Text :=
        'INSERT INTO cargos (nome_cargo, id_empresa) ' +
        'VALUES (:nome_cargo, :id_empresa)' +
        'RETURNING id_cargo';
      ParamByName('nome_cargo').AsString := DBEdit1.Text;
      ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
      Open;
      id_cargo := FieldByName('id_cargo').AsInteger;
    end;
    for i := 0 to CLBServicos.count -1 do
      begin
      if CLBServicos.Checked[i] then
        begin
        id_ser := Integer(CLBServicos.Items.Objects[i]);
        with DataModule1.query_conexao do
        begin
          close;
        SQL.Text :=
        'INSERT INTO cargos_servicos (id_cargo, id_servico,  id_empresa) ' +
        'VALUES (:id_cargo, :id_servico,  :id_empresa)';
        ParamByName('id_cargo').AsInteger := id_cargo;
        ParamByName('id_servico').AsInteger := id_ser;
        ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
        Execsql;
        end;
        end;
      end;

    Form14.Show;
    Form11.Close;
    end;
  end;

end;



function TForm11.CLBvazia(aCheckListBox: TCheckListBox): Boolean;
var
  i: Integer;
  Checked: Boolean;
begin
  Result := True;
  Checked := False;
  if aCheckListBox.Items.Count = 0 then
    Exit(True);
  for i := 0 to aCheckListBox.Items.Count - 1 do
  begin
    if aCheckListBox.Checked[i] then
    begin
      Checked := True;
      Break;
    end;
  end;
  Result := not Checked;
end;

procedure TForm11.ErroInclusao;
begin
  Lblrequired.Visible := True;
  Timer1.Enabled := True;
end;



procedure TForm11.FormCreate(Sender: TObject);
begin
Form11.WindowState:=wsMaximized;
Lblrequired.visible:= false;
end;

procedure TForm11.FormShow(Sender: TObject);
begin
    PreencherListbox;

end;

procedure TForm11.PreencherListbox;
begin
  with datamodule1.query_conexao do
  begin
  close;
  sql.Text := 'SELECT * FROM servicos ' +
  'WHERE id_empresa = :id_empresa ' +
  'ORDER BY nome';
  DataModule1.query_conexao.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
  open;
  CLBServicos.Items.Clear;
  if not IsEmpty then
    begin
     First;
     while not Eof do
      begin
      CLBServicos.Items.AddObject(
      FieldByName('nome').AsString,
      TObject(FieldByName('id_servico').AsInteger)
      );
      Next;
      end;
    end;
  end;
end;


procedure TForm11.Timer1Timer(Sender: TObject);
begin
lblrequired.visible := false;
Timer1.Enabled := False;
end;

end.
