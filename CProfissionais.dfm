object Form8: TForm8
  Left = 0
  Top = 0
  Caption = 'Profissionais'
  ClientHeight = 545
  ClientWidth = 872
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
    Width = 872
    Height = 545
    Align = alClient
    Color = clWhite
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 820
    ExplicitHeight = 535
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
      Width = 870
      Height = 543
      Align = alClient
      Color = clWhite
      ParentBackground = False
      TabOrder = 1
      ExplicitWidth = 818
      ExplicitHeight = 533
      object Image1: TImage
        Left = 24
        Top = 472
        Width = 33
        Height = 41
        Picture.Data = {
          0D54536B537667477261706869633C73766720786D6C6E733D22687474703A2F
          2F7777772E77332E6F72672F323030302F737667222076696577426F783D2230
          20302036343020363430223E3C212D2D21466F6E7420417765736F6D65204672
          656520372E302E302062792040666F6E74617765736F6D65202D206874747073
          3A2F2F666F6E74617765736F6D652E636F6D204C6963656E7365202D20687474
          70733A2F2F666F6E74617765736F6D652E636F6D2F6C6963656E73652F667265
          6520436F70797269676874203230323520466F6E7469636F6E732C20496E632E
          2D2D3E3C7061746820643D224D37332E34203239372E344336302E3920333039
          2E392036302E39203333302E322037332E34203334322E374C3233332E342035
          30322E37433234352E39203531352E32203236362E32203531352E3220323738
          2E37203530322E37433239312E32203439302E32203239312E32203436392E39
          203237382E37203435372E344C3137332E33203335324C353434203335324335
          36312E372033353220353736203333372E372035373620333230433537362033
          30322E33203536312E372032383820353434203238384C3137332E3320323838
          4C3237382E37203138322E36433239312E32203137302E31203239312E322031
          34392E38203237382E37203133372E33433236362E32203132342E3820323435
          2E39203132342E38203233332E34203133372E334C37332E34203239372E337A
          222F3E3C2F7376673E}
        Stretch = True
        OnClick = Image1Click
      end
      object Label1: TLabel
        Left = 344
        Top = 339
        Width = 29
        Height = 15
        Caption = 'email'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 342
        Top = 241
        Width = 31
        Height = 15
        Caption = 'nome'
        FocusControl = DBEdit2
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
      object BtnEditar: TPanel
        Left = 688
        Top = 199
        Width = 89
        Height = 41
        Caption = 'BtnEditar'
        TabOrder = 1
      end
      object BtnExcluir: TPanel
        Left = 688
        Top = 296
        Width = 89
        Height = 41
        Caption = 'BtnExcluir'
        TabOrder = 2
        OnClick = BtnExcluirClick
      end
      object BtnConf: TPanel
        Left = 688
        Top = 199
        Width = 89
        Height = 41
        Caption = 'BtnConf'
        TabOrder = 3
        OnClick = BtnConfClick
      end
      object DBGrid1: TDBGrid
        Left = 24
        Top = 199
        Width = 241
        Height = 194
        DataSource = DataSource1
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
        TabOrder = 4
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -12
        TitleFont.Name = 'Segoe UI'
        TitleFont.Style = []
        Columns = <
          item
            Expanded = False
            FieldName = 'nome'
            Width = 113
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'email'
            Visible = True
          end>
      end
      object DBEdit1: TDBEdit
        Left = 346
        Top = 368
        Width = 200
        Height = 23
        DataField = 'email'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 5
      end
      object DBEdit2: TDBEdit
        Left = 344
        Top = 274
        Width = 200
        Height = 23
        DataField = 'nome'
        DataSource = DataSource1
        Enabled = False
        TabOrder = 6
      end
      object Panel2: TPanel
        Left = 688
        Top = 120
        Width = 89
        Height = 41
        Caption = 'BtnEditar'
        TabOrder = 7
        OnClick = Panel2Click
      end
    end
  end
  object DataSource1: TDataSource
    DataSet = DataModule1.QueryProfissionais
    Left = 401
    Top = 57
  end
end
