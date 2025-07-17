pipeline {
    agent any

    environment {
        M2_HOME = "/usr/share/maven" // Update this if needed
        PATH = "$M2_HOME/bin:$PATH"
    }

    stages {
        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/pavan11133/spm-hello-world.git'
            }
        }

        stage('Build with Maven') {
            steps {
                sh 'mvn clean package'
            }
        }

        stage('Run Unit Tests') {
            steps {
                sh 'mvn test'
            }
        }
        
        stage('Deploy') {
            steps {
                sshagent(['tomcat']) {
                    sh 'scp -o StrictHostKeyChecking=no webapp/target/webapp.war ubuntu@13.222.243.68:/home/ubuntu/demo.war'

                }
            }
        }
    }
}
