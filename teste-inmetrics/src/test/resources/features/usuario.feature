Feature: Manter usuários - Empregado Controller

	@regressivo
  Scenario: 001 POST - Cadastrar empregado com sucesso
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "202"
    And A API deve retonar os dados do empregado
  
  @smoke @regressivo
  Scenario: 002 GET - Listar empregado cadastrado
  	Given Que eu possuo o id do empregado "6045"
    When Eu executar um get no endpoint "empregado/list/"
    Then A API deve retornar status code "202"
  
  @smoke @regressivo
  Scenario: 003 GET - Listar empregado não cadastrado
    Given Que eu possuo o id do empregado "0000"
    When Eu executar um get no endpoint "empregado/list/"
    Then A API deve retornar status code "400"
    And A mensagem "Empregado não cadastrado"
  
  @smoke @regressivo
  Scenario: 004 GET - Listar todos os empregados
    When Eu executar um get no endpoint empregado list_all "empregado/list_all"
    Then A API deve retornar status code "200"
  
  @regressivo  
  Scenario: 005 PUT - Alterar cadastro do empregado
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API Alterado" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "202"
    And A API deve retonar os dados do empregado
  
  @regressivo  
  Scenario: 006 POST - Cadastrar empregado sem informar dados
    Given Que eu informo os dados do empregado nome "" cargo "" comissão "" data de admissão "" CPF "" id do departamento "" salário "" sexo "" tipo de contratacao ""
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "admissao: must not be blank"
  
  @regressivo  
  Scenario: 007 POST - Cadastrar empregado informar data de admissão fora do padrão 15/01/2020
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15012020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "admissao: deve estar no padrão 31/12/2020"
  
  @regressivo  
  Scenario: 008 POST - Cadastrar empregado informar comissão fora do padrão 1.000,00
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "comissao: deve estar no padrão 1.000,00"
  
  @regressivo  
  Scenario: 009 POST - Cadastrar empregado informar tipo contratacao fora do padrão: pj ou clt
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "outro"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "tipoContratacao: pj ou clt"
  
  @regressivo  
  Scenario: 010 POST - Cadastrar empregado informar salario fora do padrão 1.000,00
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3500,00" sexo "f" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "salario: deve estar no padrão 1.000,00"
  
  @regressivo  
  Scenario: 011 POST - Cadastrar empregado informar cpf fora do padrão 111.222.333-00
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "03187667015" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "cpf: deve estar no padrão 111.222.333-00"
  
  @regressivo  
  Scenario: 012 POST - Cadastrar empregado informar sexo fora do padrão m, f ou i
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "o" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "sexo: m, f ou i"
    
  @regressivo
  Scenario: 013 POST - Cadastrar empregado informar departamento não cadastrado
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "10" salário "3.500,00" sexo "i" tipo de contratacao "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem "Departamento não cadastrado"
    
  @regressivo
  Scenario: 014 PUT - Alterar cadastro do empregado informar departamento não cadastrado
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API Alterado" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "10" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem "Departamento não cadastrado"
    
  @regressivo  
  Scenario: 015 PUT - Alterar cadastro do empregado sem informar dados
    Given Que eu informo os dados do empregado nome "" cargo "" comissão "" data de admissão "" CPF "" id do departamento "" salário "" sexo "" tipo de contratacao ""
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "admissao: must not be blank"
    
  @regressivo  
  Scenario: 016 PUT - Alterar cadastro do empregado informar data de admissão fora do padrão 15/01/2020
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15012020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "admissao: deve estar no padrão 31/12/2020"
  
  @regressivo  
  Scenario: 017 PUT - Alterar cadastro do empregado informar comissão fora do padrão 1.000,00
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "comissao: deve estar no padrão 1.000,00"
  
  @regressivo  
  Scenario: 018 PUT - Alterar cadastro do empregado informar tipo contratacao fora do padrão: pj ou clt
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "outro"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "tipoContratacao: pj ou clt"
  
  @regressivo  
  Scenario: 019 PUT - Alterar cadastro do empregado informar salario fora do padrão 1.000,00
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3500,00" sexo "f" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "salario: deve estar no padrão 1.000,00"
  
  @regressivo  
  Scenario: 020 PUT - Alterar cadastro do empregado informar cpf fora do padrão 111.222.333-00
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "03187667015" id do departamento "1" salário "3.500,00" sexo "f" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "cpf: deve estar no padrão 111.222.333-00"
  
  @regressivo  
  Scenario: 021 PUT - Alterar cadastro do empregado informar sexo fora do padrão m, f ou i
    Given Que eu informo os dados do empregado nome "Desafio Inmetrics API" cargo "Analista" comissão "1.000,00" data de admissão "15/01/2020" CPF "031.876.670-15" id do departamento "1" salário "3.500,00" sexo "o" tipo de contratacao "clt"
    And Que eu possuo o id do empregado "6045"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "400"
    And A mensagem de erro "sexo: m, f ou i"