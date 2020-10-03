pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t bagas25/nginx-docker:$BUILD_NUMBER .'
            }
        }
        stage('Test Run Image') {
            steps {
                sh 'docker run -d --name test-run -p 8081:80 bagas25/nginx-docker:$BUILD_NUMBER'
                sh 'curl localhost'
                sh 'docker container rm test-run --force'
                sh 'docker image rm bagas25/nginx-docker:$BUILD_NUMBER'
            }
        }
    }
}