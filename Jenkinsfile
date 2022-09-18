pipeline{
    agent any

    stages{
        stage("Clean Up"){
            steps{
                cleanWs()
            }
        }

        stage("Build"){
            steps{
                sh "mvn -version"
                sh "mvn -clean install"
            }
        }
    }

    post{
        always{
            cleanWs()
        }
    }

}