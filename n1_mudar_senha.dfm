object Form24: TForm24
  Left = 0
  Top = 0
  Caption = 'Form24'
  ClientHeight = 520
  ClientWidth = 422
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object Fundo: TPanel
    Left = 0
    Top = 0
    Width = 422
    Height = 520
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object ConfSenha: TPanel
      Left = 112
      Top = 314
      Width = 200
      Height = 31
      Caption = 'Confirmar Senha'
      Color = 2700608
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
    object EdNovaSenha: TEdit
      Left = 112
      Top = 264
      Width = 200
      Height = 33
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -19
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
  end
end
