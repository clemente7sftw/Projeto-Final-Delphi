object Form20: TForm20
  Left = 0
  Top = 0
  Caption = 'Tela Inicial'
  ClientHeight = 520
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 520
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 853
    ExplicitHeight = 512
    object Label1: TLabel
      Left = 256
      Top = 168
      Width = 45
      Height = 15
      Caption = 'empresa'
    end
    object LbClie: TLabel
      Left = 56
      Top = 224
      Width = 33
      Height = 15
      Caption = 'LbClie'
      OnClick = LbClieClick
    end
    object LbProfissionais: TLabel
      Left = 136
      Top = 224
      Width = 79
      Height = 15
      Caption = 'LbProfissionais'
      OnClick = LbProfissionaisClick
    end
    object LbServicos: TLabel
      Left = 256
      Top = 224
      Width = 56
      Height = 15
      Caption = 'LbServicos'
      OnClick = LbServicosClick
    end
    object LbCargos: TLabel
      Left = 368
      Top = 224
      Width = 50
      Height = 15
      Caption = 'LbCargos'
      OnClick = LbCargosClick
    end
    object Label2: TLabel
      Left = 456
      Top = 224
      Width = 84
      Height = 15
      Caption = 'LbFornecedores'
      OnClick = LbCargosClick
    end
  end
end
