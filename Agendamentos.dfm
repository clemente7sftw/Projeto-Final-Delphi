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
    object Panel2: TPanel
      Left = 368
      Top = 584
      Width = 97
      Height = 41
      Caption = 'Marcar Hor'#225'rio'
      TabOrder = 3
    end
    object CheckListBoxServicos: TCheckListBox
      Left = 368
      Top = 176
      Width = 200
      Height = 153
      ItemHeight = 17
      TabOrder = 4
    end
    object TimePicker1: TTimePicker
      Left = 16
      Top = 264
      Height = 25
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = []
      TabOrder = 5
      Time = 45936.610579814810000000
      TimeFormat = 'hh:nn'
    end
    object CheckListBoxProfissionais: TCheckListBox
      Left = 368
      Top = 352
      Width = 200
      Height = 153
      ItemHeight = 17
      TabOrder = 6
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryClientes
    Left = 40
    Top = 16
  end
  object DataSource2: TDataSource
    DataSet = DataModule1.QueryServicos
    Left = 112
    Top = 16
  end
end
