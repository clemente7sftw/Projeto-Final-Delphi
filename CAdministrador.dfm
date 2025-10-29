object Form22: TForm22
  Left = 0
  Top = 0
  Caption = 'Cadastre sua nova senha'
  ClientHeight = 474
  ClientWidth = 418
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
    Width = 418
    Height = 474
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 897
    ExplicitHeight = 615
    object ConfSenha: TPanel
      Left = 112
      Top = 314
      Width = 200
      Height = 31
      Caption = 'Confirmar Senha'
      Color = 8543977
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentBackground = False
      ParentFont = False
      TabOrder = 0
      OnClick = ConfSenhaClick
    end
    object DBEdit1: TDBEdit
      Left = 112
      Top = 253
      Width = 200
      Height = 29
      DataField = 'senha_adm'
      DataSource = DataSource1
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryAdm
    Left = 56
    Top = 152
  end
end
