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
                sh 'docker run -d --name nginx-run-$BUILD_NUMBER -p 8888:80 bagas25/nginx-docker:$BUILD_NUMBER'
                sh 'curl localhost'
                sh 'docker container rm test-run --force'
            }
        }
        stage('Push Image') {
            steps {
                sh 'docker push bagas25/nginx-docker:$BUILD_NUMBER'
                sh 'docker image rm bagas25/nginx-docker:$BUILD_NUMBER'
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    def remote = [name: 'dev', host: 'dev.machine.me', user: 'me', password: 'letmein', allowAnyHosts: true]
                    sshCommand remote: remote, command: "docker pull bagas25/nginx-docker:$BUILD_NUMBER"
                    sshCommand remote: remote, command: "docker run -d -p 8888:80 -v nginx-volume:/usr/share/nginx/html bagas25/nginx-docker:$BUILD_NUMBER"
                }
            }
        }
    }
}