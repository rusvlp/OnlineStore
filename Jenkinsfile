pipeline{
    agent any

    stages{


        stage("Build"){
            steps{
                bat 'dir'
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