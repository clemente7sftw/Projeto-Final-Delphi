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
  CFornecedores in 'CFornecedores.pas' {Form7},
  CProfissionais in 'CProfissionais.pas' {Form8},
  AdicionarProfissional in 'AdicionarProfissional.pas' {Form9},
  AdicionarServico in 'AdicionarServico.pas' {Form10},
  AdicionarCargo in 'AdicionarCargo.pas' {Form11},
  AdicionarPP in 'AdicionarPP.pas' {Form12},
  AdicionarHorario in 'AdicionarHorario.pas' {Form13},
  CCargos in 'CCargos.pas' {Form14},
  CServicos in 'CServicos.pas' {Form15},
  CPacotesPromocionais in 'CPacotesPromocionais.pas' {Form16},
  CHorarios in 'CHorarios.pas' {Form17},
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  CadClie in 'CadClie.pas' {Form18},
  UDataCEP in 'UDataCEP.pas' {DataModule2: TDataModule},
  CadEmp in 'CadEmp.pas' {Form19},
  TelaInicialN3 in 'TelaInicialN3.pas' {Form20};

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
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.Run;
end.
