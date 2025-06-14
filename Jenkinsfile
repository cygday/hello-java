pipeline {
    agent any

    environment {
        IMAGE_NAME = 'hello-app'
        TAG = 'latest'
    }
    stages {
        stage('Checkout') {
            steps {
                git branch: 'main', url: 'https://github.com/cygday/hello-java.git'
            }
        }
        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('build docker image') {
            steps {
                script {
			docker.build("${IMAGE_NAME}:${TAG}")
                 
                }
            }
        }
        stage('run docker container') {
            steps {
                sh "docker run -d --name hello-app -p 8090:8090 ${IMAGE_NAME}:${TGA}"
            }
        }   
    
    }
    post {
        success {
            echo "app successfully  deployed"
        }
        failure {
            echo "pipeline failed"
        }
    }
}
