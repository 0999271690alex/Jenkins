pipeline {
    agent any
    stages {
        stage('Клонування репозиторію') {
            steps {
                git 'https://github.com/your-repo/jenkins-pipeline.git' // Змініть на ваш репозиторій
            }
        }
        stage('Встановлення Apache') {
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
        stage('Аналіз логів') {
            steps {
                sh 'bash log_analyzer.sh'
            }
        }
    }
}
