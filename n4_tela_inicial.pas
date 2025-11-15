unit n4_tela_inicial;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.Imaging.pngimage, Vcl.ExtCtrls;

type
  TForm30 = class(TForm)
    Fundo: TPanel;
    Image4: TImage;
    Image5: TImage;
    BS: TImage;
    Label1: TLabel;
    Image2: TImage;
    DBGrid1: TDBGrid;
    Barra: TPanel;
    LbProfissionais: TLabel;
    DataSource1: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure atualizarstatus;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form30: TForm30;

implementation

{$R *.dfm}

uses UDataModule;

procedure TForm30.atualizarstatus;
begin
  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'UPDATE agendamentos ' +
      'SET status = CASE ' +
      '               WHEN data_agendamento < NOW() THEN TRUE ' +
      '               ELSE FALSE ' +
      '             END ' +
      'WHERE status <> ( ' +
      '        CASE ' +
      '          WHEN data_agendamento < NOW() THEN TRUE ' +
      '          ELSE FALSE ' +
      '        END ' +
      '      )';
    ExecSQL;
  end;
end;


procedure TForm30.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
end;

procedure TForm30.FormShow(Sender: TObject);
begin
  atualizarstatus;

  with DataModule1.Query_conexao do
  begin
    Close;
    SQL.Text :=
      'SELECT a.id_agendamento, c.nome_clie AS cliente, ' +
      'CAST(STRING_AGG(s.nome, '', '') AS VARCHAR(500)) AS servicos, ' +
      'a.data_agendamento, a.hora_inicio, a.status ' +
      'FROM agendamentos a ' +
      'INNER JOIN clientes c ON a.id_clie = c.id_clie ' +
      'INNER JOIN agendamento_servicos ags ON a.id_agendamento = ags.id_agendamento ' +
      'INNER JOIN servicos s ON ags.id_servico = s.id_servico ' +
      'INNER JOIN profissionais_agendamentos pa ON pa.id_agendamento = a.id_agendamento ' +
      'INNER JOIN profissionais p ON pa.id_pro = p.id_pro ' +
      'WHERE p.id_pro = :id_pro ' +
      'GROUP BY a.id_agendamento, c.nome_clie, a.data_agendamento, a.hora_inicio, a.status ' +
      'ORDER BY a.data_agendamento DESC, a.hora_inicio;';

    ParamByName('id_pro').AsInteger := DataModule1.id_pro;
    Open;

    DataSource1.DataSet := DataModule1.Query_conexao;
    DBGrid1.DataSource := DataSource1;
  end;
end;


end.
