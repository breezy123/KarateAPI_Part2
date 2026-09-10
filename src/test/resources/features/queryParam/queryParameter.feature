Feature: To test the Get endpoint with Query Parameter
GET /normal/webapi/find

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To get the data using Query Parameter
    # Create the Job Entry
    # Get the newly created Job Entry using Qurty Parameter
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def createJobId = getRandomValue()
    * def createJob = call read("classpath:features/createJobEntry/createJobEntryWithVariables.feature") { _url:'http://localhost:9897', _path:'/normal/webapi/add', _id:'#(createJobId)'}
    # Send the GET request with Query Parameter
    Given path '/normal/webapi/find'
    And param id = createJobId
    And param jobTitle = 'Software Engg - 3'
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And print "Response Payload ==> ",response
    And match response.jobId == createJobId
