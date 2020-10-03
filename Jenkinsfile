pipeline {
    agent any
    stages {
        stage('check commit') {
            steps {
                sh 'echo "git_commit=$GIT_COMMIT"'
            }
        }
    }
}