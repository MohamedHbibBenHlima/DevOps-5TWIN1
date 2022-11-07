pipeline{
    agent any

    environment {
            DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    
    tools {
        maven 'M2_HOME'
    }
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
        
       

        
        stage('Nexus'){
         
             steps{
                 sh 'mvn deploy '
             }       
         }
        stage('Docker build')
        {
            steps {
                 sh 'docker build -t mohamedhabibbennhlima/devops  .'
            }
        }
        stage('Docker login')
        {
            steps {
                sh 'echo $dockerhub_PSW | docker login -u mohamedhabibbennhlima -p dckr_pat_IwnkMo7H5dmppu01MHuvOn2FZJY'
            }    
       
        }
      stage('Push') {
		steps {
				sh 'docker push mohamedhabibbennhlima/devops'
			}
		}
       stage('DockerCompose') {
        
                       steps {
                                sh 'cd /var/lib/jenkins/workspace/Pipe-Achat'
				sh 'docker-compose up -d'
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
       
        
        
        
        
    }
}
