unit CadEmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls;

type
  TForm19 = class(TForm)
    Fundo: TImage;
    Image1: TImage;
    BS: TImage;
    EdBairro: TEdit;
    EdCEP: TEdit;
    EdCidad: TEdit;
    EdEstad: TEdit;
    EdEmail: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    EdNome: TEdit;
    EdRua: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    LbUser: TLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    BtnCad: TPanel;
    PnlLupa: TPanel;
    Image2: TImage;
    procedure FormCreate(Sender: TObject);
    procedure Image2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form19: TForm19;

implementation

{$R *.dfm}

uses UDataCEP;

procedure TForm19.FormCreate(Sender: TObject);
begin
WindowState:=wsMaximized;
end;

procedure TForm19.Image2Click(Sender: TObject);
begin
  DataModule2.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DataModule2.RESTRequest1.Execute;
  EdRua.Text := DataModule2.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DataModule2.FDMemTable1.FieldByName('bairro').AsString;
  EdCidad.Text := DataModule2.FDMemTable1.FieldByName('localidade').AsString;
  EdEstad.Text := DataModule2.FDMemTable1.FieldByName('estado').AsString;
end;

end.
