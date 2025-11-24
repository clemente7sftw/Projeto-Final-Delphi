unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, Datasnap.DBClient;

type
  TDataModule1 = class(TDataModule)
    conexao_banco: TFDConnection;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    QueryClientes: TFDQuery;
    QueryReservas: TFDQuery;
    QueryReservasid_reserva: TIntegerField;
    QueryReservasid_clie: TIntegerField;
    QueryReservasid_servicos: TIntegerField;
    QueryReservasid_pro: TIntegerField;
    QueryReservasemail_clie: TWideStringField;
    QueryReservasdt_reserva: TDateField;
    QueryReservashr_reserva: TTimeField;
    QueryProfissionais: TFDQuery;
    QueryEmpresa: TFDQuery;
    QueryServicos: TFDQuery;
    QueryCargos: TFDQuery;
    Queryfornecedores: TFDQuery;
    Queryfornecedoresid: TIntegerField;
    Queryfornecedoresnome: TWideStringField;
    Queryfornecedoresemail: TWideStringField;
    Queryfornecedoresdata_cad: TSQLTimeStampField;
    QueryAg: TFDQuery;
    QueryAgendamentos: TFDQuery;
    QueryUpAg: TFDQuery;
    QueryAgid_agendamento: TIntegerField;
    QueryAgnome_clie: TWideStringField;
    QueryAgemail_clie: TWideStringField;
    QueryAgnome_servicos: TWideStringField;
    QueryAgdata_agendamento: TDateField;
    QueryAghora_inicio: TTimeField;
    QueryAgstatus: TBooleanField;
    QueryAgendamentosid_agendamento: TIntegerField;
    QueryAgendamentosid_clie: TIntegerField;
    QueryAgendamentosdata_agendamento: TDateField;
    QueryAgendamentoshora_inicio: TTimeField;
    QueryAgendamentospreco: TBCDField;
    QueryAgendamentosstatus: TBooleanField;
    QueryAdm: TFDQuery;
    QueryAdmid_adm: TIntegerField;
    QueryAdmid_empresa: TIntegerField;
    QueryAdmemail_adm: TWideStringField;
    QueryAdmsenha_adm: TWideStringField;
    QueryAdmfone_adm: TWideStringField;
    QueryAdmcpf_adm: TWideStringField;
    QueryAdmcep_adm: TWideStringField;
    QueryAdmrua_adm: TWideStringField;
    QueryAdmbairro_adm: TWideStringField;
    QueryAdmcidade_adm: TWideStringField;
    QueryAdmestado_adm: TWideStringField;
    QueryTotalAg: TFDQuery;
    QueryTotalAgnome: TWideStringField;
    QueryTotalAgtotal: TLargeintField;
    QueryAgendamentosid_empresa: TIntegerField;
    query_conexao: TFDQuery;
    QueryAdmnome_adm: TWideStringField;
    QueryAdmgenero_adm: TWideStringField;
    QueryAdmdata_cad: TSQLTimeStampField;
    query_aux: TFDQuery;
    QueryHorarios: TFDQuery;
    Queryag_pro: TFDQuery;
    Queryag_proid_agendamento: TIntegerField;
    Queryag_pronome_clie: TWideStringField;
    Queryag_proemail_clie: TWideStringField;
    Queryag_pronome_servicos: TWideStringField;
    Queryag_prodata_agendamento: TDateField;
    Queryag_prohora_inicio: TTimeField;
    Queryag_prostatus: TBooleanField;
    QueryServicosAux: TFDQuery;
    Query_editar_ag: TFDQuery;
    procedure QueryAgstatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
    procedure Queryag_prostatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    var id_empresa, id_clie, id_agendamento, id_adm, id_pro :integer;

    { Public declarations }
  end;

var
  DataModule1: TDataModule1;


implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}





procedure TDataModule1.QueryAgstatusGetText(Sender: TField; var Text: string;
  DisplayText: Boolean);
begin
begin
  if Sender.AsBoolean then
    Text := 'Concluído'
  else
    Text := 'Pendente';
end;
end;

procedure TDataModule1.Queryag_prostatusGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
begin
  if Sender.AsBoolean then
    Text := 'Concluído'
  else
    Text := 'Pendente';
end;
end;

end.
