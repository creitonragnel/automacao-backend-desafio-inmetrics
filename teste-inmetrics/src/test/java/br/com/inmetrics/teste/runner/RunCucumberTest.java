package br.com.inmetrics.teste.runner;

import org.junit.runner.RunWith;

import cucumber.api.CucumberOptions;
import cucumber.api.junit.Cucumber;

@RunWith(Cucumber.class)
@CucumberOptions(features = "src/test/resources/features/", 
	glue = { "" }, 
	//plugin = {"pretty", "html:target/report-html", "json:target/report.json", "junit:target/surefire-reports/report.xml" },
	plugin = {"json: target/cucumber.json"},
	monochrome = true, dryRun = false, strict = false)
public class RunCucumberTest {
	
}