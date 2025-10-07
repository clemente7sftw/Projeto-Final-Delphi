object Form13: TForm13
  Left = 0
  Top = 0
  Caption = 'Form13'
  ClientHeight = 656
  ClientWidth = 768
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 768
    Height = 656
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    object Label1: TLabel
      Left = 264
      Top = 16
      Width = 54
      Height = 15
      Caption = 'nome_clie'
    end
    object Label2: TLabel
      Left = 264
      Top = 66
      Width = 52
      Height = 15
      Caption = 'email_clie'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 264
      Top = 464
      Width = 30
      Height = 15
      Caption = 'preco'
      FocusControl = DBEdit3
    end
    object Lblrequired: TLabel
      Left = 520
      Top = 401
      Width = 145
      Height = 15
      Caption = 'Preencha todos os campos!'
      Color = clDarkred
      ParentColor = False
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 72
      Width = 225
      Height = 169
      DataSource = DataSource1
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'nome_clie'
          Width = 97
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'email_clie'
          Width = 104
          Visible = True
        end>
    end
    object DBEdit2: TDBEdit
      Left = 264
      Top = 87
      Width = 200
      Height = 23
      DataField = 'email_clie'
      DataSource = DataSource1
      TabOrder = 1
    end
    object Panel2: TPanel
      Left = 264
      Top = 532
      Width = 97
      Height = 41
      Caption = 'Marcar Hor'#225'rio'
      TabOrder = 2
      OnClick = Panel2Click
    end
    object CheckListBoxServicos: TCheckListBox
      Left = 264
      Top = 128
      Width = 200
      Height = 153
      ItemHeight = 17
      TabOrder = 3
      OnClickCheck = CheckListBoxServicosClickCheck
    end
    object MonthCalendar1: TMonthCalendar
      Left = 16
      Top = 247
      Width = 225
      Height = 169
      Date = 45936.000000000000000000
      TabOrder = 4
    end
    object ComboBoxHorarios: TComboBox
      Left = 16
      Top = 422
      Width = 225
      Height = 23
      TabOrder = 5
      Text = 'Selecione o Hor'#225'rio'
      TextHint = 'Selecione o Hor'#225'rio'
    end
    object DBEdit3: TDBEdit
      Left = 264
      Top = 485
      Width = 169
      Height = 23
      DataField = 'preco'
      DataSource = DataSource3
      TabOrder = 6
    end
    object CheckListBoxProfissionais: TCheckListBox
      Left = 264
      Top = 304
      Width = 200
      Height = 141
      ItemHeight = 17
      TabOrder = 7
    end
    object DBEdit1: TDBEdit
      Left = 264
      Top = 37
      Width = 200
      Height = 23
      DataField = 'nome_clie'
      DataSource = DataSource1
      TabOrder = 8
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryClientes
    Left = 40
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.QueryServicos
    Left = 120
    Top = 16
  end
  object DataSource3: TDataSource
    DataSet = DataModule1.QueryAgendamentos
    Left = 512
    Top = 24
  end
end
