Feature: Create Jobs using CSV Data
  Background:
    * def jobs = read('classpath:data/testData.csv')
    * def row = jobs[0]

#  @Regression
  Scenario Outline: Create Job using CSV row

    * def requestPayload =
      """
      <item>
      <jobId>#(row.jobId)</jobId>
      <jobTitle>#(row.jobTitle)</jobTitle>
      <jobDescription>#(row.jobDescription)</jobDescription>
      <experience>
      <experienceItem>#(row.experienceItem1)</experienceItem>
      <experienceItem>#(row.experienceItem2)</experienceItem>
      <experienceItem>#(row.experienceItem3)</experienceItem>
      </experience>
      <project>
      <project>
      <projectName>#(row.projectName)</projectName>
      <technology>
      <technologyItem>#(row.projectItem1)</technologyItem>
      <technologyItem>#(row.projectItem2)</technologyItem>
      <technologyItem>#(row.projectItem3)</technologyItem>
      </technology>
      </project>
      </project>
      </item>
      """

    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'

    And header Accept = 'application/xml'
    And header Content-Type = 'application/xml'
    And request requestPayload
    When method POST
    Then status 201
    And print "Response for Create Job ==> ", response

    Examples:
      | row |
      | jobs |