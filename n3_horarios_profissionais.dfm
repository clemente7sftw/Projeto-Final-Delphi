object Form33: TForm33
  Left = 0
  Top = 0
  Caption = 'Form33'
  ClientHeight = 536
  ClientWidth = 397
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object TimePicker1: TTimePicker
    Left = 24
    Top = 32
    Width = 113
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 0
    Time = 45973.576969733800000000
    TimeFormat = 'hh:nn'
  end
  object TimePicker2: TTimePicker
    Left = 232
    Top = 32
    Width = 113
    Height = 25
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
    Time = 45973.576969733800000000
    TimeFormat = 'hh:nn'
  end
  object CLBdias_semana: TCheckListBox
    Left = 24
    Top = 96
    Width = 321
    Height = 201
    ItemHeight = 17
    TabOrder = 2
  end
  object Panel1: TPanel
    Left = 24
    Top = 392
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Voltar'
    TabOrder = 3
  end
  object Panel2: TPanel
    Left = 240
    Top = 392
    Width = 105
    Height = 33
    Cursor = crHandPoint
    Caption = 'Cadastrar'
    TabOrder = 4
    OnClick = Panel2Click
  end
end
