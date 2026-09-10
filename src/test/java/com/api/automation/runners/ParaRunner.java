package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class ParaRunner {

    @Karate.Test
    public Karate RunDataDrivenTests(){
        return Karate.run("classpath:features/queryParam/queryParameter.feature");
    }
}
