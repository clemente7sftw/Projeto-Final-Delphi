object Form20: TForm20
  Left = 0
  Top = 0
  Caption = 'Tela Inicial'
  ClientHeight = 474
  ClientWidth = 596
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
    Width = 596
    Height = 474
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 48
    ExplicitTop = 56
    ExplicitWidth = 185
    ExplicitHeight = 41
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
    end
  end
end
