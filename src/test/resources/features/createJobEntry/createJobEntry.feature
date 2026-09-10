@Regression
Feature: To create the Job entry in the test applicatin
  Helper file for POST /noram;/webapi/add

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To create the Job Entry with JSON data
    Given path '/normal/webapi/add'
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    And request { "jobId":'#(id)',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    * def responseJobId = response.jobId
