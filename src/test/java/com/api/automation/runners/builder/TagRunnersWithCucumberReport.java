package com.api.automation.runners.builder;

import com.api.automation.config.report.CustomExtentReport;
import net.masterthought.cucumber.Configuration;
import net.masterthought.cucumber.ReportBuilder;
import org.apache.commons.io.FileUtils;
import com.intuit.karate.Results;
import com.intuit.karate.Runner;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;

import java.io.File;
import java.sql.Array;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

public class TagRunnersWithCucumberReport {

    @Test
    public void executeKarateTest() {

        Results results = Runner.path("classpath:features")
                .tags("@Smoke,@Regression")
                .outputCucumberJson(true)
                .outputJunitXml(true)
                .parallel(5);
//        ~@Regression ignores the tag Regression

        CustomExtentReport extentReport = new CustomExtentReport()
                .withKarateResults(results)
                .withReportDir(results.getReportDir())
                .withReportTitle("Karate Test Execution Report");

        extentReport.generateExtentReport();

        System.out.println("Total Feature => " + results.getFeaturesTotal());
        System.out.println("Total Scenarios => " + results.getScenariosTotal());
        System.out.println("Passed Scenarios => " + results.getScenariosPassed());
        generateCucumberReport(results.getReportDir());
        Assertions.assertEquals(0, results.getFailCount(),
                "There are some Failed Scenarios");
    }

//    reportDirLocation --> C:\Users\aubrey.fredericks\IdeaProjects\KarateAPI_Part1\target\surefire-reports
    private void generateCucumberReport(String reportDirLocation){
        File reportDir = new File(reportDirLocation);
        Collection<File> jsonCollection =FileUtils.listFiles(reportDir, new String[]{"json"},true);

        List<String> jsonFile = new ArrayList<String>();
        jsonCollection.forEach(file -> jsonFile.add(file.getAbsolutePath()));

        Configuration configuration = new Configuration(reportDir,"Karate API Project");
        ReportBuilder reportBuilder = new ReportBuilder(jsonFile, configuration);

        reportBuilder.generateReports();
    }
}
