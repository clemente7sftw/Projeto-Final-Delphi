object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os'
  ClientHeight = 1061
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
    Height = 1061
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 552
    ExplicitTop = 320
    ExplicitWidth = 185
    ExplicitHeight = 41
    object PbtnAdd: TPanel
      Left = 48
      Top = 216
      Width = 185
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = PbtnAddClick
    end
    object GServicos: TStringGrid
      Left = 48
      Top = 368
      Width = 320
      Height = 120
      ColCount = 3
      RowCount = 1
      FixedRows = 0
      TabOrder = 1
    end
  end
end
