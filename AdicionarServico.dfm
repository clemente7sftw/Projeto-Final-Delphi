object Form10: TForm10
  Left = 0
  Top = 0
  Caption = 'Adicionar Servi'#231'o'
  ClientHeight = 541
  ClientWidth = 559
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
    Width = 559
    Height = 541
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 557
    ExplicitHeight = 533
    object Lblrequired: TLabel
      Left = 64
      Top = 352
      Width = 145
      Height = 15
      Caption = 'Preencha todos os campos!'
      Color = clDarkred
      ParentColor = False
    end
    object Label4: TLabel
      Left = 64
      Top = 232
      Width = 43
      Height = 15
      Caption = 'duracao'
      FocusControl = DBEdit2
    end
    object Label5: TLabel
      Left = 64
      Top = 282
      Width = 30
      Height = 15
      Caption = 'preco'
      FocusControl = DBEdit3
    end
    object Label1: TLabel
      Left = 64
      Top = 176
      Width = 31
      Height = 15
      Caption = 'nome'
      FocusControl = DBEdit1
    end
    object PVoltar: TPanel
      Left = 64
      Top = 400
      Width = 121
      Height = 41
      Caption = 'PVoltar'
      TabOrder = 2
      OnClick = PVoltarClick
    end
    object PCad: TPanel
      Left = 264
      Top = 400
      Width = 121
      Height = 41
      Caption = 'PCad'
      TabOrder = 4
      OnClick = PCadClick
    end
    object DBEdit2: TDBEdit
      Left = 64
      Top = 253
      Width = 154
      Height = 23
      DataField = 'duracao'
      DataSource = Form15.DataSource1
      TabOrder = 1
    end
    object DBEdit3: TDBEdit
      Left = 64
      Top = 303
      Width = 154
      Height = 23
      DataField = 'preco'
      DataSource = Form15.DataSource1
      TabOrder = 3
    end
    object DBEdit1: TDBEdit
      Left = 64
      Top = 197
      Width = 154
      Height = 23
      DataField = 'nome_serv'
      DataSource = Form15.DataSource1
      TabOrder = 0
      OnKeyPress = DBEdit1KeyPress
    end
  end
end
