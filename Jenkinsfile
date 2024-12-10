pipeline {
    agent any
    stages {
        stage('Install Apache') {
            steps {
                sh '''
                if [ -x "$(command -v apt)" ]; then
                    sudo apt update
                    sudo apt install -y apache2
                elif [ -x "$(command -v yum)" ]; then
                    sudo yum install -y httpd
                    sudo systemctl start httpd
                fi
                '''
            }
        }
    }
}
