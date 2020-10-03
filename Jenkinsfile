pipeline {
    agent any
    stages {
        node {
        def remote = [:]
        remote.name = 'dev'
        remote.host = 'dev.machine.me'
        remote.user = 'me'
        remote.password = 'letmein'
        remote.allowAnyHosts = true
        stage('Remote SSH') {
            sshCommand remote: remote, command: "ls -lrt"
            sshCommand remote: remote, command: "for i in {1..5}; do echo -n \"Loop \$i \"; date ; sleep 1; done"
        }
    }
}