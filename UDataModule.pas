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
    QueryServicos: TFDQuery;
    QueryServicosid_servicos: TIntegerField;
    QueryServicosnome: TWideStringField;
    QueryServicosduracao: TIntegerField;
    QueryServicospreco: TBCDField;
    QueryServicosdata_cadastro: TSQLTimeStampField;
    QueryServicosfoto_url: TWideStringField;
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
    QueryProfissionaisid_servicos: TIntegerField;
    QueryEmpresa: TFDQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DataModule1: TDataModule1;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
