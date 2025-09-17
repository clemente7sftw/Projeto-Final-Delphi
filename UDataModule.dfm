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
  end
end
