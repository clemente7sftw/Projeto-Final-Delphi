object Form24: TForm24
  Left = 0
  Top = 0
  Caption = 'Form24'
  ClientHeight = 655
  ClientWidth = 1045
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 1045
    Height = 655
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 897
    ExplicitHeight = 615
    object Label2: TLabel
      Left = 112
      Top = 464
      Width = 54
      Height = 15
      Caption = 'senha_clie'
      FocusControl = DBEdit1
    end
    object ConfSenha: TPanel
      Left = 112
      Top = 514
      Width = 200
      Height = 49
      Caption = 'ConfSenha'
      TabOrder = 0
      OnClick = ConfSenhaClick
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 485
      Width = 200
      Height = 23
      DataField = 'senha_clie'
      DataSource = DataSource1
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryClientes
    Left = 520
    Top = 336
  end
end
