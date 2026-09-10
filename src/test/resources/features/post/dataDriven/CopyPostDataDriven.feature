Feature: To create job description in the test application

  Background: Read the data fro data driven
    * def testData = read('classpath:data/testData.csv')

    @Regression @Smoke
  Scenario Outline: Data Driven for the job description entry - <jobId>
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request
      """
    { "jobId":'#(jobId)',
      "jobTitle":'#(jobTitle)',
      "jobDescription":'#(jobDescription)',
      "experience":["Google",
                    "Apple",
                    "Mobile Iron"],
      "project":[{"projectName":"Movie App",
        "technology":["Kotlin",
          "SQL Lite",
          "Gradle"]}]
    }
      """

    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status <status>
    Examples:
      | jobId | jobTitle               | jobDescription            | status |
      | 99    | Senior DevOps Engineer | Automation Infrastructure | 201    |
      | id    | Senior DevOps Engineer | Automation Infrastructure | 400    |
      | true  | Senior DevOps Engineer | Automation Infrastructure | 400    |


  Scenario Outline: Data Driven for the job description using csv files - <jobId>
    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And request
    """
    { "jobId":'#(jobId)',
      "jobTitle":'#(jobTitle)',
      "jobDescription":'#(jobDescription)',
      "experience":[
        "Google",
        "Apple",
        "Mobile Iron"
      ],
      "project":[
        {"projectName":"Movie App",
         "technology":[
           "Kotlin",
           "SQL Lite",
           "Gradle"]
        }]
    }
    """
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status <status>
    Examples:
      | read('classpath:data/testData.csv') |