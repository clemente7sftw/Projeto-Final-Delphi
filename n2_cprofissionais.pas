unit n2_cprofissionais;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.WinXPickers, Vcl.StdCtrls,
  Vcl.CheckLst, Vcl.Mask, Vcl.ExtCtrls, Vcl.DBCtrls, Vcl.Grids, Vcl.DBGrids,
  Vcl.Skia, Vcl.Imaging.pngimage;

type
  TForm31 = class(TForm)
    Fundo: TPanel;
    Panel1: TPanel;
    Label1: TLabel;
    LbPro: TLabel;
    addclie: TImage;
    EditBtn: TImage;
    ExclBtn: TImage;
    btncancelar: TImage;
    Image1: TImage;
    Lblrequired: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    DBGrid1: TDBGrid;
    DBEdit1: TDBEdit;
    DBEdit2: TDBEdit;
    DBEdit3: TDBEdit;
    EdPesquisa: TEdit;
    Panel3: TPanel;
    Image2: TImage;
<<<<<<< HEAD
    BtnConf: TPanel;
=======
>>>>>>> bbd71fb778a951ea49fe7c54d1664dfbd10466a0
    CLBCargos: TCheckListBox;
    CLBDias: TCheckListBox;
    TimePicker1: TTimePicker;
    TimePicker2: TTimePicker;
<<<<<<< HEAD
=======
    Image4: TImage;
    BS: TImage;
>>>>>>> bbd71fb778a951ea49fe7c54d1664dfbd10466a0
    Barra: TPanel;
    LbClie: TLabel;
    LbProfissionais: TLabel;
    Lbagendamentos: TLabel;
<<<<<<< HEAD
    Image4: TImage;
    BS: TImage;
=======
    BtnCad: TPanel;
>>>>>>> bbd71fb778a951ea49fe7c54d1664dfbd10466a0
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form31: TForm31;

implementation

{$R *.dfm}

end.
