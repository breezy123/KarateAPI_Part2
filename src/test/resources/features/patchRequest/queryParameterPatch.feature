@Smoke
Feature: To test the patch endpoint for updating the job description
PATCH /normal/webapi/update/details

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

    @Regression
  Scenario: To update the job description for newly added job entry
    # Create the Job Entry
    # Get the newly created Job Entry using Qurty Parameter
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("classpath:features/createJobEntry/createJobEntryWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createJobId)'}
    # Send the GET request with Query Parameter
    * def jobDes = 'Designs System Infrastruture e2e flows!'
    Given path '/normal/webapi/update/details'
    And params {id:'#(createJobId)',jobTitle:'Systems Architecture',jobDescription:'#(jobDes)'}
    And headers {Accept:'application/json'}
    When method patch
    Then status 200
    And print "Response Payload ==> ",response
    And match response.jobDescription == jobDes
