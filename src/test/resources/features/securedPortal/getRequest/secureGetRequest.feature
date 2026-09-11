@Regression
Feature: To access the GET endpoint which is secured with Basic Auth
  GET '/secure/webapi/all'

  Background: Provided URL
    Given url 'http://localhost:9897'

  Scenario: Access all employees GET request which is secured by Basic Auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization: 'Basic YWRtaW46d2VsY29tZQ=='}
    When method get
    Then status 200
    And match response == '#notnull'
    And print "Print Response Payload ==> ", response

  Scenario: Get all employees without Basic Auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json'}
    When method get
    Then status 401
    And match response == '#notnull'

  Scenario: Sending GET request to endpoint with invalid credentials for Baisc Auth
    Given path '/secure/webapi/all'
    And headers {Accept:'application/json', Authorization: 'YXV0aG9yOndlbGNvbWUx'}
    When method get
    Then status 401
    And match response == '#notnull'
    And print "Print Response Payload ==> ", response

  Scenario: Access all employees GET endpoint with Basic Auth via js function
    Given path '/secure/webapi/all'
    * def auth = call read('classpath:data/basicAuth.js') {username:'admin',password:'welcome'}
    And print "This is Encoded string ==> ",auth
    And headers {Accept:'application/json', Authorization: '#(auth)'}
    When method get
    Then status 200
    And match response == '#notnull'


  Scenario: Access all employees GET endpoint with invalid Basic Auth via js function
    Given path '/secure/webapi/all'
    * def auth = call read('classpath:data/basicAuth.js') {username:'admin1',password:'welcome'}
    And print "This is Encoded string ==> ",auth
    And headers {Accept:'application/json', Authorization: '#(auth)'}
    When method get
    Then status 401
    And match response == '#notnull'