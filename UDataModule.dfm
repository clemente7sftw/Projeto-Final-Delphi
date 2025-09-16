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
    Left = 152
    Top = 120
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    VendorLib = 
      'C:\Users\gabri\OneDrive\Documentos\Projeto-Final-Delphi\Win32\De' +
      'bug\lib\libpq.dll'
    Left = 48
    Top = 120
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select * from usuarios')
    Left = 232
    Top = 120
  end
end
