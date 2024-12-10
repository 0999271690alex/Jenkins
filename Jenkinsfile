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
        stage('Check Logs') {
            steps {
                script {
                    sh '''
                        LOG_FILE="/var/log/apache2/access.log"
                        if [ ! -f "$LOG_FILE" ]; then
                            LOG_FILE="/var/log/httpd/access_log"
                        fi
                        echo "Перевірка помилок у логах (4xx і 5xx):"
                        grep -E "HTTP/[0-9.]+\" [45][0-9][0-9]" $LOG_FILE || echo "Помилок не знайдено."
                    '''
                }
            }
        }
    }
}
