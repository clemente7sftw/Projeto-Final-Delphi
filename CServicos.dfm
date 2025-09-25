object Form15: TForm15
  Left = 0
  Top = 0
  Caption = 'Servi'#231'os'
  ClientHeight = 556
  ClientWidth = 789
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
    Width = 789
    Height = 556
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 878
    ExplicitHeight = 560
    object Label1: TLabel
      Left = 379
      Top = 267
      Width = 30
      Height = 15
      Caption = 'preco'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 379
      Top = 201
      Width = 43
      Height = 15
      Caption = 'duracao'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 379
      Top = 140
      Width = 31
      Height = 15
      Caption = 'nome'
      FocusControl = DBEdit3
    end
    object PbtnAdd: TPanel
      Left = 24
      Top = 112
      Width = 185
      Height = 41
      Caption = 'Adicionar'
      TabOrder = 0
      OnClick = PbtnAddClick
    end
    object DBGServicos: TDBGrid
      Left = 24
      Top = 201
      Width = 289
      Height = 272
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 1
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome'
          Width = 141
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'preco'
          Width = 147
          Visible = True
        end>
    end
    object BtnEditar: TPanel
      Left = 368
      Top = 63
      Width = 89
      Height = 41
      Caption = 'BtnEditar'
      TabOrder = 2
      OnClick = BtnEditarClick
    end
    object BtnExcluir: TPanel
      Left = 632
      Top = 63
      Width = 89
      Height = 41
      Caption = 'BtnExcluir'
      TabOrder = 3
      OnClick = BtnExcluirClick
    end
    object BtnConf: TPanel
      Left = 504
      Top = 63
      Width = 89
      Height = 41
      Caption = 'BtnConf'
      TabOrder = 4
      OnClick = BtnConfClick
    end
    object DBEdit1: TDBEdit
      Left = 379
      Top = 288
      Width = 134
      Height = 23
      DataField = 'preco'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 5
    end
    object DBEdit2: TDBEdit
      Left = 379
      Top = 222
      Width = 134
      Height = 23
      DataField = 'duracao'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 6
    end
    object DBEdit3: TDBEdit
      Left = 379
      Top = 161
      Width = 134
      Height = 23
      DataField = 'nome'
      DataSource = DataSource1
      Enabled = False
      TabOrder = 7
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryServicos
    Left = 48
    Top = 48
  end
end
