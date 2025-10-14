object Form21: TForm21
  Left = 0
  Top = 0
  Caption = 'Form21'
  ClientHeight = 910
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 1038
    Height = 910
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 56
      Top = 264
      Width = 54
      Height = 15
      Caption = 'nome_clie'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 56
      Top = 328
      Width = 52
      Height = 15
      Caption = 'email_clie'
      FocusControl = DBEdit2
    end
    object ExclBtn: TImage
      Left = 824
      Top = 170
      Width = 33
      Height = 34
      Cursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        001C080600000000C2BD22000000097048597300000B1300000B1301009A9C18
        000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000001
        124944415478DAD5966D0DC23010863B0748280E9883E10014B0290014301480
        0386028202EA001CAC2800077017CA9FA5DFED567893374BBAA5F7F496BB6B46
        122BFB37000A3E88A74C1C3C073FFB02C0E0A5E19B2DB80E0558826792F50978
        64D8134F7F93AC33016704C02057C7CCD82AEFC2A93270526420449881A94D06
        06D54F03D4E045A43847A2A80C13C0261280B234750025F9D47D0CADC1FB9400
        15B8710528C0974800587ECC15206643F202A0E0361200EE757705C09EFF8804
        9039BF107AA506C05F40038373F03825004EBFDC1700CBB00804604432056D01
        1A123E0FCE4433DA8700C03D2A5F8015781708A0BD239A00B0176037A49EC199
        383DF705F8CAE632DA15D7057605E84DC901DE82492E1DF98D6AC00000000049
        454E44AE426082}
      OnClick = ExclBtnClick
    end
    object EditBtn: TImage
      Left = 874
      Top = 170
      Width = 32
      Height = 34
      Cursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        001C080600000000C2BD22000000097048597300000B1300000B1301009A9C18
        000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000001
        5F4944415478DADD958D8D82401085C70E2C81122CC1EBC0AB40AD40AD40AE02
        B502ED403B103BB083C30AA4849B17E69215676116564C7CC9849F00EFDBF959
        06F4660D3E1960C89170E41C459F0030DD738C9D7B5B8E551F00303FCBB1AA2B
        C7B764E4250048F9AF1C7D82F9970B113B0329C7BAE1991DC73226C082E3C671
        926B7C7C53F37C26598802B0715683D5FFC8F988CA5ED0CA71E0987705C087D1
        E993CA7D1722A1E786CC29420FE0834759A526AC1023575420A24C81B62A4DAE
        19B285326D49D9904200EAEAAA09E60FE9D66405985299DA50AD64E59D0030D7
        690BF3B905BA09C01D33AB5067A4FE6A79D807E01BB326E564A8BB0500E6B340
        7375CCDA002454FE5442846D18352F02DF5301669201AB1E7E2E3100B0CB596B
        8F6D376D6BAE01A0F9EEC6774D63160A30910CD4097546B3655DCD35005FF7C3
        145D7E21CF9E1E0BE0BFFEAE6126E7D14CEB00A0111977B15701F4AAB703FC01
        4EE84C1DACD331E50000000049454E44AE426082}
    end
    object btncancelar: TImage
      Left = 929
      Top = 170
      Width = 41
      Height = 33
      Cursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000260000
        002008060000007E640AB3000000097048597300000B1300000B1301009A9C18
        000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000000
        F04944415478DAEDD78D09C2301005E074034770041DC10D74039D4C37D00D1C
        4147E8081DC10B44086293BBF70E6B4A03472934EFBE96FEA45DF8D3D14D0D58
        60BF84ADA4D6524F877EEAAC1A2C86DCD3B697DAA52D324C5935D851EA9CEDA3
        B81CF51E07A91B0A8B97FEF11168C57D43C5B95BA901859582353878AEF6A944
        1A3027647A5D581A51282B4CDB904621B05AE3E0814261255C080E28063686CB
        078C6261251C859A2D6C0CE5829BD5CD3F869AF4755142F586635C61968634AE
        E98F38D3009E6B595A9BCFBA92412D14F752570255C29DA42E1E570C454159DA
        9B7F934206E5F17456D33FBC0BAC09D80B539776210A1239D50000000049454E
        44AE426082}
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 424
      Width = 961
      Height = 321
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_clie'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email_clie'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'nome_servicos'
          Width = 200
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'data_agendamento'
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'hora_inicio'
          Width = 77
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'status'
          Width = 103
          Visible = True
        end>
    end
    object BtnAdd: TPanel
      Left = 56
      Top = 162
      Width = 177
      Height = 41
      Cursor = crHandPoint
      Caption = 'Adicionar        '
      Color = 8612866
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 1
      OnClick = BtnAddClick
      object Image3: TImage
        Left = 128
        Top = 0
        Width = 49
        Height = 41
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000002A0000
          00280806000000880B6850000000097048597300000B1300000B1301009A9C18
          000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000001
          D14944415478DAED98816D83301045CD061981119A0D6082AA1B9009924E103A
          41D309EA4ED07682B241B241C804ED06F49F0089503BD867C740952F9DAC24D6
          DDE36CCEE74462268AC606B881CE0EB4AAAA3B0C6471F3D501564451F4330950
          002618B6B0443345C29E005C8E060A4802CC0DA612E403600FC1412D205BD116
          58FACAAC112820630C47867FDAB36948D0570C1933460AD8221428653366C678
          01E8C620066D2D9A57360F77563D0641E16081E1DB21191241570671F6A22E77
          422856614AA0DD55B3076D9C10E882094A35350F05BAC3B066822A5F26F8DCF4
          1E7EDDF92C61A7CE6FD21494F6CE9E01A92C4F0DE4B3859FD2A6E0E7A23E3A4D
          A52DF80C5FE6A0960108EEE2110A5F99382F79EE4BAF08B015EABA4A59FC803D
          DA76515E5E268D63DAB749270B4E6DDED5407D6B4EA06D2550568AC9800EC9A6
          3C2518EE457D1E93E94E2ADAAB25ECB3C94E1904D4E0EA3124293C5C4D2E8232
          BA7A9D08D2E96AA205756C9675CA00FBE60DD46326FBA21A9B7232FB07D4A101
          31D501A04B1FA0DD4EFB5A5A0156B2410364B395F5EDB40FEAD220DB2A06ECC9
          74721FF44BF0EBA5ADAC96BF0F1A627FB6A25670C7059D4D46299BEF82FF6783
          A90A519F54C6BDEBFFEB9EC6D60DD4B77E012C24E01B6D888628000000004945
          4E44AE426082}
      end
    end
    object BtnConf: TPanel
      Left = 854
      Top = 334
      Width = 89
      Height = 41
      Caption = 'BtnConf'
      TabOrder = 2
      OnClick = BtnConfClick
    end
    object BtnEditar: TPanel
      Left = 303
      Top = 48
      Width = 89
      Height = 41
      Caption = 'BtnEditar'
      TabOrder = 3
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TPanel
      Left = 398
      Top = 48
      Width = 89
      Height = 41
      Caption = 'BtnExcluir'
      TabOrder = 4
      OnClick = BtnExcluirClick
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 280
      Width = 200
      Height = 23
      DataField = 'nome_clie'
      DataSource = DataSource1
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 56
      Top = 344
      Width = 200
      Height = 23
      DataField = 'email_clie'
      DataSource = DataSource1
      TabOrder = 6
    end
    object calendario: TMonthCalendar
      Left = 279
      Top = 170
      Width = 267
      Height = 205
      Date = 45937.000000000000000000
      TabOrder = 7
    end
    object CLBServicos: TCheckListBox
      Left = 582
      Top = 170
      Width = 219
      Height = 205
      ItemHeight = 17
      TabOrder = 8
    end
    object ComboBoxHorarios: TComboBox
      Left = 840
      Top = 88
      Width = 145
      Height = 23
      TabOrder = 9
      Text = 'ComboBoxHorarios'
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryAg
    Left = 536
    Top = 80
  end
end
