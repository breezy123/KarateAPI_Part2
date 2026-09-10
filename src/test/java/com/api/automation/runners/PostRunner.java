package com.api.automation.runners;

import com.intuit.karate.junit5.Karate;

public class PostRunner {

    @Karate.Test
    public Karate runAllTest(){
        return Karate.run("classpath:features/post/createJobEntry.feature");
    }
}
