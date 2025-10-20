object Form22: TForm22
  Left = 0
  Top = 0
  Caption = 'Form22'
  ClientHeight = 615
  ClientWidth = 855
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnShow = FormShow
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 855
    Height = 615
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 352
    ExplicitTop = 272
    ExplicitWidth = 185
    ExplicitHeight = 41
    object Label1: TLabel
      Left = 128
      Top = 264
      Width = 60
      Height = 15
      Caption = 'senha_adm'
      FocusControl = DBEdit1
    end
    object DBEdit1: TDBEdit
      Left = 128
      Top = 280
      Width = 200
      Height = 23
      DataField = 'senha_adm'
      DataSource = DataSource1
      TabOrder = 0
    end
    object ConfSenha: TPanel
      Left = 128
      Top = 336
      Width = 200
      Height = 49
      Caption = 'ConfSenha'
      TabOrder = 1
      OnClick = ConfSenhaClick
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryAdm
    Left = 424
    Top = 312
  end
end
