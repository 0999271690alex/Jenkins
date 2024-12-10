pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Клонування репозиторію
                git 'https://github.com/0999271690alex/Jenkins'
            }
        }
        stage('Install Apache') {
            steps {
                script {
                    if (isUnix()) {
                        // Для Linux
                        sh '''
                            sudo apt update || sudo yum update -y
                            sudo apt install -y apache2 || sudo yum install -y httpd
                            sudo systemctl start apache2 || sudo systemctl start httpd
                            sudo systemctl enable apache2 || sudo systemctl enable httpd
                        '''
                    } else {
                        error 'Операційна система не підтримується.'
                    }
                }
            }
        }
    }
