object DataModule1: TDataModule1
  Height = 356
  Width = 569
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=beauty_stage'
      'User_Name=postgres'
      'Password=root'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 128
    Top = 56
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\Win32\De' +
      'bug\lib\libpq.dll'
    Left = 24
    Top = 56
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from usuarios')
    Left = 208
    Top = 56
  end
  object DataSource1: TDataSource
    Left = 296
    Top = 56
  end
end
