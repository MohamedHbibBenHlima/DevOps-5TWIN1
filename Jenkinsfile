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
        stage ('SONARQUBE') {
    steps {
        sh 'mvn sonar:sonar -Dsonar.login=admin -Dsonar.password=sonarqube'
    }
} 

 stage('SonarQube Analysis'){
                steps {
                    sh """mvn sonar:sonar -DskipTests \
                            -Dsonar.language=java \
                            -Dsonar.host.url=http://192.168.1.173:9000

                       """
                }

            }

        
        
        
        
        
        
        
        
    }
}
