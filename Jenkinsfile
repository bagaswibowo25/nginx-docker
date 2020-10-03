pipeline {
    agent any
    stages {
        stage('check commit') {
            steps {
                sh 'echo env.GIT_COMMIT'
            }
        }
    }
}