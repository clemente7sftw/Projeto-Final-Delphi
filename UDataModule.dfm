object DataModule1: TDataModule1
  Height = 547
  Width = 553
  object conexao_banco: TFDConnection
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
    Connection = conexao_banco
    SQL.Strings = (
      'select * from clientes')
    Left = 272
    Top = 16
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
    Left = 357
    Top = 54
  end
  object QueryCS: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'SELECT * from cargos_servicos')
    Left = 107
    Top = 389
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
    Left = 30
    Top = 226
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
    Left = 48
    Top = 427
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
    Left = 104
    Top = 432
  end
  object QueryRCS: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      
        'SELECT c.nome_cargo, STRING_AGG(s.nome, '#39', '#39')::varchar(500) AS n' +
        'ome FROM cargos c LEFT JOIN cargos_servicos cp ON c.id_cargo = c' +
        'p.id_cargo LEFT JOIN servicos s ON cp.id_servico = s.id_servico ' +
        'group by c.nome_cargo ORDER BY c.nome_cargo;')
    Left = 160
    Top = 400
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
    Left = 310
    Top = 381
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
    Left = 366
    Top = 294
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
    Left = 202
    Top = 430
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
    Left = 40
    Top = 480
  end
  object QueryRAS: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from agendamento_servicos')
    Left = 216
    Top = 480
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
    Left = 152
    Top = 456
  end
  object QueryAdm: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from administradores')
    Left = 389
    Top = 152
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
    Left = 107
    Top = 491
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
  object QueryHorarios: TFDQuery
    Connection = conexao_banco
    Left = 120
    Top = 240
  end
  object Queryag_pro: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      '                  SELECT '
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
    Left = 248
    Top = 272
    object Queryag_proid_agendamento: TIntegerField
      FieldName = 'id_agendamento'
      Origin = 'id_agendamento'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object Queryag_pronome_clie: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_clie'
      Origin = 'nome_clie'
      Size = 150
    end
    object Queryag_proemail_clie: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
    object Queryag_pronome_servicos: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_servicos'
      Origin = 'nome_servicos'
      ReadOnly = True
      Size = 500
    end
    object Queryag_prodata_agendamento: TDateField
      FieldName = 'data_agendamento'
      Origin = 'data_agendamento'
    end
    object Queryag_prohora_inicio: TTimeField
      FieldName = 'hora_inicio'
      Origin = 'hora_inicio'
      ProviderFlags = [pfInUpdate]
    end
    object Queryag_prostatus: TBooleanField
      FieldName = 'status'
      Origin = 'status'
      OnGetText = Queryag_prostatusGetText
    end
  end
end
