#@Regression
Feature: To create job description in the test application using XML

  Background:
    * def testData = read('classpath:data/testData.csv')

  Scenario Outline: Data Driven for the job description using csv files - <jobId>

    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'
    And header Accept = 'application/xml'
    And header Content-Type = 'application/xml'

    And request
      """
      <item>
          <jobId>#(jobId)</jobId>
          <jobTitle>#(jobTitle)</jobTitle>
          <jobDescription>#(jobDescription)</jobDescription>
          <experience>
              <experienceItem>#(experienceItem1)</experienceItem>
              <experienceItem>#(experienceItem2)</experienceItem>
              <experienceItem>#(experienceItem3)</experienceItem>
          </experience>
      <project>
          <projectName>#(projectName)</projectName>
          <technology>
              <technologyItem>#(projectItem1)</technologyItem>
              <technologyItem>#(projectItem2)</technologyItem>
              <technologyItem>#(projectItem3)</technologyItem>
          </technology>
      </project>
      </item>
      """

    When method post
    Then status karate.toInt(status)

    And print 'Response for Create Job => ', response

    Examples:
      | read('classpath:data/testData.csv') |