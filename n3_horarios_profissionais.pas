unit n3_horarios_profissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.WinXPickers;

type
  TForm33 = class(TForm)
    TimePicker1: TTimePicker;
    TimePicker2: TTimePicker;
    CLBdias_semana: TCheckListBox;
    Panel1: TPanel;
    Panel2: TPanel;
    procedure FormCreate(Sender: TObject);
    procedure Cadastrar;
    procedure Panel2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    id_pro: integer;
  end;

var
  Form33: TForm33;

implementation

{$R *.dfm}

uses UDataModule, AdicionarProfissional;

procedure TForm33.Cadastrar;
var i: integer;
begin
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
Form9.Close;
Form33.close;
end;

procedure TForm33.FormCreate(Sender: TObject);
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

procedure TForm33.Panel2Click(Sender: TObject);
begin
Cadastrar;
end;

end.
