package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class KarateConfigRunner {

    @Karate.Test
    public Karate RunDataDrivenTests(){return Karate.run("classpath:features/configuration/getGlobalConfig.feature");
    }
}
