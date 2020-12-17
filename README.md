Introduction
Automação Web API

Getting Started
Configuração de ambiente
Instalar o JDK caso ele já não esteja instalado. Para isso acesse o link http://www.oracle.com/technetwork/java/javase/downloads/index.html
Selecione o JDK adequado ao seu sistema operacional.

Instalar o Eclipse ou a ferramenta IDE da sua preferência http://www.eclipse.org/downloads/

Instalar o plugin do Cucumber. Para isso, abra o Eclipse e acesse o menu "Help > Install New Software". Na janela que abrir, digite a URL https://cucumber.io/cucumber-eclipse/update-site e tecle "ENTER". Será exibido o item "Cucumber Eclipse Plugin". Marque o checkbox e clique em "NEXT". Aceite os termos da licença e clique finish.

Importar o projeto como Maven Project.

As dependências do projeto estão configuradas no arquivo pom.xml

Abrir a classe RunCucumberTest.java e informar a tag @regressivo para executar todos os cenários ou @smoke para executar somente os cenários: 002 GET - Listar empregado cadastrado, 003 GET - Listar empregado não cadastrado e 004 GET - Listar todos os empregados

Executar o projeto com JUnit Test

Relatório da execução disponível em: target/report-html/index.html