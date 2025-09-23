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
    FDQueryClientes: TFDQuery;
    FDQueryClientesid_clie: TIntegerField;
    FDQueryClientesnome_clie: TWideStringField;
    FDQueryClientesemail_clie: TWideStringField;
    FDQueryClientessenha_clie: TWideStringField;
    FDQueryClientescpf_clie: TWideStringField;
    FDQueryClientesgenero_clie: TWideStringField;
    FDQueryClientesfone_clie: TWideStringField;
    FDQueryClientescep_clie: TWideStringField;
    FDQueryClientesrua_clie: TWideStringField;
    FDQueryClientesbairro_clie: TWideStringField;
    FDQueryClientescidade_clie: TWideStringField;
    FDQueryClientesestado_clie: TWideStringField;
    FDQueryReservas: TFDQuery;
    FDQueryReservasid_reserva: TIntegerField;
    FDQueryReservasempresa_assi: TWideStringField;
    FDQueryReservasemail_assi: TWideStringField;
    FDQueryReservasdt_reserva: TDateField;
    FDQueryReservashr_reserva: TTimeField;
    FDQueryServicos: TFDQuery;
    FDQueryServicosid_servicos: TIntegerField;
    FDQueryServicosnome: TWideStringField;
    FDQueryServicosduracao: TIntegerField;
    FDQueryServicospreco: TBCDField;
    FDQueryServicosdata_cadastro: TSQLTimeStampField;
    FDQueryServicosfoto_url: TWideStringField;
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
