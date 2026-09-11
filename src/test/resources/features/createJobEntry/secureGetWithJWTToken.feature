@Smoke
Feature: To send the get request with JWT Token
GET http://localhost:9898/auth/webapi/all

  Background: Setup the URL
    Given url _url

  Scenario: Send the GET request with JWT token
    * def token = call read('classpath:features/createJobEntry/token/generateToken.feature') {"password": "adminKarate1234","username": "amfredericks"}
    Given path '/auth/webapi/all'
    And headers {Accept:'application/json', Authorization: '#("Bearer " + token.authToken)'}
    When method get
    Then status 200

  Scenario: Send the GET request with JWT without token
    Given path '/auth/webapi/all'
    And headers {Accept:'application/json', ContentType:'application/json'}
    When method get
    Then status 401
