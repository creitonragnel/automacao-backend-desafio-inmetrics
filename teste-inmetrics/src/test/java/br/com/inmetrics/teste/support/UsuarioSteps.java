package br.com.inmetrics.teste.support;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.junit.Assert;

import br.com.inmetrics.teste.base.BaseUtil;

import java.util.Arrays;
import java.util.List;

import cucumber.api.java.en.And;
import cucumber.api.java.en.Given;
import cucumber.api.java.en.Then;
import cucumber.api.java.en.When;

public class UsuarioSteps extends BaseUtil {
	
	private String cargoEmpregado;
	private String comissaoEmpregado;
	private String admissaoEmpregado;
	private String cpfEmpregado;
	private Integer idDepartamento;
	private String salarioEmpregado;
	private String sexoEmpregado;
	private String tipoContratacaoEmpregado;
	private BaseUtil base;
	private static String nomeEmpregado;
	private static String idEmpregado;
	
	public UsuarioSteps(BaseUtil base) {
		this.base = base;
	}
	
	public UsuarioSteps() {

	}
	
	@Given ("^Que eu possuo o id do empregado \"(.*)\"$")
	public void id_empregado(String id) throws Throwable {
		idEmpregado = id;
	}
	
	@Given ("^Que eu informo os dados do empregado nome \"(.*)\" cargo \"(.*)\" comissão \"(.*)\" data de admissão \"(.*)\" CPF \"(.*)\" id do departamento \"(.*)\" salário \"(.*)\" sexo \"(.*)\" tipo de contratacao \"(.*)\"$")
	public void informar_dados_empregado_cadastro(String nome, String cargo, String comissao, String admissao, String CPF, 
			Integer departamento, String salario, String sexo, String tp_contratacao) throws Throwable {
		nomeEmpregado = nome;
		cargoEmpregado = cargo;
		comissaoEmpregado = comissao;
		admissaoEmpregado = admissao;
		cpfEmpregado = CPF;
		idDepartamento = departamento;
		salarioEmpregado = salario;
		sexoEmpregado = sexo;
		tipoContratacaoEmpregado = tp_contratacao;
	}
	
    @When ("^Eu submeter o endpoint \"(.*)\"$")
    public void submeter_endpoint(String endpoint) throws Throwable {
    	
    	String body = "{\r\n" +
    			"\"admissao\": \"" + admissaoEmpregado + "\",\r\n" +
    			"\"cargo\": \"" + cargoEmpregado + "\",\r\n" +
    			"\"comissao\": \"" + comissaoEmpregado + "\",\r\n" +
    			"\"cpf\": \"" + cpfEmpregado + "\",\r\n" +
    			"\"departamentoId\": " + idDepartamento + ",\r\n" +
    			"\"nome\": \"" + nomeEmpregado + "\",\r\n" +
    			"\"salario\": \"" + salarioEmpregado + "\",\r\n" +
    			"\"sexo\": \"" + sexoEmpregado + "\",\r\n" +
    			"\"tipoContratacao\": \"" + tipoContratacaoEmpregado + "\"\r\n" +
    			"}";
    	
    	base.request.given().body(body);
    	
    	base.response = base.request.post(base.base_url + endpoint);    	
	}
    
    @When ("^Eu executar um get no endpoint \"(.*)\"$")
    public void get_endpoint(String endpoint) throws Throwable {
    	base.response = base.request.get(base.base_url + endpoint + idEmpregado);
    }
    
    @When ("^Eu executar um get no endpoint empregado list_all \"(.*)\"$")
    public void get_endpoint_empregado_list_all(String endpoint) throws Throwable {
    	base.response = base.request.get(base.base_url + endpoint);
    }
    
    @When ("^Eu submeter o endpoint empregado alterar \"(.*)\"$")
    public void put_endpoint_empregado(String endpoint) throws Throwable {
    	String body = "{\r\n" +
    			"\"admissao\": \"" + admissaoEmpregado + "\",\r\n" +
    			"\"cargo\": \"" + cargoEmpregado + "\",\r\n" +
    			"\"comissao\": \"" + comissaoEmpregado + "\",\r\n" +
    			"\"cpf\": \"" + cpfEmpregado + "\",\r\n" +
    			"\"departamentoId\": " + idDepartamento + ",\r\n" +
    			"\"nome\": \"" + nomeEmpregado + "\",\r\n" +
    			"\"salario\": \"" + salarioEmpregado + "\",\r\n" +
    			"\"sexo\": \"" + sexoEmpregado + "\",\r\n" +
    			"\"tipoContratacao\": \"" + tipoContratacaoEmpregado + "\"\r\n" +
    			"}";
    	
    	base.request.given().body(body);
    	
    	base.response = base.request.put(base.base_url + endpoint + idEmpregado); 
    }

    @Then ("^A API deve retornar status code \"(.*)\"$")
    public void a_api_deve_retornar_status_code(Integer status_code) throws Throwable {
    	base.response.then().statusCode(status_code);
	}
    
    @Then ("^A API deve retonar os dados do empregado$")
    public void a_api_deve_retornar_os_dados_do_empregado() throws Throwable {
    	JSONParser parser = new JSONParser();
    	JSONObject json = (JSONObject) parser.parse(base.response.body().asString());
    	idEmpregado = json.get("empregadoId").toString();
    	Assert.assertEquals(nomeEmpregado, json.get("nome").toString());
	}
    
    @Then ("^A mensagem de erro \"(.*)\"$")
    public void mensagem_erro(String mensagem) throws Throwable {
    	List<String> list = Arrays.asList(base.response.body().asString());
    	Assert.assertTrue(list.toString().contains(mensagem));
	}
    
    @Then ("^A mensagem \"(.*)\"$")
    public void mensagem_retorno(String mensagem) throws Throwable {
    	Assert.assertEquals(mensagem, base.response.body().asString());
	}
}






