pipeline {
    agent any
    environment {
            DOCKER_HUB_USERNAME = '24ccheng'
        }
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/Cheng-Chan/spring-boot-file-upload-deployment']])
            }
        }
        stage('Deploy with Docker Compose') {
            steps {
                script {
                    sh 'docker-compose -f docker-compose.yml up -d'
                }
            }
        }
    }
    post {
        always {
            cleanWs()
        }
    }
}