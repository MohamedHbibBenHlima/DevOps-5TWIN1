pipeline{
    agent any
    stages{


        stage('Cloning from GitHub') {
                steps {
                git branch: 'hbib', url: 'https://github.com/MohamedHbibBenHlima/DevOps-5TWIN1.git'   
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
        stage('Unit Tests + Mockito'){
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

        
        stage('Nexus'){
         
             steps{
                 sh 'mvn deploy '
             }       
         }
       
        
        
        
        
        
    }
}
