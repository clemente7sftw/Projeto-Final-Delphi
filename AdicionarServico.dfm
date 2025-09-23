object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Adicionar Servi'#231'o'
  ClientHeight = 561
  ClientWidth = 900
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 900
    Height = 561
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitTop = -500
    ExplicitHeight = 1061
    object EdNomeS: TEdit
      Left = 88
      Top = 96
      Width = 121
      Height = 23
      TabStop = False
      TabOrder = 0
      TextHint = 'Nome do Servi'#231'o'
    end
    object EdDuracao: TEdit
      Left = 88
      Top = 144
      Width = 121
      Height = 23
      TabStop = False
      TabOrder = 1
      TextHint = 'Dura'#231#227'o'
    end
    object EdPreco: TEdit
      Left = 88
      Top = 192
      Width = 121
      Height = 23
      TabStop = False
      TabOrder = 2
      TextHint = 'Pre'#231'o'
    end
    object PVoltar: TPanel
      Left = 88
      Top = 312
      Width = 121
      Height = 41
      Caption = 'PVoltar'
      TabOrder = 3
    end
    object PCad: TPanel
      Left = 600
      Top = 312
      Width = 121
      Height = 41
      Caption = 'PCad'
      TabOrder = 4
      OnClick = PCadClick
    end
  end
end
