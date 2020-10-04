pipeline {
    agent any
    stages {
        stage('Build') {
            steps {
                sh 'docker build -t bagas25/nginx-docker-dev:$BUILD_NUMBER --no-cache .'
            }
        }
        stage('Test Run Image') {
            steps {
                sh 'docker run -d --name nginx-run-dev-$BUILD_NUMBER -p 80$BUILD_NUMBER:80 bagas25/nginx-docker-dev:$BUILD_NUMBER'
                sh 'curl localhost:80$BUILD_NUMBER'
                sh 'docker container rm nginx-run-dev-$BUILD_NUMBER --force'
            }
        }
        stage('Push Image') {
            steps {
                sh 'docker push bagas25/nginx-docker-dev:$BUILD_NUMBER'
                sh 'docker image rm bagas25/nginx-docker-dev:$BUILD_NUMBER'
            }
        }
        stage('Deploy Container') {
            steps {
                script {
                    def remote = [name: 'dev', host: 'dev.machine.me', user: 'me', password: 'letmein', allowAnyHosts: true]
                    sshCommand remote: remote, command: "docker pull bagas25/nginx-docker-dev:$BUILD_NUMBER"
                    sshCommand remote: remote, command: "docker run -d -p 80$BUILD_NUMBER:80 -v nginx-volume-dev-$BUILD_NUMBER:/usr/share/nginx/html bagas25/nginx-docker-dev:$BUILD_NUMBER"
                }
            }
        }
    }
}