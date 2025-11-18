program ProjectFinal;

uses
  Vcl.Forms,
  Login in 'Login.pas' {Form1},
  Cadastro in 'Cadastro.pas' {Form2},
  TelaPrincipalN1 in 'TelaPrincipalN1.pas' {Form3},
  CClientes in 'CClientes.pas' {Form4},
  CProfissionais in 'CProfissionais.pas' {Form8},
  AdicionarProfissional in 'AdicionarProfissional.pas' {Form9},
  AdicionarCargo in 'AdicionarCargo.pas' {Form11},
  CCargos in 'CCargos.pas' {Form14},
  CServicos in 'CServicos.pas' {Form15},
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
  n2_cagendamentos in 'n2_cagendamentos.pas' {Form32},
  n2_profissionais in 'n2_profissionais.pas' {Form31},
  n2_addprofissionais in 'n2_addprofissionais.pas' {Form33},
  n2_agendamentos in 'n2_agendamentos.pas' {Form34};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm11, Form11);
  Application.CreateForm(TForm14, Form14);
  Application.CreateForm(TForm15, Form15);
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
  Application.CreateForm(TForm32, Form32);
  Application.CreateForm(TForm31, Form31);
  Application.CreateForm(TForm33, Form33);
  Application.CreateForm(TForm34, Form34);
  Application.Run;
end.
