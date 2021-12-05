
pipeline{
    agent any
    tools {
        maven 'M3'
        Docker 'Docker'
    }
    stages {
        stage('Build Maven') {
            steps{
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[credentialsId: 'm7learn', url: 'https://github.com/m7learn/cicdcentos.git']]])

                sh "mvn -Dmaven.test.failure.ignore=true clean package"
                
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                  sh 'docker build -t m7learn/my-app-1.0 .'
                }
            }
        }
        stage('Deploy Docker Image') {
            steps {
                script {
                 wwithCredentials([string(credentialsId: 'm7learn', variable: 'dockerpwd')]) {
                      sh 'docker login -u m7learn -p ${dockerpwd}'
                 }  
                 sh 'docker push m7learn/my-app-1.0'
                }
            }
        }
    }
}

