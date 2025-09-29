object DataModule1: TDataModule1
  Height = 614
  Width = 556
  PixelsPerInch = 120
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=banco_teste'
      'User_Name=postgres'
      'Password=2007'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 200
    Top = 20
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 'C:\Users\gabi\Downloads\lib\lib\libpq.dll'
    Left = 70
    Top = 20
  end
  object QueryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes')
    Left = 40
    Top = 110
    object QueryClientesid_clie: TIntegerField
      FieldName = 'id_clie'
      Origin = 'id_clie'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryClientesnome_clie: TWideStringField
      DisplayWidth = 13
      FieldName = 'nome_clie'
      Origin = 'nome_clie'
      Size = 150
    end
    object QueryClientesemail_clie: TWideStringField
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
    object QueryClientessenha_clie: TWideStringField
      FieldName = 'senha_clie'
      Origin = 'senha_clie'
      Size = 100
    end
    object QueryClientescpf_clie: TWideStringField
      FieldName = 'cpf_clie'
      Origin = 'cpf_clie'
      Size = 14
    end
    object QueryClientesgenero_clie: TWideStringField
      FieldName = 'genero_clie'
      Origin = 'genero_clie'
    end
    object QueryClientesfone_clie: TWideStringField
      FieldName = 'fone_clie'
      Origin = 'fone_clie'
      Size = 11
    end
    object QueryClientescep_clie: TWideStringField
      FieldName = 'cep_clie'
      Origin = 'cep_clie'
      Size = 8
    end
    object QueryClientesrua_clie: TWideStringField
      FieldName = 'rua_clie'
      Origin = 'rua_clie'
      Size = 100
    end
    object QueryClientesbairro_clie: TWideStringField
      FieldName = 'bairro_clie'
      Origin = 'bairro_clie'
      Size = 50
    end
    object QueryClientescidade_clie: TWideStringField
      FieldName = 'cidade_clie'
      Origin = 'cidade_clie'
      Size = 50
    end
    object QueryClientesestado_clie: TWideStringField
      FieldName = 'estado_clie'
      Origin = 'estado_clie'
      Size = 50
    end
  end
  object QueryReservas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from reservas'
      '')
    Left = 40
    Top = 210
    object QueryReservasid_reserva: TIntegerField
      FieldName = 'id_reserva'
      Origin = 'id_reserva'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryReservasid_clie: TIntegerField
      FieldName = 'id_clie'
      Origin = 'id_clie'
    end
    object QueryReservasid_servicos: TIntegerField
      FieldName = 'id_servicos'
      Origin = 'id_servicos'
    end
    object QueryReservasid_pro: TIntegerField
      FieldName = 'id_pro'
      Origin = 'id_pro'
    end
    object QueryReservasemail_clie: TWideStringField
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
    object QueryReservasdt_reserva: TDateField
      FieldName = 'dt_reserva'
      Origin = 'dt_reserva'
    end
    object QueryReservashr_reserva: TTimeField
      FieldName = 'hr_reserva'
      Origin = 'hr_reserva'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QueryProfissionais: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '   select * from profissionais'
      '   ')
    Left = 162
    Top = 110
    object QueryProfissionaisid_pro: TIntegerField
      FieldName = 'id_pro'
      Origin = 'id_pro'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryProfissionaisnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object QueryProfissionaisemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object QueryProfissionaiscpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      Size = 14
    end
    object QueryProfissionaiscep: TWideStringField
      FieldName = 'cep'
      Origin = 'cep'
      Size = 10
    end
    object QueryProfissionaisrua: TWideStringField
      FieldName = 'rua'
      Origin = 'rua'
      Size = 100
    end
    object QueryProfissionaisbairro: TWideStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 50
    end
    object QueryProfissionaiscidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 50
    end
    object QueryProfissionaisestado: TWideStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 50
    end
  end
  object QueryEmpresa: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from empresas')
    Left = 156
    Top = 202
  end
  object QueryServicos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from servicos '
      '')
    Left = 46
    Top = 298
    object QueryServicosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object QueryServicosduracao: TIntegerField
      FieldName = 'duracao'
      Origin = 'duracao'
    end
    object QueryServicospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 10
      Size = 2
    end
    object QueryServicosdata_cad: TSQLTimeStampField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      ProviderFlags = [pfInUpdate]
    end
    object QueryServicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Origin = 'id_servico'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object QueryCargos_Servicos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    cs.id_cargo,'
      '    c.nome_cargo,'
      '    cs.id_servico, '
      '    s. nome'
      'FROM cargos_servicos cs'
      'INNER JOIN cargos c ON c.id_cargo = cs.id_cargo'
      'INNER JOIN servicos s ON s.id_servico = cs.id_servico;'
      '')
    Left = 184
    Top = 296
    object QueryCargos_Servicosid_cargo: TIntegerField
      FieldName = 'id_cargo'
      Origin = 'id_cargo'
    end
    object QueryCargos_Servicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Origin = 'id_servico'
    end
    object QueryCargos_Servicosnome_cargo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_cargo'
      Origin = 'nome_cargo'
      Size = 100
    end
    object QueryCargos_Servicosnome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
  end
  object QueryCargos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cargos'
      '')
    Left = 328
    Top = 272
    object QueryCargosid_cargo: TIntegerField
      FieldName = 'id_cargo'
      Origin = 'id_cargo'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryCargosnome_cargo: TWideStringField
      FieldName = 'nome_cargo'
      Origin = 'nome_cargo'
      Size = 100
    end
  end
  object Queryfornecedores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from fornecedores')
    Left = 328
    Top = 112
    object Queryfornecedoresid: TIntegerField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Queryfornecedoresnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 150
    end
    object Queryfornecedoresemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object Queryfornecedoresdata_cad: TSQLTimeStampField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      ProviderFlags = [pfInUpdate]
    end
  end
end
