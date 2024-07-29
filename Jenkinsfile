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
        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t spring-boot-file-upload .'
                }
            }
        }
        stage('Push Image to Docker Hub') {
            steps {
                script {
                    withCredentials([string(credentialsId: 'dockerhub-pwd', variable: 'dockerhub-pwd')]) {
                        sh 'docker login ${DOCKER_HUB_USERNAME} -p ${dockerhub-pwd}'
                        sh 'docker push ${DOCKER_HUB_USERNAME}/spring-boot-file-upload:main'
                    }
                }
            }
        }
        stage('Pull Docker Image') {
            steps {
                script {
                    sh 'docker pull spring-boot-file-upload'
                }
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