@Regression
Feature: To create job description in the test application

  Background: Read the data fro data driven
    * def testData = read('classpath:data/testData.csv')

  Scenario Outline: Data Driven for the job description using csv files - <jobId>
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request
    """
    { "jobId":'#(jobId)',
      "jobTitle":'#(jobTitle)',
      "jobDescription":'#(jobDescription)',
      "experience":[
        "#(experienceItem1)",
        "#(experienceItem2)",
        "#(experienceItem3)"
      ],
      "project":[
        {"projectName":"#(projectName)",
         "technology":[
           "#(projectItem1)",
           "#(projectItem2)",
           "#(projectItem3)"]
        }]
    }
    """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status <status>
    Examples:
      | read('classpath:data/testData.csv') |