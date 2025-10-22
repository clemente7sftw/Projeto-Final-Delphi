object Form25: TForm25
  Left = 0
  Top = 0
  Caption = 'Relat'#243'rios Clientes'
  ClientHeight = 613
  ClientWidth = 878
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RelatorioClientes: TRLReport
    Left = 46
    Top = 24
    Width = 794
    Height = 1123
    Borders.Sides = sdCustom
    Borders.DrawLeft = False
    Borders.DrawTop = False
    Borders.DrawRight = False
    Borders.DrawBottom = False
    DataSource = DSClie
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    object RLBHeader: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 50
      BandType = btHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLSystemInfo1: TRLSystemInfo
        Left = 8
        Top = 16
        Width = 39
        Height = 16
        Text = ''
      end
      object RLSystemInfo2: TRLSystemInfo
        Left = 664
        Top = 16
        Width = 39
        Height = 16
        Info = itHour
        Text = ''
      end
      object RLLabel1: TRLLabel
        Left = 320
        Top = 16
        Width = 79
        Height = 16
        Alignment = taCenter
        Borders.Sides = sdCustom
        Borders.DrawLeft = False
        Borders.DrawTop = False
        Borders.DrawRight = False
        Borders.DrawBottom = False
        Caption = 'BeautyStage'
      end
    end
    object RLBTitulo: TRLBand
      Left = 38
      Top = 88
      Width = 718
      Height = 57
      BandType = btTitle
      object RLLabel2: TRLLabel
        Left = 0
        Top = 0
        Width = 718
        Height = 33
        Align = faTop
        Alignment = taCenter
        Caption = 'RELAT'#211'RIO DE CLIENTES'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
      object RLPeriodo: TRLLabel
        Left = 0
        Top = 33
        Width = 718
        Height = 30
        Align = faTop
        Alignment = taCenter
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Height = -21
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
      end
    end
    object RLBCabecalho: TRLBand
      Left = 38
      Top = 145
      Width = 718
      Height = 64
      BandType = btColumnHeader
      Borders.Sides = sdCustom
      Borders.DrawLeft = False
      Borders.DrawTop = False
      Borders.DrawRight = False
      Borders.DrawBottom = True
      object RLLabel3: TRLLabel
        Left = 3
        Top = 12
        Width = 38
        Height = 16
        Caption = 'Nome'
      end
      object RLLabel4: TRLLabel
        Left = 339
        Top = 12
        Width = 37
        Height = 16
        Caption = 'Email'
      end
      object RLLabel6: TRLLabel
        Left = 611
        Top = 12
        Width = 92
        Height = 16
        Caption = 'Cadastrado em'
      end
    end
    object RLBConteudo: TRLBand
      Left = 38
      Top = 209
      Width = 718
      Height = 160
      object RLDBText1: TRLDBText
        Left = 3
        Top = 16
        Width = 63
        Height = 16
        DataField = 'nome_clie'
        DataSource = DSClie
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 329
        Top = 6
        Width = 120
        Height = 16
        DataField = 'email_clie'
        DataSource = DSClie
        Text = 'email_clie'
      end
      object RLDBText3: TRLDBText
        Left = 625
        Top = 6
        Width = 134
        Height = 16
        DataField = 'cidade_clie'
        DataSource = DSClie
        Text = 'cidade_clie'
      end
    end
    object RLBFooter: TRLBand
      Left = 38
      Top = 369
      Width = 718
      Height = 16
      BandType = btFooter
    end
  end
  object DSClie: TDataSource
    DataSet = DataModule1.QueryClientes
    Left = 216
    Top = 440
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    MasterSource = DSClie
    PacketRecords = 0
    Params = <>
    Left = 278
    Top = 440
  end
end
