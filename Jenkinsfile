pipeline {
    agent any
	
	  tools
    {
       maven "Maven"
    }
 stages {
	 stage('Execute Maven') {
           steps {
             
                sh 'mvn clean install'             
          }
        }
        
  stage('Publish Artifact') {
            steps {
                script {
                    withAWS(region:'us-east-1', credentials:'s3-profile') {
                        s3Upload(file:'LoginWebApp-1.war', bucket:'artifact-bucket-665693299603-us-east-1', path:'target/*-1.war')
                    }
           
        }

//   stage('Docker Build and Tag') {
//            steps {
              
//                 sh 'docker build -t samplewebapp:latest .' 
//                 sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:latest'
//                 //sh 'docker tag samplewebapp nikhilnidhi/samplewebapp:$BUILD_NUMBER'
               
//           }
//         }
     
//   stage('Publish image to Docker Hub') {
          
//             steps {
//         withDockerRegistry([ credentialsId: "dockerHub", url: "" ]) {
//           sh  'docker push nikhilnidhi/samplewebapp:latest'
//         //  sh  'docker push nikhilnidhi/samplewebapp:$BUILD_NUMBER' 
//         }
                  
//           }
//         }
     
//       stage('Run Docker container on Jenkins Agent') {
             
//             steps 
// 			{
//                 sh "docker run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
//             }
//         }
//  stage('Run Docker container on remote hosts') {
             
//             steps {
//                 sh "docker -H ssh://jenkins@172.31.28.25 run -d -p 8003:8080 nikhilnidhi/samplewebapp"
 
//             }
//         }
            }
    }
	}
}
    
