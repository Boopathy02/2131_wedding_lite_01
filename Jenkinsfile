pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/Boopathy02/2131_wedding_lite.git'
            }
        }
        stage('ssh agent clone') {
            steps {
                script {
                    sshagent(['ubuntu']) {
                    sh '''
                        ssh -o StrictHostKeyChecking=no -t ubuntu@18.191.107.182 <<EOF
                        #!/bin/bash
                        set -e

                        # Define the directory and repository
                        DIR="2131_wedding_lite"
                        REPO="https://github.com/Boopathy02/2131_wedding_lite.git"

                        # Check if the directory exists
                        if [ -d "$DIR" ]; then
                            echo "Directory $DIR exists. Removing it..."
                            rm -rf "$DIR"
                            echo "Directory removed."
                        else
                            echo "Directory $DIR does not exist."
                        fi

                        # Clone the repository
                        echo "Cloning repository $REPO..."
                        git clone "$REPO" "$DIR"
                        echo "Repository cloned into $DIR."
                        EOF
                    '''
                }
                }
            }
        }
    }
}
