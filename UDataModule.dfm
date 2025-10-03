object DataModule1: TDataModule1
  Height = 555
  Width = 1241
  PixelsPerInch = 120
  object conexao: TFDConnection
    Params.Strings = (
      'Database=beauty_stage'
      'User_Name=postgres'
      'Password=2007'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 200
    Top = 20
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabi\OneDrive\Documents\Projeto-Final-Delphi\Win32\Debu' +
      'g\lib\libpq.dll'
    Left = 70
    Top = 20
  end
  object QueryClientes: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT * FROM clientes;'
      '')
    Left = 40
    Top = 110
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
      Size = 150
    end
    object QueryClientestelefone: TWideStringField
      FieldName = 'telefone'
      Origin = 'telefone'
    end
    object QueryClientescpf: TWideStringField
      FieldName = 'cpf'
      Origin = 'cpf'
      FixedChar = True
      Size = 11
    end
    object QueryClientescep: TWideStringField
      FieldName = 'cep'
      Origin = 'cep'
      FixedChar = True
      Size = 8
    end
    object QueryClientesrua: TWideStringField
      FieldName = 'rua'
      Origin = 'rua'
      Size = 150
    end
    object QueryClientesbairro: TWideStringField
      FieldName = 'bairro'
      Origin = 'bairro'
      Size = 100
    end
    object QueryClientescidade: TWideStringField
      FieldName = 'cidade'
      Origin = 'cidade'
      Size = 100
    end
    object QueryClientesestado: TWideStringField
      FieldName = 'estado'
      Origin = 'estado'
      Size = 50
    end
    object QueryClientesdata_cad: TSQLTimeStampField
      FieldName = 'data_cad'
      Origin = 'data_cad'
      ProviderFlags = [pfInUpdate]
    end
  end
  object QueryProfissionais: TFDQuery
    Connection = conexao
    SQL.Strings = (
      '   select * from profissionais'
      '   ')
    Left = 163
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
    Connection = conexao
    SQL.Strings = (
      'select * from empresas')
    Left = 156
    Top = 203
  end
  object QueryServicos: TFDQuery
    Connection = conexao
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
  object QueryCS: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT * from cargos_servicos')
    Left = 140
    Top = 296
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
    Connection = conexao
    SQL.Strings = (
      'select * from cargos'
      '')
    Left = 256
    Top = 239
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
    Connection = conexao
    SQL.Strings = (
      'select * from fornecedores')
    Left = 738
    Top = 433
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
    Connection = conexao
    SQL.Strings = (
      'select * from profissionais_cargos')
    Left = 40
    Top = 390
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
    Connection = conexao
    SQL.Strings = (
      'SELECT '
      '    p.nome_pro,'
      '    p.email,'
      '    STRING_AGG(c.nome, '#39', '#39')::varchar(500) AS nome_cargo'
      'FROM '
      '    profissionais p'
      'LEFT JOIN '
      
        '    profissionais_cargos pc ON p.id_profissional = pc.id_profiss' +
        'ional'
      'LEFT JOIN '
      '    cargos c ON pc.id_cargo = c.id_cargo'
      'GROUP BY '
      '    p.nome_pro,'
      'p.email'
      'ORDER BY '
      '    p.nome_pro;')
    Left = 150
    Top = 390
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
    Connection = conexao
    SQL.Strings = (
      'SELECT '
      '    c.nome,'
      '    s.nome_serv AS nome_serv'
      'FROM '
      '    cargos c'
      'LEFT JOIN '
      '    cargos_servicos cp ON c.id_cargo = cp.id_cargo'
      'LEFT JOIN '
      '    servicos s ON cp.id_servico = s.id_servico'
      'ORDER BY '
      '    c.nome;'
      '')
    Left = 226
    Top = 308
    object QueryRCSnome_cargo: TWideStringField
      FieldName = 'nome_cargo'
      Origin = 'nome_cargo'
      Size = 100
    end
    object QueryRCSnome_servico: TWideStringField
      AutoGenerateValue = arDefault
      FieldName = 'nome_servico'
      Origin = 'nome_servico'
      Size = 50
    end
  end
  object QueryAg: TFDQuery
    Connection = conexao
    SQL.Strings = (
      'SELECT '
      '    a.id_agendamento,'
      '    c.nome_clie,'
      '    s.nome_serv,'
      '    a.data_agendamento,'
      '    a.hora'
      'FROM '
      '    agendamentos a'
      'INNER JOIN '
      '    clientes c ON a.id_clie = c.id_clie'
      'INNER JOIN'
      '    servicos s ON a.id_servico = s.id_servico;'
      '')
    Left = 32
    Top = 208
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
end
