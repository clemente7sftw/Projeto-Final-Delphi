unit AdicionarServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls,  Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, Data.DB, Vcl.Mask, Vcl.DBCtrls;

type
  TForm10 = class(TForm)
    Fundo: TPanel;
    PVoltar: TPanel;
    PCad: TPanel;
    Lblrequired: TLabel;
    Label4: TLabel;
    DBEdit2: TDBEdit;
    Label5: TLabel;
    DBEdit3: TDBEdit;
    Label1: TLabel;
    DBEdit1: TDBEdit;
    procedure FormCreate(Sender: TObject);
    procedure PCadClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PVoltarClick(Sender: TObject);
    procedure DBEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure Salvar;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form10: TForm10;

implementation

{$R *.dfm}
uses UMetodos, CServicos, UDataModule;


procedure TForm10.DBEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    SelectNext(Sender as TWinControl, True, True);
  end;
end;

procedure TForm10.FormCreate(Sender: TObject);
begin
  WindowState:=wsMaximized;
  Lblrequired.Visible:= false;

end;


procedure TForm10.FormShow(Sender: TObject);
begin
  datamodule1.QueryServicos.Append;
end;

procedure TForm10.PCadClick(Sender: TObject);
begin
  Salvar;
end;

procedure TForm10.PVoltarClick(Sender: TObject);
begin
  Form10.Close;
  Form15.Show;
end;

procedure TForm10.Salvar;
begin
  if (DBEdit1.Text <> '') and (DBEdit2.Text <> '') and (DBEdit3.Text <> '') then
     begin

      with DataModule1.QueryServicos do
      begin
        datamodule1.QueryServicos.Post;
          Form15.show;
          Form10.Close;
      end;
    end else begin
      Lblrequired.Visible:= true;

    end;
end;

end.
