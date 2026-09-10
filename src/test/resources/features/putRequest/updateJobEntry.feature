Feature: To test the updation of Job Entry in the test application
Test the endpoint PUT /noram/webapi/update

  Background: Create and Initialize base Url
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    Given url 'http://localhost:9897'

  Scenario: Create and Initialize base Url
    # Create a new Job Entry
    # Update the Job Entry using PUT Request
    # Using jsonPath verify the updation of details in Job Entry
    Given path '/normal/webapi/add'
    And request { "jobId":'#(id)',"jobTitle":"Software Engg - 3","jobDescription":"To develop andriod application","experience":["Google","Apple","Mobile Iron"],"project":[{"projectName":"Movie App","technology":["Kotlin","SQL Lite","Gradle"]}]}
    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method post
    And status 201
    # PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": '#(id)',
        "jobTitle": "Software Architeture",
        "jobDescription": "To Design and run new code logic",
        "experience": [
          "Node.js",
          "Java Springboot X",
          "Mongo Cloud DB",
          "AWS Jenkins",
          "Ngrok",
          "Docker Container"
        ],
        "project": [
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          },
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          }
        ]
      }
      """

    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == " + id + ")].project")
    And match projectArray[0] == '#[2]'

    And request
      """
      {
        "jobId": '#(getRandomValue())',
        "jobTitle": "Software Architeture",
        "jobDescription": "To Design and run new code logic",
        "experience": [
          "Node.js",
          "Java Springboot X",
          "Mongo Cloud DB",
          "AWS Jenkins",
          "Ngrok",
          "Docker Container"
        ],
        "project": [
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          },
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          }
        ]
      }
      """

    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 404


  Scenario: To update the Job Entry for existing job in JSON fromat by call another feature file
    #<Gherkin Keyword> <call> <read(<location of file)>
    Given call read("classpath:features/createJobEntry/createJobEntry.feature")
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": 126,
        "jobTitle": "Software Architeture",
        "jobDescription": "To Design and run new code logic",
        "experience": [
          "Node.js",
          "Java Springboot X",
          "Mongo Cloud DB",
          "AWS Jenkins",
          "Ngrok",
          "Docker Container"
        ],
        "project": [
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          },
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          }
        ]
      }
      """

    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == 126)].project")
    And match projectArray[0] == '#[2]'


  Scenario: To update the Job Entry for existing job in JSON fromat by call another feature file using shared context
    #<Gherkin Keyword> <call> <read(<location of file)>
    #    Given call read("classpath:features/createJobEntry/createJobEntry.feature")
    * def postRequest = call read("classpath:features/createJobEntry/createJobEntry.feature")
    And print "Calling Feature ==>", postRequest.id
    And print "Calling Feature ==>", postRequest.getRandomValue()
    #PUT request
    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": '#(postRequest.id)',
        "jobTitle": "Software Architeture",
        "jobDescription": "To Design and run new code logic",
        "experience": [
          "Node.js",
          "Java Springboot X",
          "Mongo Cloud DB",
          "AWS Jenkins",
          "Ngrok",
          "Docker Container"
        ],
        "project": [
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          },
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          }
        ]
      }
      """

    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == " + postRequest.id + ")].project")
    And match projectArray[0] == '#[2]'


  Scenario: To update the Job Entry for existing job in JSON fromat by call another feature file with variables
    #<Gherkin Keyword> <call> <read(<location of file)>
    #    Given call read("classpath:features/createJobEntry/createJobEntry.feature") {var1:value, var2:value} embedded expression
    * def getRandomValue = function() {return Math.floor((100) * Math.random());}
    * def id = getRandomValue()
    * def postRequest = call read("classpath:features/createJobEntry/createJobEntryWithVariables.feature") {_url:'http://localhost:9897', _path:'/normal/webapi/add',_id:'#(id)'}

    And print "Printing Out Auto-Generated Id Value ==> ",id

    Given path '/normal/webapi/update'
    And request
      """
      {
        "jobId": '#(id)',
        "jobTitle": "Systems Architeture",
        "jobDescription": "To Design and run new code logic",
        "experience": [
          "Node.js",
          "Java Springboot X",
          "Mongo Cloud DB",
          "AWS Jenkins",
          "Ngrok",
          "Docker Container"
        ],
        "project": [
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          },
          {
            "projectName": "Web App and Mobile",
            "technology": [
              "Argo CD",
              "Postgre Database",
              "Gradle",
              "Node JS"
            ]
          }
        ]
      }
      """

    And headers {Accept : 'application/json', ContentType: 'application/json'}
    When method put
    Then status 200
    * def projectArray = karate.jsonPath(response,"$[?(@.jobId == " + id + ")].project")
    And match projectArray[0] == '#[2]'

