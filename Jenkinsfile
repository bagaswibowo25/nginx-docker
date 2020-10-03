pipeline {
    agent any
    stages {
        stage('Remote SSH') {
            steps {
                script {
                    def remote = [name: 'dev', host: 'dev.machine.me', user: 'me', password: 'letmein', allowAnyHosts: true]
                    sshCommand remote: remote, command: "docker container ls"
                }
            }
        }
    }
}