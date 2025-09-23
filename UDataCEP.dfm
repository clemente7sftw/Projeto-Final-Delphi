object DataModule2: TDataModule2
  Height = 418
  Width = 377
  PixelsPerInch = 120
  object RESTClient1: TRESTClient
    Params = <>
    SynchronizedEvents = False
    Left = 40
    Top = 60
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Params = <>
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 140
    Top = 60
  end
  object RESTResponse1: TRESTResponse
    Left = 250
    Top = 60
  end
  object RESTResponseDataSetAdapter1: TRESTResponseDataSetAdapter
    Dataset = FDMemTable1
    FieldDefs = <>
    Response = RESTResponse1
    Left = 110
    Top = 170
  end
  object FDMemTable1: TFDMemTable
    FetchOptions.AssignedValues = [evMode]
    FetchOptions.Mode = fmAll
    ResourceOptions.AssignedValues = [rvSilentMode]
    ResourceOptions.SilentMode = True
    UpdateOptions.AssignedValues = [uvCheckRequired, uvAutoCommitUpdates]
    UpdateOptions.CheckRequired = False
    UpdateOptions.AutoCommitUpdates = True
    Left = 110
    Top = 270
  end
end
