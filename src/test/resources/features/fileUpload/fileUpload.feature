@Regression
Feature: To upload the file using the Karate Framework

  Background: Setup the Base Path
    Given url 'http://localhost:9897'

  Scenario: To Upload any file to test application
    Given path '/normal/webapi/upload'
    # location of file, # name of the file, content-type header value
    And multipart file file = {read:'UploadFile.txt', filename:'UploadFile.txt', ContentType:'multipart/form-data'}
    When method post
    Then status 200
    And print response

  Scenario: To upload the in the test application with json data
    Given path '/normal/webapi/upload'
    # location of file, name of the file, content-type header value
    * def fileLocation = 'classpath:data/jobEntry.json'
    And multipart file file = { read: '#(fileLocation)', filename: 'jobEntry.json', ContentType: 'multipart/form-data' }
    When method post
    Then status 200
    And print response
    And match response.message contains 'jobEntry.json'