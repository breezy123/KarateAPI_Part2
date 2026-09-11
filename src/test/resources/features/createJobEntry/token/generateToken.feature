@ignore
Feature: To get the JWT token for the user
POST http://localhost:9898/users/sign-up

  Background: Setup the URL
    Given url 'http://localhost:9898'

  Scenario: Register the user and generate token
    # Register the User
    Given path '/users/sign-up'
    And headers {Accept:'application/json', ContentType:'application/json'}
    And request {"password": '#(password)',"username": '#(username)'}
    When method post
    Then status 200

    #Get the Token
    Given path '/users/authenticate'
    And headers {Accept:'application/json', ContentType:'application/json'}
    And request {"password": '#(password)',"username": '#(username)'}
    When method post
    Then status 200
    * def authToken = response.token