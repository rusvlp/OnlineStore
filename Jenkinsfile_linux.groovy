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

        stage("Sending to Artifactory"){
            steps{
                zip zipFile: 'OnlineStore_Build${BUILD_NUMBER}.zip', dir:'/target/'
                sh 'mv target/OnlineStore_Build${BUILD_NUMBER}.zip /home/rusvlp/artifactory'
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
                                      body: 'BUILD SUCCESS',
                                      subject: 'OnlineStore build successful',
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
