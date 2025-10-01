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
    QueryProfissionaisid_pro: TIntegerField;
    QueryProfissionaisnome: TWideStringField;
    QueryProfissionaisemail: TWideStringField;
    QueryProfissionaiscpf: TWideStringField;
    QueryProfissionaiscep: TWideStringField;
    QueryProfissionaisrua: TWideStringField;
    QueryProfissionaisbairro: TWideStringField;
    QueryProfissionaiscidade: TWideStringField;
    QueryProfissionaisestado: TWideStringField;
    QueryEmpresa: TFDQuery;
    QueryServicos: TFDQuery;
    QueryServicosnome: TWideStringField;
    QueryServicosduracao: TIntegerField;
    QueryServicospreco: TBCDField;
    QueryServicosdata_cad: TSQLTimeStampField;
    QueryServicosid_servico: TIntegerField;
    QueryCS: TFDQuery;
    QueryCargos: TFDQuery;
    Queryfornecedores: TFDQuery;
    Queryfornecedoresid: TIntegerField;
    Queryfornecedoresnome: TWideStringField;
    Queryfornecedoresemail: TWideStringField;
    Queryfornecedoresdata_cad: TSQLTimeStampField;
    QueryPC: TFDQuery;
    QueryRPC: TFDQuery;
    QueryPCid_pro: TIntegerField;
    QueryPCid_cargo: TIntegerField;
    QueryRCS: TFDQuery;
    QueryCargosid_cargo: TIntegerField;
    QueryCargosnome_cargo: TWideStringField;
    QueryCargosdata_cad: TSQLTimeStampField;
    QueryCSid_cargo: TIntegerField;
    QueryCSid_servico: TIntegerField;
    QueryRCSnome_cargo: TWideStringField;
    QueryRCSnome_servico: TWideStringField;
    QueryRPCnome: TWideStringField;
    QueryRPCemail: TWideStringField;
    QueryRPCnome_cargo: TWideStringField;
    QueryAg: TFDQuery;
    QueryAgid_agendamento: TIntegerField;
    QueryAgnome_clie: TWideStringField;
    QueryAgnome: TWideStringField;
    QueryAgdata_agendamento: TDateField;
    QueryAghora_inicio: TTimeField;
    QueryClientesnome_clie: TWideStringField;
    QueryClientesemail_clie: TWideStringField;
    FDQuery1: TFDQuery;
  private
    { Private declarations }
  public
    IdEmpresaAtual: Integer;
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
