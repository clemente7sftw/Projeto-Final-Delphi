unit CadClie;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.Mask, Data.DB, Vcl.DBCtrls, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TForm18 = class(TForm)
    Fundo: TImage;
    Image1: TImage;
    BS: TImage;
    Label2: TLabel;
    Label1: TLabel;
    LbUser: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    BtnCad: TPanel;
    ComboBox1: TComboBox;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    PnlLupa: TPanel;
    Image2: TImage;
    EdSenha: TEdit;
    EdEmail: TEdit;
    Edit2: TEdit;
    Edit3: TEdit;
    EdCEP: TEdit;
    EdRua: TEdit;
    EdBairro: TEdit;
    EdCidad: TEdit;
    EdEstad: TEdit;
    procedure FormCreate(Sender: TObject);

    procedure Image2Click(Sender: TObject);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form18: TForm18;

implementation

{$R *.dfm}

uses UDataCEP, Cadastro, UDataModule;



procedure TForm18.FormCreate(Sender: TObject);
begin
 WindowState := wsMaximized;

end;


procedure TForm18.Image2Click(Sender: TObject);
begin
  DataModule2.RESTClient1.BaseURL := 'https://viacep.com.br/ws/'+ EdCEP.Text+'/json/';
  DataModule2.RESTRequest1.Execute;
  ///ShowMessage (DataModule2.RESTResponse1.Content);
  EdRua.Text := DataModule2.FDMemTable1.FieldByName('logradouro').AsString;
  EdBairro.Text := DataModule2.FDMemTable1.FieldByName('bairro').AsString;
  EdCidad.Text := DataModule2.FDMemTable1.FieldByName('localidade').AsString;
  EdEstad.Text := DataModule2.FDMemTable1.FieldByName('estado').AsString;
end;


end.
