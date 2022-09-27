pipeline{
    agent any

    stages{


        stage("Build"){
            steps{
                bat 'dir'
                bat 'build.bat'
            }
        }

        stage("Test"){
            steps{

            }
        }
    }



    post{
        always{
            cleanWs()
        }
    }

}