@Regression
Feature: To create the Job entry in the application

Use POST /normal/webapi/add to create job entry in the application

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To create the Job Entry in JSON format

    Given path '/normal/webapi/add'
    And request { "jobId":14,"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    And print  response
    And match response.jobTitle == "Software Engg - 3"


  Scenario: To create the Job Entry using XML request body format

    Given path '/normal/webapi/add'
    And request <item><jobId>10</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
    And headers {Accept : 'application/xml', ContentType: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response/Job/jobId == "10"


  Scenario: To create the Job Entry in JSON format using external JSON file

    Given path '/normal/webapi/add'
    * def body = read("classpath:data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    And print  response
    And match response.jobId == 55


  Scenario: To create the Job Entry using XML request body format using xternal XML file

    Given path '/normal/webapi/add'
    * def body = read("classpath:data/jobEntry.xml")
    And request body
    And headers {Accept : 'application/xml', ContentType: 'application/xml'}
    When method post
    And status 201
    And print response
    And match response/Job/jobId == "12"


  Scenario: To create the Job Entry in JSON format with embedded expression

    Given path '/normal/webapi/add'
    * def getJobID = function() {return Math.floor((100)* Math.random());}
    And request { "jobId":'#(getJobID())',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    And print  response
    And print response.jobId


  Scenario: To create the Job Entry using XML request body format with embedded expression

    Given path '/normal/webapi/add'
    * def getJobID = function() {return Math.floor((100)* Math.random());}
    * def jobID = getJobID()
    And request <item><jobId>#(jobID)</jobId><jobTitle>Software Engg</jobTitle><jobDescription>To develop andriod application</jobDescription><experience><experience>Google</experience><experience>Apple</experience><experience>Mobile Iron</experience></experience><project><project><projectName>Movie App</projectName><technology><technology>Kotlin</technology><technology>SQL Lite</technology><technology>Gradle</technology></technology></project></project></item>
    And headers {Accept : 'application/xml', ContentType: 'application/xml'}
    When method post
    And status 201
    And print response