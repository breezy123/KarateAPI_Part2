pipeline {
    agent any

    parameters { choice(name: 'Environment', choices: ['staging', 'preprod', 'prod'], description: 'Profile needs to be used while executing test') }

    stages{
        stage('Debug') {
            steps {
                bat 'echo %JAVA_HOME%'
                bat 'java -version'
                bat 'where java'
                bat 'mvn -version'
            }
        }
        stage('CleanUp'){
            steps{
                bat 'echo CleanUp Stage'
                cleanWs notFailBuild: true
            }
        }
        stage('Git Checkout'){
            steps{
                bat 'echo Checkout Stage'
                checkout scmGit(branches: [[name: '**']], extensions: [], userRemoteConfigs: [[credentialsId: '2e4cb7ec-5dd7-4383-8b3b-9db542b3d5cc', url: 'https://github.com/breezy123/KarateAPI_Part2.git']])
            }
        }
        stage('RestorePackage Stage'){
            steps{
                bat 'echo Restore Stage'
            }
        }
        stage('Build'){
            steps{
                bat 'echo Build Stage'
                bat 'mvn clean compile'
            }
        }
        stage('Deploy'){
            steps{
                bat 'echo Deploy the application..'
            }
        }
        stage('Run Test'){
            steps{
                bat 'mvn -P %Environment% test'
            }
        }
    }
    post{
        always{
            junit 'target/karate-reports/*.xml'
            cucumber buildStatus: 'UNCHANGED', customCssFiles: '', customJsFiles: '', failedFeaturesNumber: -1, failedScenariosNumber: -1, failedStepsNumber: -1, fileIncludePattern: '**/*.json', jsonReportDirectory: 'target/karate-reports', pendingStepsNumber: -1, reportTitle: 'Karate Test Execution', skippedStepsNumber: -1, sortingMethod: 'ALPHABETICAL', undefinedStepsNumber: -1
        }
    }
}