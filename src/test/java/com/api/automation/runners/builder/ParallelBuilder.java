package com.api.automation.runners.builder;

import com.intuit.karate.Results;
import com.intuit.karate.Runner.Builder;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

public class ParallelBuilder {
    @Test
    public void executeKarateTest(){
        Builder aRunner = new Builder();
        aRunner.path("classpath:features");
        Results results = aRunner.parallel(5);

        System.out.println("Total Feature => "+results.getFeaturesTotal());
        System.out.println("Total Scenarios => "+results.getScenariosTotal());
        System.out.println("Passed Scenarios => "+results.getScenariosPassed());

        Assertions.assertEquals(0, results.getFailCount(), "There are some Failed Scenarios ");
    }
}
