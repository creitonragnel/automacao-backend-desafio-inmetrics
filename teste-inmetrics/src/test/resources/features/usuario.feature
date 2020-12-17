Feature: Manter usuários - Empregado Controller

  Scenario: 001 POST - Cadastrar empregado com sucesso
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1.000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3.500,00"
    And Eu informe o sexo do empregado "m"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "202"
    And A API deve retonar os dados do empregado
    
  Scenario: 002 GET - Listar empregado cadastrado
    When Eu executar um get no endpoint "empregado/list/"
    Then A API deve retornar status code "202"
    
  Scenario: 003 GET - Listar empregado não cadastrado
    Given Que eu possuo o id do empregado e desejo consultar seus dados
    When Eu executar um get no endpoint "empregado/list/"
    Then A API deve retornar status code "400"
    And A mensagem "Empregado não cadastrado"
  
  Scenario: 004 GET - Listar todos os empregados
    When Eu executar um get no endpoint empregado list_all "empregado/list_all"
    Then A API deve retornar status code "200"
    
  Scenario: 005 PUT - Alterar cadastro do empregado
    Given Que eu informe o nome do empregado "Desafio Inmetrics API Alterado"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "2.000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "4.500,00"
    And Eu informe o sexo do empregado "f"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint empregado alterar "empregado/alterar/"
    Then A API deve retornar status code "202"
    And A API deve retonar os dados do empregado
    
  Scenario: 006 POST - Cadastrar empregado sem informar dados vazios
    Given Que eu informe o nome do empregado ""
    And Eu informe o cargo do empregado ""
    And Eu informe o valor da comissão do empregado ""
    And Eu informe a data de admissão do empregado ""
    And Eu Informe o CPF do empregado ""
    And Eu informe o id do departamento ""
    And Eu informe o salário do empregado ""
    And Eu informe o sexo do empregado ""
    And Eu informe o tipo de contratacao do empregado ""
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "admissao: must not be blank"
    
  Scenario: 007 POST - Cadastrar empregado informar data de admissão fora do padrão 15/01/2020
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1.000,00"
    And Eu informe a data de admissão do empregado "15012020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3.500,00"
    And Eu informe o sexo do empregado "m"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "admissao: deve estar no padrão 31/12/2020"
    
  Scenario: 008 POST - Cadastrar empregado informar comissão fora do padrão 1.000,00
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3.500,00"
    And Eu informe o sexo do empregado "m"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "comissao: deve estar no padrão 1.000,00"
    
  Scenario: 009 POST - Cadastrar empregado informar tipo contratacao fora do padrão: pj ou clt
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1.000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3.500,00"
    And Eu informe o sexo do empregado "m"
    And Eu informe o tipo de contratacao do empregado "outro"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "tipoContratacao: pj ou clt"
    
  Scenario: 010 POST - Cadastrar empregado informar salario fora do padrão 1.000,00
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1.000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3500,00"
    And Eu informe o sexo do empregado "m"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "salario: deve estar no padrão 1.000,00"
    
  Scenario: 011 POST - Cadastrar empregado informar cpf fora do padrão 111.222.333-00
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1.000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "03187667015"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3.500,00"
    And Eu informe o sexo do empregado "m"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "cpf: deve estar no padrão 111.222.333-00"
    
  Scenario: 012 POST - Cadastrar empregado informar sexo fora do padrão m, f ou i
    Given Que eu informe o nome do empregado "Desafio Inmetrics API"
    And Eu informe o cargo do empregado "Analista"
    And Eu informe o valor da comissão do empregado "1.000,00"
    And Eu informe a data de admissão do empregado "15/01/2020"
    And Eu Informe o CPF do empregado "031.876.670-15"
    And Eu informe o id do departamento "1"
    And Eu informe o salário do empregado "3.500,00"
    And Eu informe o sexo do empregado "outro"
    And Eu informe o tipo de contratacao do empregado "clt"
    When Eu submeter o endpoint "empregado/cadastrar"
    Then A API deve retornar status code "400"
    And A mensagem de erro "sexo: m, f ou i"