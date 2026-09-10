#@Regression
Feature: Create Job using XML data from CSV

  Scenario Outline: Create Job using XML payload

    Given url 'http://localhost:9897'
    And path '/normal/webapi/add'

    And header Accept = 'application/xml'
    And header Content-Type = 'application/xml'

    * def requestBody =
      """
      <item>
      <jobId>#(jobId)</jobId></jobId>
      <jobTitle>#(jobTitle)</jobTitle>
      <jobDescription>#(jobDescription)</jobDescription>

      <experience>
      <experienceItem>#(experienceItem1)</experienceItem>
      <experienceItem>#(experienceItem2)</experienceItem>
      <experienceItem>#(experienceItem3)</experienceItem>
      </experience>
      <project>
      <project>
      <projectName>#(projectName)</projectName>
      <technology>
      <technologyItem>#(technologyItem1)</technologyItem>
      <technologyItem>#(technologyItem2)</technologyItem>
      <technologyItem>#(technologyItem3)</technologyItem>
      </technology>
      </project>
      </project>
      </item>
      """

    * replace requestBody.jobId = jobId
    * replace requestBody.jobTitle = jobTitle
    * replace requestBody.jobDescription = jobDescription
    * replace requestBody.experienceItem1 = experienceItem1
    * replace requestBody.experienceItem2 = experienceItem2
    * replace requestBody.experienceItem3 = experienceItem3
    * replace requestBody.projectName = projectName
    * replace requestBody.technologyItem1 = technologyItem1
    * replace requestBody.technologyItem2 = technologyItem2
    * replace requestBody.technologyItem3 = technologyItem3

    * print requestBody
    And request requestBody
    When method post
    Then status <status>

    Examples:
      | read('classpath:data/testData.csv') |