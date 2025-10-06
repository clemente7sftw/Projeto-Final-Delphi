object DataModule1: TDataModule1
  Height = 444
  Width = 993
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=beauty_stage'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 160
    Top = 16
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\Win32\De' +
      'bug\lib\libpq.dll'
    Left = 56
    Top = 16
  end
  object QueryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes')
    Left = 32
    Top = 88
    object QueryClientesnome_clie: TWideStringField
      FieldName = 'nome_clie'
      Origin = 'nome_clie'
      Size = 150
    end
    object QueryClientesemail_clie: TWideStringField
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
  end
  object QueryReservas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from reservas'
      '')
    Left = 32
    Top = 168
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
    Left = 130
    Top = 88
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
    Left = 125
    Top = 162
  end
  object QueryServicos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from servicos '
      '')
    Left = 29
    Top = 238
    object QueryServicosid_servico: TIntegerField
      FieldName = 'id_servico'
      Origin = 'id_servico'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
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
  end
  object QueryCS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT * from cargos_servicos')
    Left = 131
    Top = 237
    object QueryCSid_cargo: TIntegerField
      FieldName = 'id_cargo'
      Origin = 'id_cargo'
    end
    object QueryCSid_servico: TIntegerField
      FieldName = 'id_servico'
      Origin = 'id_servico'
    end
  end
  object QueryCargos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from cargos'
      '')
    Left = 486
    Top = 162
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
    object QueryCargosdata_cad: TSQLTimeStampField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      ProviderFlags = [pfInUpdate]
    end
  end
  object Queryfornecedores: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from fornecedores')
    Left = 390
    Top = 122
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
  object QueryPC: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from profissionais_cargos')
    Left = 32
    Top = 312
    object QueryPCid_pro: TIntegerField
      FieldName = 'id_pro'
      Origin = 'id_pro'
    end
    object QueryPCid_cargo: TIntegerField
      FieldName = 'id_cargo'
      Origin = 'id_cargo'
    end
  end
  object QueryRPC: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    p.nome,'
      '    p.email,'
      '    STRING_AGG(c.nome_cargo, '#39', '#39')::varchar(500) AS nome_cargo'
      'FROM '
      '    profissionais p'
      'LEFT JOIN '
      '    profissionais_cargos pc ON p.id_pro = pc.id_pro'
      'LEFT JOIN '
      '    cargos c ON pc.id_cargo = c.id_cargo'
      'GROUP BY '
      '    p.nome,'
      'p.email'
      'ORDER BY '
      '    p.nome;')
    Left = 120
    Top = 312
    object QueryRPCnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object QueryRPCemail: TWideStringField
      FieldName = 'email'
      Origin = 'email'
      Size = 100
    end
    object QueryRPCnome_cargo: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_cargo'
      Origin = 'nome_cargo'
      ReadOnly = True
      Size = 500
    end
  end
  object QueryRCS: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    c.nome_cargo,'
      '    STRING_AGG(s.nome, '#39', '#39')::varchar(500) AS nome'
      'FROM '
      '    cargos c'
      'LEFT JOIN '
      '    cargos_servicos cp ON c.id_cargo = cp.id_cargo'
      'LEFT JOIN '
      '    servicos s ON cp.id_servico = s.id_servico'
      'group by'
      'c.nome_cargo'
      'ORDER BY '
      '    c.nome_cargo;'
      '')
    Left = 200
    Top = 240
    object QueryRCSnome_cargo: TWideStringField
      FieldName = 'nome_cargo'
      Origin = 'nome_cargo'
      Size = 100
    end
    object QueryRCSnome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      ReadOnly = True
      Size = 500
    end
  end
  object QueryAg: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '    a.id_agendamento,'
      '    c.nome_clie,'
      '    s.nome,'
      '    a.data_agendamento,'
      '    a.hora_inicio'
      'FROM '
      '    agendamentos a'
      'INNER JOIN '
      '    clientes c ON a.id_clie = c.id_clie'
      'INNER JOIN'
      '    servicos s ON a.id_servico = s.id_servico;'
      '')
    Left = 888
    Top = 352
    object QueryAgid_agendamento: TIntegerField
      FieldName = 'id_agendamento'
      Origin = 'id_agendamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryAgnome_clie: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_clie'
      Origin = 'nome_clie'
      Size = 150
    end
    object QueryAgnome: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object QueryAgdata_agendamento: TDateField
      FieldName = 'data_agendamento'
      Origin = 'data_agendamento'
    end
    object QueryAghora_inicio: TTimeField
      FieldName = 'hora_inicio'
      Origin = 'hora_inicio'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QueryAgendamentos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from agendamentos')
    Left = 784
    Top = 360
  end
  object QueryFClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT '
      '  EXTRACT(MONTH FROM data_cad) AS mes,'
      '  COUNT(*) AS total'
      'FROM clientes'
      
        'WHERE data_cad >= date_trunc('#39'month'#39', CURRENT_DATE) - INTERVAL '#39 +
        '5 months'#39
      'GROUP BY EXTRACT(MONTH FROM data_cad)'
      'ORDER BY mes;'
      '')
    Left = 408
    Top = 280
  end
end
