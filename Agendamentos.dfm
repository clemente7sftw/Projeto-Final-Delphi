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
    ExplicitLeft = -8
    ExplicitTop = 8
    ExplicitWidth = 678
    ExplicitHeight = 890
    object Label1: TLabel
      Left = 368
      Top = 48
      Width = 54
      Height = 15
      Caption = 'nome_clie'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 368
      Top = 112
      Width = 52
      Height = 15
      Caption = 'email_clie'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 368
      Top = 506
      Width = 30
      Height = 15
      Caption = 'preco'
      FocusControl = DBEdit3
    end
    object DBGrid1: TDBGrid
      Left = 16
      Top = 72
      Width = 225
      Height = 193
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
    object DBEdit1: TDBEdit
      Left = 368
      Top = 64
      Width = 200
      Height = 23
      DataField = 'nome_clie'
      DataSource = DataSource1
      TabOrder = 1
    end
    object DBEdit2: TDBEdit
      Left = 368
      Top = 128
      Width = 200
      Height = 23
      DataField = 'email_clie'
      DataSource = DataSource1
      TabOrder = 2
    end
    object CheckListBox1: TCheckListBox
      Left = 368
      Top = 176
      Width = 200
      Height = 169
      ItemHeight = 17
      TabOrder = 3
      OnClickCheck = CheckListBox1ClickCheck
    end
    object MonthCalendar1: TMonthCalendar
      Left = 16
      Top = 303
      Width = 225
      Height = 170
      Date = 45931.000000000000000000
      TabOrder = 4
    end
    object CheckListBox2: TCheckListBox
      Left = 16
      Top = 479
      Width = 225
      Height = 81
      ItemHeight = 17
      TabOrder = 5
    end
    object DBEdit3: TDBEdit
      Left = 368
      Top = 537
      Width = 200
      Height = 23
      DataField = 'preco'
      DataSource = DataSource2
      TabOrder = 6
    end
    object CheckListBox3: TCheckListBox
      Left = 368
      Top = 376
      Width = 200
      Height = 113
      ItemHeight = 17
      TabOrder = 7
    end
    object Panel2: TPanel
      Left = 368
      Top = 584
      Width = 97
      Height = 41
      Caption = 'Marcar Hor'#225'rio'
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
    Left = 104
    Top = 16
  end
end
