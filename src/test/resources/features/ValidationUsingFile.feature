@Regression
Feature: To validate the GET endpoint
To validate the get endpoint response

  Background: Setup the Base Path
    Given url 'http://localhost:9897'

  Scenario: To get the data in JSON format and vaidate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/json'
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read("classpath:data/jobEntry.json")
    And match response == actualResponse
    And print "File ==> ", actualResponse

  Scenario: To get the data in XML format and vaidate from file
    Given path '/normal/webapi/all'
    And header Accept = 'application/xml'
    When method get
    Then status 200
    # Create a variable to store the data from external file
    * def actualResponse = read("classpath:data/jobEntry.xml")
    And match response == actualResponse
    And print "File ==> ", actualResponse