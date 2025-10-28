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
  id_ser, id_cargo, id_empresa, i: Integer;
begin
  if dbedit1.text = '' then
  begin
    erroinclusao;
  end else begin
    if CLBvazia(CLBServicos) then
    begin
     erroinclusao;
    end else begin
    if datamodule1.QueryCargos.state in [dsinsert, dsedit] then
      begin
      id_empresa:= DataModule1.id_empresa;
      DataModule1.QueryCargos.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;
      datamodule1.querycargos.post;
      datamodule1.querycargos.Refresh;
      id_cargo := datamodule1.QueryCargos.FieldByName('id_cargo').AsInteger;
      for i := 0 to CLBServicos.count -1 do
        begin
        if CLBServicos.Checked[i] then
          begin
          id_ser := Integer(CLBServicos.Items.Objects[i]);
          if datamodule1.QueryCargos.State in [dsInsert, dsEdit] then
          id_ser := Integer(CLBServicos.Items.Objects[i]);
          datamodule1.QueryCS.Append;
          datamodule1.QueryCS.FieldByName('id_servico').AsInteger := id_ser;
          datamodule1.QueryCS.FieldByName('id_cargo').AsInteger := id_cargo;
          DataModule1.QueryCs.FieldByName('id_empresa').AsInteger := DataModule1.id_empresa;
          datamodule1.QueryCS.Post;
          end;
        end;
      DataModule1.QueryCargos.Close;
      DataModule1.QueryCargos.Open;
      Form14.Show;
      Form11.Close;
      end;
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
    DataModule1.QueryCargos.Close;
    DataModule1.QueryCargos.Open;
    datamodule1.QueryCargos.Append;
    datamodule1.QueryServicos.close;
    datamodule1.QueryServicos.open;
    datamodule1.QueryCS.close;
    DataModule1.QueryCS.SQL.Text :=
    'SELECT * FROM cargos_servicos ' +
    'WHERE id_empresa = :id_empresa ' +
    'ORDER BY id_cargo;';
    DataModule1.QueryCS.ParamByName('id_empresa').AsInteger := DataModule1.id_empresa;
    datamodule1.QueryCS.open;
    PreencherListbox;

end;

procedure TForm11.PreencherListbox;
begin
if not datamodule1.QueryServicos.IsEmpty then
begin
  CLBServicos.Items.Clear;

  datamodule1.QueryServicos.First;
  while not datamodule1.QueryServicos.Eof do
  begin
    CLBServicos.Items.AddObject(
      datamodule1.QueryServicos.FieldByName('nome').AsString,
      TObject(datamodule1.QueryServicos.FieldByName('id_servico').AsInteger)
    );
    datamodule1.QueryServicos.Next;
  end;
end;
end;

procedure TForm11.Timer1Timer(Sender: TObject);
begin
lblrequired.visible := false;
Timer1.Enabled := False;
end;

end.
