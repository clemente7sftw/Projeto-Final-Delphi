unit n2_cagendamentos;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.CheckLst,
  Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Skia, Vcl.Imaging.pngimage;

type
  TForm32 = class(TForm)
    Fundo: TPanel;
    ExclBtn: TImage;
    EditBtn: TImage;
    btncancelar: TImage;
    Label3: TLabel;
    Label4: TLabel;
    addbtn: TImage;
    Image1: TImage;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    calendario: TMonthCalendar;
    CLBServicos: TCheckListBox;
    ComboBoxHorarios: TComboBox;
    EdPesquisa: TEdit;
    Panel1: TPanel;
    Image2: TImage;
    BtnConf: TPanel;
    Image4: TImage;
    BS: TImage;
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    Lbagendamentos: TLabel;
    LbPro: TLabel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form32: TForm32;

implementation

{$R *.dfm}

end.
