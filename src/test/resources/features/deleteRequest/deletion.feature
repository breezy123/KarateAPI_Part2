@Regression
Feature:  To test the delete endpoint for an existing member
DELETE /normal/webapi/remove/{id}

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: Create a new Job then Delete that newly created Job and check it's not available
    #<Gherkin Keyword> <call> <read(<location of file)>
    #    Given call read("classpath:features/createJobEntry/createJobEntry.feature") {var1:value, var2:value} embedded expression
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("classpath:features/createJobEntry/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add',_id:'#(id)'}

    # Delete Request
    Given path '/normal/webapi/remove/' + id
    And headers {Accept:'application/json'}
    When method delete
    Then status 200
    And print "Deletion Payload Response ==> ",response
    # Get Request

    Given path '/normal/webapi/find/'
    And params {id:'#(id)',jobTitle:'Software Engg - 2'}
    And headers {Accept:'application/json'}
    When method get
    Then status 404


  Scenario: Create a new Job then Delete that newly created Job and check it's not available. Then delete the jobtwice
    #<Gherkin Keyword> <call> <read(<location of file)>
    #    Given call read("classpath:features/createJobEntry/createJobEntry.feature") {var1:value, var2:value} embedded expression
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("classpath:features/createJobEntry/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add',_id:'#(id)'}

    # Delete Request
    Given path '/normal/webapi/remove/' + id
    And headers {Accept:'application/json'}
    When method delete
    Then status 200
    And print "Deletion Payload Response ==> ",response

    # Delete Request again for the same jobId
    Given path '/normal/webapi/remove/' + id
    And headers {Accept:'application/json'}
    When method delete
    Then status 404
    And print "Deletion Payload Response ==> ",response


  Scenario: To demo request chaining
    # Create a new job entry.
    # Extract the job id and job title from the response of POST request
    # Send the path request, Value of query parameter will be set by, info extracted from previous request
    # Extract the job id and job title from the response of patch request
    # Get request with query parameter, value of query param is set by info extracted from response of patch request
    # Add the validation on job description in the response of get request

    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def createJob = call read("classpath:features/createJobEntry/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add',_id:'#(id)'}
    * def jobId = createJob.responseJobId
    * def jobTitle = createJob.responseJobTitle

    # PATCH
    * def jobDes = 'To Develop Android Application and Web Application'
    Given path '/normal/webapi/update/details'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)',jobDescription:'#(jobDes)'}
    And headers {Accept:'application/json'}
    When method patch
    Then status 200
    * def jobId = response.jobId
    * def jobTitle = response.jobTitle

    # GET Request
    Given path '/normal/webapi/find'
    And params {id:'#(jobId)',jobTitle:'#(jobTitle)'}
    And headers {Accept:'application/json'}
    When method get
    Then status 200
    And match response.jobDescription == jobDes