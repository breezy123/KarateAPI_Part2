package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class DataDrivenRunnerXML {

    @Karate.Test
    public Karate RunDataDrivenTests(){
        return Karate.run("classpath:features/post/dataDriven/postDataDrivenXML.feature");
    }
}
