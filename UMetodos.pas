unit UMetodos;



interface
uses  Winapi.Windows, Vcl.ExtCtrls, System.Classes, Cadastro, Vcl.Forms, Vcl.Controls;

type
TMetodos = class
  Menu : TPanel;
  private
  public
  procedure MostrarMenu;
  procedure TirarMenu;


end;

implementation





{ TMetodos }



procedure TMetodos.MostrarMenu;
begin
    Menu.Visible := True;
end;

procedure TMetodos.TirarMenu;
begin

end;

end.
