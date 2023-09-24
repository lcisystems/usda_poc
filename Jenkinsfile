pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn package'             
          }
        }
        
  stage('Publish Artifact') {
             
            steps {
                sh '''

                dir=artifacte
                if [ -d "$dir" ] 
                then
               
                    cp target/*-SNAPSHOT.jar artifacte 
                    cd artifacte 
                    git add . 
                    git commit -m "first commit"
                    git branch -M main
                   
                    git push -u origin main

                else 
                    git clone https://github.com/lcisystems/artifacte.git
                    cd artifacte
                    git config --global user.name "lcisystems"
                    git config --global user.email "rzdin@lcisystems.com"

                    cp target/*-SNAPSHOT.jar artifacte 
                    cd artifacte 
                    git add . 
                    git commit -m "first commit"
                    git branch -M main
                 
                    git push -u origin main
                fi 
                
                '''
            }
           
        }

  stage('Docker Build and Tag') {
           steps {
              
                sh 'docker build -t samplewebapp:latest .' 
                sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:latest'
                //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
          }
        }
     
  stage('Publish image to Docker Hub') {
          
            steps {
        withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
          sh  'docker push nikhilnidhi/samplewebapp:latest'
        //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
        }
                  
          }
        }
     
      stage('Run Docker container on Jenkins Agent') {
             
            steps 
			{
                sh "docker run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
        }
 stage('Run Docker container on remote hosts') {
             
            steps {
                sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
            }
        }
    }
	}
    
