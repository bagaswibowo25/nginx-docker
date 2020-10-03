pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t bagas25/nginx-docker:$BUILD_NUMBER .'
            }
        }
    }
}