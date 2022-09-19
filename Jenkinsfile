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
                dir('subDir') {
                    checkout scm
                }
            }
        }
    }

    post{
        always{
            cleanWs()
        }
    }

}