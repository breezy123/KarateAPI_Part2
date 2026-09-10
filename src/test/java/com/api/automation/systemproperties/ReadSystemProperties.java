package com.api.automation.systemproperties;

public class ReadSystemProperties {

    public static void main(String[] args){
        System.out.println("Location "+ System.getProperty("location","classpath:features"));
        System.out.println("Tags "+ System.getProperty("tags","@Smoke"));
    }
}
