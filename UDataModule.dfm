object DataModule1: TDataModule1
  Height = 547
  Width = 553
  object conexao_banco: TFDConnection
    Params.Strings = (
      'Database=beauty_stage'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'MonitorBy=FlatFile'
      'DriverID=PG')
    Left = 168
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
    Left = 446
    Top = 189
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
    Left = 350
    Top = 270
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
  object QueryUpAg: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      '')
    Left = 16
    Top = 392
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
    Left = 83
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
    Left = 224
    Top = 232
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
  object QueryServicosAux: TFDQuery
    Connection = conexao_banco
    SQL.Strings = (
      'select * from servicos '
      '')
    Left = 437
    Top = 54
  end
  object Query_editar_ag: TFDQuery
    Connection = conexao_banco
    Left = 472
    Top = 264
  end
end
