#@Regression
Feature: To create the Job entry in the test applicatin
  Helper file for POST /noram;/webapi/add

  Scenario: To create the Job Entry with JSON data
    Given url _url
    And path _path
    And print "Helper URL ==> ", _url
    And print "Helper PATH ==> ", _path
    And print "Helper JobID ==> ", _id

    And request { "jobId":'#(_id)',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    * def responseJobId = response.jobId
    * def responseJobTitle = response.jobTitle

