package br.com.inmetrics.teste.base;

import io.restassured.response.Response;
import io.restassured.specification.RequestSpecification;

public class BaseUtil {
	public Response response;
	public RequestSpecification request;
	public String base_url = "https://inm-api-test.herokuapp.com/";

}
