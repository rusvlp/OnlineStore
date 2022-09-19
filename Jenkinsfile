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
                bat 'dir'
                bat 'build.bat'
            }
        }
    }



}