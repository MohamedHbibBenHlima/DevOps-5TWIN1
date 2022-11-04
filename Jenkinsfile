pipeline{
    agent any
    stages {
      
        
        stage ('GIT') {
            steps {
               echo "Getting Project from Git"; 
                git branch: 'iheb', url: 'https://github.com/MohamedHbibBenHlima/DevOps-5TWIN1.git'
               
            }
        }
        stage('Clean'){
            steps {
                sh 'mvn clean '
            }
            
        }
        stage('Compile'){
            steps {
                sh 'mvn compile -DskipTests'
            }
            
        }
        
        
         stage('UNIT test'){
            steps{
                sh 'mvn test'
            }
        }
        stage('SonarQube analysis'){
            steps{
                script{
                    withSonarQubeEnv(credentialsId:'sonar-api'){
                        sh 'mvn clean package sonar:sonar'
                    }
                }
            }
        }
        stage('NEXUS'){
         
             steps{
                 sh 'mvn deploy '
             }
                 
         }
}
}
