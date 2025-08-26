unit Login;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Imaging.pngimage,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    FotoLogin: TImage;
    LadoEsquerdo: TPanel;
    Image1: TImage;
    EdEmail: TEdit;
    EdSenha: TEdit;
    LbEmail: TLabel;
    LbSenha: TLabel;
    procedure EdEmailKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);


  private
    { Private declarations }
  public

  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}




procedure TForm1.EdEmailKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key = VK_RETURN then
   perform(WM_NEXTDLGCTL,0,0);
end;

end.
