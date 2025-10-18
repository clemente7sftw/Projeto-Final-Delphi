unit UDataModule;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet;

type
  TDataModule1 = class(TDataModule)
    FDConnection1: TFDConnection;
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
    QueryCS: TFDQuery;
    QueryCargos: TFDQuery;
    Queryfornecedores: TFDQuery;
    Queryfornecedoresid: TIntegerField;
    Queryfornecedoresnome: TWideStringField;
    Queryfornecedoresemail: TWideStringField;
    Queryfornecedoresdata_cad: TSQLTimeStampField;
    QueryPC: TFDQuery;
    QueryRPC: TFDQuery;
    QueryRCS: TFDQuery;
    QueryCargosid_cargo: TIntegerField;
    QueryCargosnome_cargo: TWideStringField;
    QueryCargosdata_cad: TSQLTimeStampField;
    QueryCSid_cargo: TIntegerField;
    QueryCSid_servico: TIntegerField;
    QueryAg: TFDQuery;
    QueryRCSnome_cargo: TWideStringField;
    QueryRCSnome: TWideStringField;
    QueryAgendamentos: TFDQuery;
    QueryServicosid_servico: TIntegerField;
    QueryServicosnome: TWideStringField;
    QueryServicosduracao: TIntegerField;
    QueryServicospreco: TBCDField;
    QueryServicosdata_cad: TSQLTimeStampField;
    QueryProfissionaisid_pro: TIntegerField;
    QueryProfissionaisnome: TWideStringField;
    QueryProfissionaisemail: TWideStringField;
    QueryProfissionaiscpf: TWideStringField;
    QueryProfissionaiscep: TWideStringField;
    QueryProfissionaisrua: TWideStringField;
    QueryProfissionaisbairro: TWideStringField;
    QueryProfissionaiscidade: TWideStringField;
    QueryProfissionaisestado: TWideStringField;
    QueryFClientes: TFDQuery;
    QueryFClientesmes: TFMTBCDField;
    QueryFClientestotal: TLargeintField;
    QueryUpAg: TFDQuery;
    QueryRAS: TFDQuery;
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
    QueryRPCnome: TWideStringField;
    QueryRPCemail: TWideStringField;
    QueryRPCnome_cargo: TWideStringField;
    QueryRASid_agendamento: TIntegerField;
    QueryRASid_servico: TIntegerField;
    QueryPCid_pro: TIntegerField;
    QueryPCid_cargo: TIntegerField;
    QueryPS: TFDQuery;
    QueryClientesid_empresa: TIntegerField;
    QueryClientesid_clie: TIntegerField;
    QueryClientesnome_clie: TWideStringField;
    QueryClientesemail_clie: TWideStringField;
    QueryClientessenha_clie: TWideStringField;
    QueryClientescpf_clie: TWideStringField;
    QueryClientesgenero_clie: TWideStringField;
    QueryClientesfone_clie: TWideStringField;
    QueryClientescep_clie: TWideStringField;
    QueryClientesrua_clie: TWideStringField;
    QueryClientesbairro_clie: TWideStringField;
    QueryClientescidade_clie: TWideStringField;
    QueryClientesestado_clie: TWideStringField;
    QueryClientesdata_cad: TSQLTimeStampField;
    QueryServicosid_empresa: TIntegerField;
    QueryCSid_empresa: TIntegerField;
    QueryCargosid_empresa: TIntegerField;
    procedure QueryAgstatusGetText(Sender: TField; var Text: string;
      DisplayText: Boolean);
  private
    { Private declarations }
  public
    var id_empresa:integer;
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

end.
