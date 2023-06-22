pipeline {
     agent any
    tools{
        maven "Maven"
         @docker
    }
    stages {
        stage('Clean') {
            steps {
               sh "mvn clean"
             }
         }
        stage('Build') {
            steps {
               sh "mvn compile"
             } 
         } 
        stage('Test') {
            steps {
               sh "mvn  test -DskipTests=true"
             }
         }
        stage('Docker') {
            steps {
               sh "docker build -t test:v1 ."
                sh "docker images"
                sh "docker ps -a"
                sh "docker run -d -p 2002:2002 test:v1"
                sh "docker ps"
                sh "docker ps -a"
             }
         }
     }
}

