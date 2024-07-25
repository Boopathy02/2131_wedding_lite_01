pipeline {
    agent any

    environment {
        SNAP_REPO = '2131_wedding_lite_01-snapshot'
        NEXUS_USER = 'admin'
        NEXUS_PASS = 'admin'
        RELEASE_REPO = '2131_wedding_lite_01-release'
        CENTRAL_REPO = '2131_wedding_lite_01-central'
        NEXUSIP = '192.168.1.14'
        NEXUS_URL = 'http://192.168.1.14'
        NEXUSPORT = '8081'
        NEXUS_GRP_REPO = '2131_wedding_lite_01-group'

        appregistry = "https://registry.hub.docker.com"
        vprofileRegistry = "boopathy102"
        registryCredential = "dockerHub"
        DOCKER_IMAGE_NAME = "boopathy102/2131_wedding_lite_01"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Boopathy02/2131_wedding_lite_01.git'
            }
        }
        
        stage('Upload Artifact To Nexus') {
            steps {
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
                            file: 'target/2131_wedding_lite_01.war',
                            type: 'war']
                        ]
                    )
                }
            }
        }
    }

    post {
        always {
            cleanWs() // Clean up the workspace after the build
        }
    }
}
