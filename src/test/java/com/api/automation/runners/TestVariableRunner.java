package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class TestVariableRunner {

    @Karate.Test
    public Karate runAllTest(){
        return Karate.run("classpath:features/Variables.feature");
    }
}
