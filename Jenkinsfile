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
        stage('UNIT test + Mockito'){
            steps{
                sh 'mvn test'
            }
        }

        
        
        
        
        
        
        
        
    }
}
