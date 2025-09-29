unit uRepository;

interface
type TRepository = class (TObject)
protected

public
    procedure Criar; virtual;
    procedure Listar; virtual;
    procedure Atualizar; virtual;
    procedure Excluir; virtual;

end;
implementation


{ TRepository }

procedure TRepository.Atualizar;
begin

end;

procedure TRepository.Criar;
begin

end;

procedure TRepository.Excluir;
begin

end;

procedure TRepository.Listar;
begin

end;

end.
