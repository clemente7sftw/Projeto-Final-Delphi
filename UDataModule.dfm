object DataModule1: TDataModule1
  Height = 261
  Width = 367
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=beauty_teste'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 184
    Top = 16
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\Win32\De' +
      'bug\lib\libpq.dll'
    Left = 56
    Top = 16
  end
  object FDQueryClientes: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from clientes_cad')
    Left = 32
    Top = 88
    object FDQueryClientesid_clie: TIntegerField
      FieldName = 'id_clie'
      Origin = 'id_clie'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryClientesnome_clie: TWideStringField
      FieldName = 'nome_clie'
      Origin = 'nome_clie'
      Size = 150
    end
    object FDQueryClientesemail_clie: TWideStringField
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
    object FDQueryClientessenha_clie: TWideStringField
      FieldName = 'senha_clie'
      Origin = 'senha_clie'
      Size = 100
    end
    object FDQueryClientescpf_clie: TWideStringField
      FieldName = 'cpf_clie'
      Origin = 'cpf_clie'
      Size = 14
    end
    object FDQueryClientesgenero_clie: TWideStringField
      FieldName = 'genero_clie'
      Origin = 'genero_clie'
    end
    object FDQueryClientesfone_clie: TWideStringField
      FieldName = 'fone_clie'
      Origin = 'fone_clie'
      Size = 11
    end
    object FDQueryClientescep_clie: TWideStringField
      FieldName = 'cep_clie'
      Origin = 'cep_clie'
      Size = 8
    end
    object FDQueryClientesrua_clie: TWideStringField
      FieldName = 'rua_clie'
      Origin = 'rua_clie'
      Size = 100
    end
    object FDQueryClientesbairro_clie: TWideStringField
      FieldName = 'bairro_clie'
      Origin = 'bairro_clie'
      Size = 50
    end
    object FDQueryClientescidade_clie: TWideStringField
      FieldName = 'cidade_clie'
      Origin = 'cidade_clie'
      Size = 50
    end
    object FDQueryClientesestado_clie: TWideStringField
      FieldName = 'estado_clie'
      Origin = 'estado_clie'
      Size = 50
    end
  end
  object FDQueryServicos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from servicos')
    Left = 152
    Top = 96
    object FDQueryServicosid_servicos: TIntegerField
      FieldName = 'id_servicos'
      Origin = 'id_servicos'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryServicosnome: TWideStringField
      FieldName = 'nome'
      Origin = 'nome'
      Size = 100
    end
    object FDQueryServicosduracao: TIntegerField
      FieldName = 'duracao'
      Origin = 'duracao'
    end
    object FDQueryServicosdata_cadastro: TSQLTimeStampField
      FieldName = 'data_cadastro'
      Origin = 'data_cadastro'
      ProviderFlags = [pfInUpdate]
    end
    object FDQueryServicospreco: TBCDField
      FieldName = 'preco'
      Origin = 'preco'
      Precision = 10
      Size = 2
    end
    object FDQueryServicosfoto_url: TWideStringField
      FieldName = 'foto_url'
      Origin = 'foto_url'
      Size = 255
    end
  end
  object FDQueryReservas: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from reservas'
      '')
    Left = 32
    Top = 168
    object FDQueryReservasid_reserva: TIntegerField
      FieldName = 'id_reserva'
      Origin = 'id_reserva'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object FDQueryReservasid_clie: TIntegerField
      FieldName = 'id_clie'
      Origin = 'id_clie'
    end
    object FDQueryReservasid_servicos: TIntegerField
      FieldName = 'id_servicos'
      Origin = 'id_servicos'
    end
    object FDQueryReservasid_pro: TIntegerField
      FieldName = 'id_pro'
      Origin = 'id_pro'
    end
    object FDQueryReservasemail_clie: TWideStringField
      FieldName = 'email_clie'
      Origin = 'email_clie'
      Size = 100
    end
    object FDQueryReservasdt_reserva: TDateField
      FieldName = 'dt_reserva'
      Origin = 'dt_reserva'
    end
    object FDQueryReservashr_reserva: TTimeField
      FieldName = 'hr_reserva'
      Origin = 'hr_reserva'
      ProviderFlags = [pfInUpdate]
    end
  end
end
