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
                bat 'cmd.exe build.bat'
            }
        }
    }

    post{
        always{
            cleanWs()
        }
    }

}