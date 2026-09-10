#@Regression
Feature: To create job description in the test application

#  Background: Read the data fro data driven
#    * def testData = read('classpath:data/testData.csv')
  Scenario Outline: Data Driven for the job description using csv files XML content

    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'

    And request <item><jobId>#(jobId)</jobId><jobTitle>#(jobTitle)</jobTitle><jobDescription>#(jobDescription)</jobDescription><experience><experienceItem>#(experienceItem1)</experienceItem><experienceItem>#(experienceItem2)</experienceItem><experienceItem>#(experienceItem3)</experienceItem></experience><project><projectName>#(projectName)</projectName><technology><technologyItem>#(projectItem1)</technologyItem><technologyItem>#(projectItem2)</technologyItem><technologyItem>#(projectItem3)</technologyItem></technology></project></item>

    And headers { Accept: 'application/xml', 'ContentType': 'application/xml' }
    When method post
    Then status <status>
    Examples:
      | read('classpath:data/testData.csv') |