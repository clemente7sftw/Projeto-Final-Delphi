object Form11: TForm11
  Left = 0
  Top = 0
  Caption = 'Adicionar Cargo'
  ClientHeight = 1061
  ClientWidth = 941
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
    Width = 941
    Height = 1061
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Image1: TImage
      Left = 24
      Top = 400
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
    end
    object Lblrequired: TLabel
      Left = 32
      Top = 336
      Width = 145
      Height = 15
      Caption = 'Preencha todos os campos!'
      Color = clDarkred
      ParentColor = False
    end
    object Label1: TLabel
      Left = 56
      Top = 152
      Width = 66
      Height = 15
      Caption = 'nome_cargo'
      FocusControl = DBEdit1
    end
    object PCad: TPanel
      Left = 436
      Top = 416
      Width = 121
      Height = 41
      Caption = 'PCad'
      TabOrder = 0
      OnClick = PCadClick
    end
    object DBEdit1: TDBEdit
      Left = 56
      Top = 168
      Width = 201
      Height = 23
      DataField = 'nome_cargo'
      DataSource = DataSource1
      TabOrder = 1
    end
    object ComboBox1: TComboBox
      Left = 56
      Top = 240
      Width = 145
      Height = 23
      TabOrder = 2
      Text = 'ComboBox1'
      OnEnter = ComboBox1Enter
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryCargos
    Left = 648
    Top = 72
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.QueryServicos
    Left = 656
    Top = 136
  end
end
