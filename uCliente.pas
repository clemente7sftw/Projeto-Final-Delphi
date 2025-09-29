unit uCliente;

interface
Type
TCliente = class(TRepository)
  protected
    Nome:String;
    Email:String;
    CPF:Integer;
    Telefone:integer;
    Genero:string;
    Rua:string;
    Bairro:string;
    Cidade:string;
    Estado:string;
    function getNome: string;
    procedure setNome(aNome: string);
    function getEmail: string;
    procedure setEmail(aEmail: string);
    function getCPF: integer;
    procedure setCPF(aCPF: integer);
    function getTelefone: integer;
    procedure setTelefone(aTelefone: integer);
    function getGenero: string;
    procedure setGenero(aGenero: string);
    function getRua: string;
    procedure setRua(aRua: string);
    function getBairro: string;
    procedure setBairro(aBairro: string);
    function getCidade: string;
    procedure setCidade(aCidade: string);
    function getEstado: string;
    procedure setEstado(aEstado: string);

  public
    procedure Criar; virtual;
    procedure Listar; virtual;
    procedure Atualizar; virtual;
    procedure Excluir; virtual;
end;
implementation

{ TCliente }

uses AdicionarCliente, CadClie, uRepository;

procedure TCliente.Atualizar;
begin

end;

procedure TCliente.Criar;
begin
  FDQuery.SQL.Text := 'INSERT INTO clientes (nome, email) VALUES (:nome, :email)';
//  FDQuery.ParamByName('nome').AsString := ACliente.Nome;
//  FDQuery.ParamByName('email').AsString := ACliente.Email;
  FDQuery.ExecSQL;
end;

procedure TCliente.Excluir;
begin

end;

function TCliente.getBairro: string;
begin
    Result:=Self.Bairro;
end;

function TCliente.getCidade: string;
begin
   Result:=self.Cidade;
end;

function TCliente.getCPF: integer;
begin
   Result:=self.CPF;
end;

function TCliente.getEmail: string;
begin
   Result:=self.Email;
end;

function TCliente.getEstado: string;
begin
  Result:=self.Estado;
end;

function TCliente.getGenero: string;
begin
   Result:=self.Genero;
end;

function TCliente.getNome: string;
begin
   Result:=self.Nome;
end;

function TCliente.getRua: string;
begin
  Result:=self.Rua;
end;

function TCliente.getTelefone: integer;
begin
   Result:=self.Telefone;
end;

procedure TCliente.Listar;
begin

end;

procedure TCliente.setBairro(aBairro: string);
begin
   Self.Bairro:=aBairro;
end;

procedure TCliente.setCidade(aCidade: string);
begin
    Self.Bairro:=aCidade;
end;

procedure TCliente.setCPF(aCPF: integer);
begin
    Self.Bairro:=aCPF;
end;

procedure TCliente.setEmail(aEmail: string);
begin
   Self.Bairro:=aEmail;
end;

procedure TCliente.setEstado(aEstado: string);
begin
   Self.Bairro:=aEstado;
end;

procedure TCliente.setGenero(aGenero: string);
begin
   Self.Bairro:=aGenero;
end;

procedure TCliente.setNome(aNome: string);
begin
  Self.Bairro:=aNome;
end;

procedure TCliente.setRua(aRua: string);
begin
   Self.Bairro:=aRua;
end;

procedure TCliente.setTelefone(aTelefone: integer);
begin
    Self.Bairro:=aTelefone;
end;

end.
