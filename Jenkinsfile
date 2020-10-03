pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t bagas25/nginx-docker:$BUILD_NUMBER .'
            }
        }
        stage('Test Image') {
            agent {
                docker { image 'bagas25/nginx-docker:$BUILD_NUMBER'}
            }
            steps {
                sh 'whoami'
            }
        }
    }
}