object DataModule1: TDataModule1
  Height = 575
  Width = 403
  object conexao_banco: TFDConnection
    Params.Strings = (
      'Database=beauty_stage'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
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
    Connection = conexao_banco
    SQL.Strings = (
      'select * from clientes')
    Left = 272
    Top = 16
    object QueryClientesid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
    object QueryClientesid_clie: TIntegerField
      FieldName = 'id_clie'
      Origin = 'id_clie'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
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
    end
    object QueryClientescep_clie: TWideStringField
      FieldName = 'cep_clie'
      Origin = 'cep_clie'
      Size = 9
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
    object QueryClientesdata_cad: TSQLTimeStampField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QueryReservas: TFDQuery
    Connection = conexao_banco
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
    Connection = conexao_banco
    SQL.Strings = (
      'select * from profissionais')
    Left = 210
    Top = 104
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
    object QueryProfissionaisid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
  end
  object QueryEmpresa: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from empresas')
    Left = 125
    Top = 162
  end
  object QueryServicos: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from servicos '
      '')
    Left = 29
    Top = 238
  end
  object QueryCS: TFDQuery
    Connection = conexao_banco
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
    object QueryCSid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
  end
  object QueryCargos: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from cargos'
      '')
    Left = 278
    Top = 242
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
    object QueryCargosid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
  end
  object Queryfornecedores: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from fornecedores')
    Left = 254
    Top = 170
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
    Connection = conexao_banco
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
    Connection = conexao_banco
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
  end
  object QueryRCS: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      
        'SELECT c.nome_cargo, STRING_AGG(s.nome, '#39', '#39')::varchar(500) AS n' +
        'ome FROM cargos c LEFT JOIN cargos_servicos cp ON c.id_cargo = c' +
        'p.id_cargo LEFT JOIN servicos s ON cp.id_servico = s.id_servico ' +
        'group by c.nome_cargo ORDER BY c.nome_cargo;')
    Left = 200
    Top = 240
  end
  object QueryAg: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'SELECT '
      ''
      '    a.id_agendamento,'
      '    c.nome_clie,'
      '    c.email_clie,'
      '    STRING_AGG(s.nome, '#39', '#39')::varchar(500) AS nome_servicos,'
      '    a.data_agendamento,'
      '    a.hora_inicio,'
      '    a.status'
      'FROM '
      '    agendamentos a'
      'INNER JOIN '
      '    clientes c ON a.id_clie = c.id_clie'
      'INNER JOIN'
      
        '    agendamento_servicos ags ON a.id_agendamento = ags.id_agenda' +
        'mento'
      'INNER JOIN'
      '    servicos s ON ags.id_servico = s.id_servico'
      'GROUP BY'
      '    a.id_agendamento,'
      '    c.nome_clie,'
      '    c.email_clie,'
      '    a.data_agendamento,'
      '    a.hora_inicio,'
      '    a.status'
      'ORDER BY'
      '    a.id_agendamento;'
      '')
    Left = 192
    Top = 392
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
    object QueryAgemail_clie: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
    object QueryAgnome_servicos: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_servicos'
      Origin = 'nome_servicos'
      ReadOnly = True
      Size = 500
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
    object QueryAgstatus: TBooleanField
      FieldName = 'status'
      Origin = 'status'
      OnGetText = QueryAgstatusGetText
    end
  end
  object QueryAgendamentos: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from agendamentos')
    Left = 310
    Top = 334
    object QueryAgendamentosid_agendamento: TIntegerField
      FieldName = 'id_agendamento'
      Origin = 'id_agendamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryAgendamentosid_clie: TIntegerField
      FieldName = 'id_clie'
      Origin = 'id_clie'
    end
    object QueryAgendamentosdata_agendamento: TDateField
      FieldName = 'data_agendamento'
      Origin = 'data_agendamento'
    end
    object QueryAgendamentoshora_inicio: TTimeField
      FieldName = 'hora_inicio'
      Origin = 'hora_inicio'
      ProviderFlags = [pfInUpdate]
    end
    object QueryAgendamentospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 10
      Size = 2
    end
    object QueryAgendamentosstatus: TBooleanField
      FieldName = 'status'
      Origin = 'status'
    end
    object QueryAgendamentosid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
  end
  object QueryFClientes: TFDQuery
    Connection = conexao_banco
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
    Left = 120
    Top = 480
    object QueryFClientesmes: TFMTBCDField
      AutoGenerateValue = arDefault
      FieldName = 'mes'
      Origin = 'mes'
      ReadOnly = True
      Precision = 64
      Size = 64
    end
    object QueryFClientestotal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
    end
  end
  object QueryUpAg: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      '')
    Left = 120
    Top = 392
  end
  object QueryRAS: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from agendamento_servicos')
    Left = 256
    Top = 400
    object QueryRASid_agendamento: TIntegerField
      FieldName = 'id_agendamento'
      Origin = 'id_agendamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object QueryRASid_servico: TIntegerField
      FieldName = 'id_servico'
      Origin = 'id_servico'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
  end
  object QueryPS: TFDQuery
    Connection = conexao_banco
    Left = 216
    Top = 320
  end
  object QueryAdm: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from administradores')
    Left = 24
    Top = 472
    object QueryAdmid_adm: TIntegerField
      FieldName = 'id_adm'
      Origin = 'id_adm'
    end
    object QueryAdmid_empresa: TIntegerField
      FieldName = 'id_empresa'
      Origin = 'id_empresa'
    end
    object QueryAdmemail_adm: TWideStringField
      FieldName = 'email_adm'
      Origin = 'email_adm'
      Size = 100
    end
    object QueryAdmsenha_adm: TWideStringField
      FieldName = 'senha_adm'
      Origin = 'senha_adm'
      Size = 100
    end
    object QueryAdmfone_adm: TWideStringField
      FieldName = 'fone_adm'
      Origin = 'fone_adm'
    end
    object QueryAdmcpf_adm: TWideStringField
      FieldName = 'cpf_adm'
      Origin = 'cpf_adm'
      Size = 14
    end
    object QueryAdmcep_adm: TWideStringField
      FieldName = 'cep_adm'
      Origin = 'cep_adm'
      Size = 10
    end
    object QueryAdmrua_adm: TWideStringField
      FieldName = 'rua_adm'
      Origin = 'rua_adm'
      Size = 100
    end
    object QueryAdmbairro_adm: TWideStringField
      FieldName = 'bairro_adm'
      Origin = 'bairro_adm'
      Size = 50
    end
    object QueryAdmcidade_adm: TWideStringField
      FieldName = 'cidade_adm'
      Origin = 'cidade_adm'
      Size = 50
    end
    object QueryAdmestado_adm: TWideStringField
      FieldName = 'estado_adm'
      Origin = 'estado_adm'
      Size = 50
    end
    object QueryAdmnome_adm: TWideStringField
      FieldName = 'nome_adm'
      Origin = 'nome_adm'
      Size = 100
    end
    object QueryAdmgenero_adm: TWideStringField
      FieldName = 'genero_adm'
      Origin = 'genero_adm'
    end
    object QueryAdmdata_cad: TSQLTimeStampField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QueryTotalAg: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'SELECT'
      '    S.nome, '
      '    COUNT(ASV.id_servico) AS Total'
      'FROM'
      '    servicos S'
      'INNER JOIN'
      '    agendamento_servicos ASV ON S.id_servico = ASV.id_servico '
      ''
      'GROUP BY'
      '    S.nome '
      'ORDER BY'
      '    Total  DESC; ')
    Left = 27
    Top = 395
    object QueryTotalAgnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 50
    end
    object QueryTotalAgtotal: TLargeintField
      AutoGenerateValue = arDefault
      FieldName = 'total'
      Origin = 'total'
      ReadOnly = True
    end
  end
  object query_conexao: TFDQuery
    Connection = conexao_banco
    Left = 32
    Top = 88
  end
  object query_aux: TFDQuery
    Connection = conexao_banco
    Left = 112
    Top = 88
  end
end
