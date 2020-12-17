package br.com.inmetrics.teste.support;

import br.com.inmetrics.teste.base.BaseUtil;
import static io.restassured.RestAssured.given;
import cucumber.api.java.Before;

public class Hooks extends BaseUtil {

	private BaseUtil base;

	public Hooks(BaseUtil base) {
		this.base = base;
	}

	@Before
	public void InicializeTest() {

		base.request = 
				given()
				.header("Content-Type", "application/json")
				.auth()
				.basic("inmetrics", "automacao");
	}
}