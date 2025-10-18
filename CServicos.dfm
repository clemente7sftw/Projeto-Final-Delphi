object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os'
  ClientHeight = 556
  ClientWidth = 789
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 789
    Height = 556
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label2: TLabel
      Left = 440
      Top = 248
      Width = 43
      Height = 15
      Caption = 'duracao'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 440
      Top = 312
      Width = 30
      Height = 15
      Caption = 'preco'
      FocusControl = DBEdit3
    end
    object Label1: TLabel
      Left = 432
      Top = 176
      Width = 31
      Height = 15
      Caption = 'nome'
      FocusControl = DBEdit1
    end
    object lbaviso: TLabel
      Left = 392
      Top = 400
      Width = 371
      Height = 15
      Caption = 
        'Este servi'#231'o n'#227'o pode ser exclu'#237'do: est'#225' vinculado a um agendame' +
        'nto.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
    end
    object PbtnAdd: TPanel
      Left = 24
      Top = 112
      Width = 185
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = PbtnAddClick
    end
    object DBGServicos: TDBGrid
      Left = 24
      Top = 269
      Width = 289
      Height = 272
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Width = 147
          Visible = True
        end>
    end
    object BtnEditar: TPanel
      Left = 409
      Top = 63
      Width = 89
      Height = 41
      Caption = 'BtnEditar'
      TabOrder = 2
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TPanel
      Left = 599
      Top = 63
      Width = 89
      Height = 41
      Caption = 'BtnExcluir'
      TabOrder = 3
      OnClick = BtnExcluirClick
    end
    object BtnConf: TPanel
      Left = 504
      Top = 63
      Width = 89
      Height = 41
      Caption = 'BtnConf'
      TabOrder = 4
      OnClick = BtnConfClick
    end
    object EdPesquisa: TEdit
      Left = 24
      Top = 198
      Width = 353
      Height = 45
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      TextHint = 'Pesquise'
    end
    object Panel1: TPanel
      Left = 336
      Top = 198
      Width = 41
      Height = 45
      Color = clBlack
      ParentBackground = False
      TabOrder = 6
      object Image2: TImage
        Left = 8
        Top = 8
        Width = 32
        Height = 36
        Picture.Data = {
          0954506E67496D61676589504E470D0A1A0A0000000D494844520000001F0000
          0021080600000021DE70E4000000097048597300000B1300000B1301009A9C18
          000000017352474200AECE1CE90000000467414D410000B18F0BFC6105000001
          E24944415478DAED57815583400C0D1BE806ED04B61BD009D409A413B49DA074
          833A813881DD4036284E204E201BE0CF23D8E3B83B38FAD03E9F792F8F72BDE4
          27B95C1202FA450AFEC15D5496E5151E33F02D987F4FC019F80D9C0641908F02
          0EE02D1E6B01B55102DEF91A610507287BF7221EF7A102BC840187B3C005F895
          AAF0AA940993FC171AC42318F07C0EF8BB069C5215D6D4606404DE6A2AE6D89B
          5107B5C0E58C63658941639712C8CC2452755E70122E8680AB5E2750B2EC1342
          C88562404D0B3D524E7028E0103E294B539F0C863C83877DBDD7C11938F2F5DA
          E27D01F96B1F70D5F27B9F6B23F27CE69FCAD2043A3EFA82ABE7DD796616037A
          EBB828F0239D2A1A57AB640078A9BC3AEFBB0ECE600FF2FA08C1B52770486724
          5C44A7ABC6B59AAF5AE101AEDE16EFABC6D9CA675657AA3D146C0678CDD4796C
          A60A1753B356C750B2EB00E63CE10E3891A51C32D32E834DE0ECF5919A8D853D
          68F56BD9BBA276BFEF1531DF969A52BBA5DA868C0D0CD87B83771860A34258DD
          EFECEDCE314AC2CA215D917B8CE288D47DE0A8EDB596699F01F28EAA027423CB
          395503E441CD05436FE7682C4CC56694D1D970ED8C068C36B71B66835C0CF88E
          D2A81F0D06031A556FF42F16AD6865009FFF18B81201FEDAD9A9E77EF9DF6A7F
          12FC0B1293E6224739C13B0000000049454E44AE426082}
      end
    end
    object DBEdit2: TDBEdit
      Left = 440
      Top = 269
      Width = 185
      Height = 23
      DataField = 'duracao'
      DataSource = DataSource1
      TabOrder = 7
    end
    object DBEdit3: TDBEdit
      Left = 440
      Top = 344
      Width = 185
      Height = 23
      DataField = 'preco'
      DataSource = DataSource1
      TabOrder = 8
    end
    object DBEdit1: TDBEdit
      Left = 432
      Top = 192
      Width = 754
      Height = 23
      DataField = 'nome'
      DataSource = DataSource1
      TabOrder = 9
    end
    object StatusBar1: TStatusBar
      Left = 1
      Top = 536
      Width = 787
      Height = 19
      Panels = <>
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryServicos
    Left = 48
    Top = 48
  end
end
