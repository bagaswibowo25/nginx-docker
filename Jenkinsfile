pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t bagas25/nginx-docker:$BUILD_NUMBER .'
            }
        }
        stage('Test Image') {
            steps {
                script {
                    def nginx = docker.image('bagas25/nginx-docker:$BUILD_NUMBER')
                    nginx.inside {
                        sh 'pwd'
                    }
                }
            }
        }
    }
}