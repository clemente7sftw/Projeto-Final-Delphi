program ProjectFinal;

uses
  Vcl.Forms,
  Login in 'Login.pas' {Form1},
  Cadastro in 'Cadastro.pas' {Form2},
  TelaPrincipalN1 in 'TelaPrincipalN1.pas' {Form3},
  CClientes in 'CClientes.pas' {Form4},
  AdicionarFornecedor in 'AdicionarFornecedor.pas' {Form6},
  CFornecedores in 'CFornecedores.pas' {Form7},
  CProfissionais in 'CProfissionais.pas' {Form8},
  AdicionarProfissional in 'AdicionarProfissional.pas' {Form9},
  AdicionarServico in 'AdicionarServico.pas' {Form10},
  AdicionarCargo in 'AdicionarCargo.pas' {Form11},
  AdicionarPP in 'AdicionarPP.pas' {Form12},
  CCargos in 'CCargos.pas' {Form14},
  CServicos in 'CServicos.pas' {Form15},
  CPacotesPromocionais in 'CPacotesPromocionais.pas' {Form16},
  CHorarios in 'CHorarios.pas' {Form17},
  UDataModule in 'UDataModule.pas' {DataModule1: TDataModule},
  CadClie in 'CadClie.pas' {Form18},
  UDMCEP in 'UDMCEP.pas' {DMCep: TDataModule},
  CadEmp in 'CadEmp.pas' {Form19},
  TelaInicialN3 in 'TelaInicialN3.pas' {Form20},
  Agendamentos in 'Agendamentos.pas' {Form13},
  CAgendamentos in 'CAgendamentos.pas' {Form21},
  TelaInicialN2 in 'TelaInicialN2.pas' {Form5},
  CAdministrador in 'CAdministrador.pas' {Form22},
  CadAdm in 'CadAdm.pas' {Form23},
  N1MudarSenha in 'N1MudarSenha.pas' {Form24},
  relatorios_servicos in 'relatorios_servicos.pas' {Form25},
  n1_agendamentos in 'n1_agendamentos.pas' {Form26},
  relatorios_profissionais in 'relatorios_profissionais.pas' {Form27},
  relatorio_clientes in 'relatorio_clientes.pas' {Form28},
  n2_cclientes in 'n2_cclientes.pas' {Form29},
  UMetodos in 'UMetodos.pas',
  n4_tela_inicial in 'n4_tela_inicial.pas' {Form30},
  n2_cprofissionais in 'n2_cprofissionais.pas' {Form31};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm12, Form12);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
  Application.CreateForm(TForm16, Form16);
  Application.CreateForm(TForm17, Form17);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TForm18, Form18);
  Application.CreateForm(TDMCep, DMCep);
  Application.CreateForm(TForm19, Form19);
  Application.CreateForm(TForm20, Form20);
  Application.CreateForm(TForm13, Form13);
  Application.CreateForm(TForm21, Form21);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm22, Form22);
  Application.CreateForm(TForm23, Form23);
  Application.CreateForm(TForm24, Form24);
  Application.CreateForm(TForm25, Form25);
  Application.CreateForm(TForm26, Form26);
  Application.CreateForm(TForm27, Form27);
  Application.CreateForm(TForm28, Form28);
  Application.CreateForm(TForm29, Form29);
  Application.CreateForm(TForm30, Form30);
  Application.CreateForm(TForm31, Form31);
  Application.Run;
end.
