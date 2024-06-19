pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                git branch:'master', url:'https://github.com/Boopathy02/2131_wedding_lite.git' 
            }
        }
        stage('docker image build') {
            steps {
                sh 'docker build -t 2131_wedding_lite /var/lib/jenkins/workspace/2131_wedding_lite/Dockerfile'
            }
        }
        stage('docker run') {
            steps {
                sh 'docker run -d -name static -p 8088:8087 2131_wedding_lite'
            }
        }
    }
}