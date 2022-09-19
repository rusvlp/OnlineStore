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
                bat 'build.bat'
            }
        }
    }

    post{
        always{
            cleanWs()
        }
    }

}