package com.api.automation.runners.builder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class TagRunners {

    @Test
    public void executeKarateTest() {

        Results results = Runner.path("classpath:features")
                .tags("@Smoke,@Regression")
                .parallel(5);
//        ~@Regression ignores the tag Regression

        System.out.println("Total Feature => " + results.getFeaturesTotal());
        System.out.println("Total Scenarios => " + results.getScenariosTotal());
        System.out.println("Passed Scenarios => " + results.getScenariosPassed());

        Assertions.assertEquals(0, results.getFailCount(),
                "There are some Failed Scenarios");
    }
}
