pipeline{
    agent any
    triggers{
        pollSCM('* * * * *')
    }
    options {
        skipDefaultCheckout true
    }

    stages{

        stage('Clean Up'){
            steps{
                echo 'Cleaning up...'
                cleanWs()
                checkout scm
            }
        }

        stage("Build"){
            steps{
                sh 'ls'
                sh 'sh build.sh'
            }



        }

        stage("Test"){
            steps{
                sh 'sh test.sh'
            }

        }

    }

     post {
            always {
                echo 'finished'
            }
            success {
                echo 'success'
                emailext attachLog: false,
                                      attachmentsPattern: 'example_file.yaml',
                                      from: 'qdrwlad@gmail.com',
                                      body: 'BUILD #${BUILD_NUMBER} SUCCESS',
                                      subject: 'OnlineStore build #${BUILD_NUMBER} successful',
                                      to: 'qdrwlad@gmail.com'
            }
            failure {
                echo 'failed'
                emailext attachLog: false,
                                  attachmentsPattern: 'example_file.yaml',
                                  from: 'qdrwlad@gmail.com',
                                  body: 'BUILD FAILURE',
                                  subject: 'OnlineStore build failed',
                                  to: 'qdrwlad@gmail.com'
            }
            cleanup {
                echo "cleaning up"
            }
        }
}
