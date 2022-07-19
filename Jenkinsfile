pipeline {

 agent any

    tools {
        maven 'myMaven'
    }

    stages {
        stage('Code Compilation') {
            steps {
                echo 'Code Compilation Started'
                sh 'mvn clean compile'
				echo 'Code Compilation Completed'
            }
        }
        stage('Code Test') {
            steps {
                echo 'Maven Test Execution Started'
                sh 'mvn clean test'
				echo 'Maven Test Execution Completed'
            }
        }
        stage('Code package') {
            steps {
                echo 'Artifact Creation Started'
                sh 'mvn clean package'
				echo 'Artifact Creation Completed'
            }
        }
        stage('Create Docker Image') {
            steps {
                echo 'Docker Image Creation Started'
                sh 'docker build -t dhiraj371985/playjava:${BUILD_NUMBER} .'
				echo 'Docker Image Creation Started'
            }
        }

        stage('List all Images') {
            steps {
                echo 'Docker Image Creation Started'
                sh 'docker images'
				echo 'Docker Image Creation Started'
            }
        }
        stage('Upload Docker to DockerRegistry') {
            steps {
                script {
                   withCredentials([string(credentialsId: 'DockerhubCred', variable: 'DockerhubCred')]){
                   sh 'docker login docker.io -u dhiraj371985 -p ${DockerhubCred}'
                   echo "Push Docker Image to DockerHub : In Progress"
                   sh 'docker push dhiraj371985/playjava:${BUILD_NUMBER}'
                   echo "Push Docker Image to DockerHub : In Progress"
                   }
                }
            }
         }
   }
 }
