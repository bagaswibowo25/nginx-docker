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
                sh 'docker run -d --name test-run -p 80 bagas25/nginx-docker:$BUILD_NUMBER'
                sh 'docker container exec -ti test-run curl localhost'
            }
        }
    }
}