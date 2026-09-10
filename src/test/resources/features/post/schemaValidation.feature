@Regression
Feature: Validate the JSON schema
To validate the JSON schema for POST /normal/webapi/add

  Background: Create and Initialize base Url
    Given url 'http://localhost:9897'

  Scenario: To validate the json schema for jobEntry.json
    Given path '/normal/webapi/add'
    * def body = read("classpath:data/jobEntry.json")
    And request body
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    And print response
    And match response ==
      """
      {
        "jobId": "#number",
        "jobTitle": "#string",
        "jobDescription": "#string",
        "experience": "#[] #string",
        "project": "#[]",
      }
      """

  Scenario: Schema Validation for GET end point
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get # Send the get request
    Then status 200
    * def projectSchema = { "projectName": '#string', "technology": '#[] #string' }
    * def mainSchema = {"jobId": '#number',"jobTitle": '#string',"jobDescription": '#string',"experience": '#[] #string',"project": '#[] ##(projectSchema)'}
    And match response ==
      """
      '#[] ##(mainSchema)'
      """