package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class ValidateXMLResponse {

    @Karate.Test
    public Karate runAllTest(){
        return Karate.run("classpath:features/validateXMLResponse.feature");
    }
}
