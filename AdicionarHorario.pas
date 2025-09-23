unit AdicionarHorario;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Imaging.pngimage,
  Vcl.ExtCtrls, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TForm13 = class(TForm)
    Fundo: TPanel;
    DataSource1: TDataSource;
    BtnCad: TPanel;
    BtnVoltar: TPanel;
    DBComboBox1: TDBComboBox;
    DataSource2: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure BtnVoltarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form13: TForm13;

implementation

{$R *.dfm}

uses UDataModule, TelaPrincipalN1;

procedure TForm13.BtnVoltarClick(Sender: TObject);
begin
  Form3.show;
end;


procedure TForm13.FormCreate(Sender: TObject);
begin
  Form13.WindowState:=wsMaximized;
end;

procedure TForm13.FormShow(Sender: TObject);
begin
  datamodule1.FDQueryServicos.close;
  datamodule1.FDQueryServicos.Open;
  datamodule1.FDQueryServicos.First;
  while not datamodule1.FDQueryServicos.EOF do
begin
  DBComboBox1.Items.Add(datamodule1.FDQueryServicos.FieldByName('nome').AsString);
  datamodule1.FDQueryServicos.Next;
end;
end;

end.
