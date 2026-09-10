package com.api.automation.runners.builder;

import com.intuit.karate.Runner;
import org.junit.jupiter.api.Test;

public class ParallelRunner {

    @Test
    public void executeKarateTests(){
//        Runner.builder().parallel(5);
        Runner.Builder aRunner = new Runner.Builder();
        aRunner.path("classpath:features");
        aRunner.parallel(5);
//        Runner.builder().parallel(aRunner.parallel(5));
    }
}
