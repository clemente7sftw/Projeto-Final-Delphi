program ProjectFinal;

uses
  Vcl.Forms,
  Login in 'Login.pas' {Form1},
  Cadastro in 'Cadastro.pas' {Form2},
  UMetodos in 'UMetodos.pas',
  TelaPrincipalN1 in 'TelaPrincipalN1.pas' {Form3},
  CClientes in 'CClientes.pas' {Form4},
  AdicionarCliente in 'AdicionarCliente.pas' {Form5},
  AdicionarFornecedor in 'AdicionarFornecedor.pas' {Form6},
  CFornecedores in 'CFornecedores.pas' {Form7};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.Run;
end.
