package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class SecureBasicAuthGetRequest {

    @Karate.Test
    public Karate runAllTest(){
        return Karate.run("classpath:features/securedPortal/getRequest/secureGetRequest.feature");
    }
}
