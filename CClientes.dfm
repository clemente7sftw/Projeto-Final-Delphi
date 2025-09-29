object Form4: TForm4
  Left = 0
  Top = 0
  Caption = 'Clientes'
  ClientHeight = 617
  ClientWidth = 994
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = [fsBold]
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 994
    Height = 617
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 992
    ExplicitHeight = 609
    object Image1: TImage
      Left = 24
      Top = 472
      Width = 33
      Height = 41
      Picture.Data = {
        0D54536B537667477261706869633C73766720786D6C6E733D22687474703A2F
        2F7777772E77332E6F72672F323030302F737667222076696577426F783D2230
        20302036343020363430223E3C212D2D21466F6E7420417765736F6D65204672
        656520372E302E302062792040666F6E74617765736F6D65202D206874747073
        3A2F2F666F6E74617765736F6D652E636F6D204C6963656E7365202D20687474
        70733A2F2F666F6E74617765736F6D652E636F6D2F6C6963656E73652F667265
        6520436F70797269676874203230323520466F6E7469636F6E732C20496E632E
        2D2D3E3C7061746820643D224D37332E34203239372E344336302E3920333039
        2E392036302E39203333302E322037332E34203334322E374C3233332E342035
        30322E37433234352E39203531352E32203236362E32203531352E3220323738
        2E37203530322E37433239312E32203439302E32203239312E32203436392E39
        203237382E37203435372E344C3137332E33203335324C353434203335324335
        36312E372033353220353736203333372E372035373620333230433537362033
        30322E33203536312E372032383820353434203238384C3137332E3320323838
        4C3237382E37203138322E36433239312E32203137302E31203239312E322031
        34392E38203237382E37203133372E33433236362E32203132342E3820323435
        2E39203132342E38203233332E34203133372E334C37332E34203239372E337A
        222F3E3C2F7376673E}
      Stretch = True
      OnClick = Image1Click
    end
    object Label1: TLabel
      Left = 568
      Top = 168
      Width = 56
      Height = 15
      Caption = 'nome_clie'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 570
      Top = 232
      Width = 54
      Height = 15
      Caption = 'email_clie'
      FocusControl = DBEdit2
    end
    object Lblrequired: TLabel
      Left = 570
      Top = 301
      Width = 150
      Height = 15
      Caption = 'Preencha todos os campos!'
      Color = clDarkred
      ParentColor = False
    end
    object DBGrid1: TDBGrid
      Left = 24
      Top = 272
      Width = 369
      Height = 185
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = [fsBold]
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_clie'
          Title.Caption = 'Cliente'
          Width = 192
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email_clie'
          Title.Caption = 'Email'
          Width = 210
          Visible = True
        end>
    end
    object BtnAdd: TPanel
      Left = 24
      Top = 104
      Width = 65
      Height = 41
      Caption = 'BtnAdd'
      TabOrder = 1
      OnClick = BtnAddClick
    end
    object BtnEditar: TPanel
      Left = 312
      Top = 64
      Width = 65
      Height = 41
      Caption = 'BtnEditar'
      TabOrder = 2
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TPanel
      Left = 408
      Top = 64
      Width = 65
      Height = 41
      Caption = 'BtnExcluir'
      TabOrder = 3
      OnClick = BtnExcluirClick
    end
    object DBEdit1: TDBEdit
      Left = 568
      Top = 184
      Width = 199
      Height = 23
      DataField = 'nome_clie'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 4
    end
    object DBEdit2: TDBEdit
      Left = 570
      Top = 253
      Width = 169
      Height = 23
      DataField = 'email_clie'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 5
    end
    object BtnConf: TPanel
      Left = 208
      Top = 64
      Width = 89
      Height = 41
      Caption = 'BtnConf'
      TabOrder = 6
      OnClick = BtnConfClick
    end
    object EdPesquisa: TEdit
      Left = 24
      Top = 200
      Width = 353
      Height = 45
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      TextHint = 'Pesquise'
    end
    object Panel1: TPanel
      Left = 336
      Top = 200
      Width = 41
      Height = 45
      Color = clBlack
      ParentBackground = False
      TabOrder = 8
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
        OnClick = Image2Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryClientes
    Left = 40
    Top = 32
  end
end
