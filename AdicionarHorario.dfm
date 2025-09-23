object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Marcar Hor'#225'rio'
  ClientHeight = 514
  ClientWidth = 578
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
    Width = 578
    Height = 514
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 88
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object BtnCad: TPanel
      Left = 192
      Top = 376
      Width = 65
      Height = 41
      Caption = 'BtnCad'
      TabOrder = 0
    end
    object BtnVoltar: TPanel
      Left = 48
      Top = 376
      Width = 65
      Height = 41
      Caption = 'BtnVoltar'
      TabOrder = 1
      OnClick = BtnVoltarClick
    end
    object DBComboBox1: TDBComboBox
      Left = 48
      Top = 168
      Width = 145
      Height = 23
      DataField = 'nome'
      DataSource = DataSource2
      TabOrder = 2
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.FDQueryReservas
    Left = 504
    Top = 80
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.FDQueryServicos
    Left = 360
    Top = 80
  end
end
