object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Profissionais'
  ClientHeight = 515
  ClientWidth = 822
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
    Width = 822
    Height = 515
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitLeft = 104
    ExplicitTop = 128
    ExplicitWidth = 185
    ExplicitHeight = 41
    object BtnAddFoto: TPanel
      Left = 472
      Top = 216
      Width = 81
      Height = 41
      Caption = 'BtnAddFoto'
      TabOrder = 0
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 820
      Height = 513
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 681
      ExplicitHeight = 630
      object Label1: TLabel
        Left = 408
        Top = 188
        Width = 31
        Height = 15
        Caption = 'nome'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 408
        Top = 322
        Width = 30
        Height = 15
        Caption = 'preco'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 408
        Top = 258
        Width = 43
        Height = 15
        Caption = 'duracao'
        FocusControl = DBEdit3
      end
      object PbtnAdd: TPanel
        Left = 48
        Top = 88
        Width = 185
        Height = 41
        Caption = 'Adicionar'
        TabOrder = 0
        OnClick = PbtnAddClick
      end
      object DBGServicos: TDBGrid
        Left = 48
        Top = 216
        Width = 289
        Height = 217
        DataSource = Form10.DataSource1
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
            Width = 100
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'preco'
            Width = 167
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 408
        Top = 209
        Width = 200
        Height = 23
        DataField = 'nome'
        DataSource = Form10.DataSource1
        Enabled = False
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 408
        Top = 351
        Width = 169
        Height = 23
        DataField = 'preco'
        DataSource = Form10.DataSource1
        Enabled = False
        TabOrder = 3
      end
      object DBEdit3: TDBEdit
        Left = 408
        Top = 279
        Width = 154
        Height = 23
        DataField = 'duracao'
        DataSource = Form10.DataSource1
        Enabled = False
        TabOrder = 4
      end
      object BtnEditar: TPanel
        Left = 688
        Top = 199
        Width = 89
        Height = 41
        Caption = 'BtnEditar'
        TabOrder = 5
      end
      object BtnExcluir: TPanel
        Left = 688
        Top = 296
        Width = 89
        Height = 41
        Caption = 'BtnExcluir'
        TabOrder = 6
      end
      object BtnConf: TPanel
        Left = 688
        Top = 199
        Width = 89
        Height = 41
        Caption = 'BtnConf'
        TabOrder = 7
      end
    end
  end
end
