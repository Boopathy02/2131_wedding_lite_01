pipeline {
    agent any

    environment {
        // ... (environment variables)
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Boopathy02/2131_wedding_lite_01.git'
            }
        }

        stage('Build') {
            steps {
                sh 'mvn -s settings.xml -DskipTests install'
            }
            post {
                success {
                    echo "Build successful, now archiving artifacts."
                    archiveArtifacts artifacts: '**/*.war'
                }
                failure {
                    error "Build failed, check the console output for details."
                }
            }
        }

        stage('Upload Artifact To Nexus') {
            steps {
                script {
                    def warFile = 'target/2131_wedding_lite_01.war'
                    if (fileExists(warFile)) {
                        withCredentials([usernamePassword(credentialsId: 'nexus3', usernameVariable: 'NEXUS_USER', passwordVariable: 'NEXUS_PASS')]) {
                            nexusArtifactUploader(
                                nexusVersion: 'nexus3',
                                protocol: 'http',
                                nexusUrl: "${NEXUS_URL}:${NEXUSPORT}",
                                groupId: 'Prod',
                                version: "${env.BUILD_ID}",
                                repository: "${RELEASE_REPO}",
                                credentialsId: 'nexus3',
                                artifacts: [
                                    [artifactId: '2131_wedding_lite_01',
                                    classifier: '',
                                    file: warFile,
                                    type: 'war']
                                ]
                            )
                        }
                    } else {
                        error "Artifact ${warFile} does not exist."
                    }
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
