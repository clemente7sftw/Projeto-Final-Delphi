object Form21: TForm21
  Left = 0
  Top = 0
  Caption = 'Form21'
  ClientHeight = 635
  ClientWidth = 1038
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 1038
    Height = 635
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 8
    ExplicitWidth = 693
    ExplicitHeight = 589
    object DBGrid1: TDBGrid
      Left = 24
      Top = 208
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
          FieldName = 'nome'
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
          Width = 55
          Visible = True
        end>
    end
    object BtnAdd: TPanel
      Left = 24
      Top = 143
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
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryAg
    Left = 536
    Top = 24
  end
end
