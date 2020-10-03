pipeline {
    agent any
    stages {
        stage('check commit') {
            steps {
                def remote = [:]
                remote.name = 'dev'
                remote.host = 'dev.machine.me'
                remote.user = 'me'
                remote.password = 'letmein'
                remote.allowAnyHosts = true
                writeFile file: 'abc.sh', text: 'ls -lrt'
                sshCommand remote: remote, command: "ls -lrt"
            }
        }
    }
}