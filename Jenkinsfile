pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                // Клонування репозиторію
                git 'https://github.com/0999271690alex/Jenkins.git'
            }
        }
        stage('Install Apache2') {
            steps {
                script {
                    sh '''
                    # Перевірка, чи встановлений Apache2
                    if ! [ -x "$(command -v apache2)" ]; then
                        echo "Installing Apache2..."
                        sudo apt-get update
                        sudo apt-get install -y apache2
                        sudo systemctl start apache2
                        sudo systemctl enable apache2
                    else
                        echo "Apache2 is already installed"
                    fi
                    '''
                }
            }
        }
        stage('Check Logs') {
            steps {
                script {
                    sh '''
                    # Аналіз логів на помилки
                    LOG_FILE=/var/log/apache2/access.log
                    echo "Checking for 4xx and 5xx errors in logs..."
                    if [ -f "$LOG_FILE" ]; then
                        grep -E '4[0-9]{2}|5[0-9]{2}' $LOG_FILE || echo "No 4xx/5xx errors found."
                    else
                        echo "Log file does not exist!"
                    fi
                    '''
                }
            }
        }
    }
}
