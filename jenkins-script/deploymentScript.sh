pipeline {	
	agent any
	tools{
		maven 'maven' 
	}
	 environment { 
                registry = "boskorock/simple-app-testing" 
                registryCredential = 'docker_hub_id' 
                dockerImage = '' 
    }
	stages{
		stage("Clone WebGoat repo"){
			steps{
				//sh "rm -r maven-simple"
				sh "java -version"
				sh "git clone https://github.com/jitpack/maven-simple.git"
				sh "ls"
			}
		}
		stage("Build WebGoat application"){
			steps{
				dir("${env.WORKSPACE}/maven-simple"){
					 sh "pwd"
					 sh "ls"
					 sh "mvn clean install"
				}
			}
		}
		stage("Run tests"){
			// run unit tests
			steps{
				dir("${env.WORKSPACE}/maven-simple"){
					 sh "pwd"
					 sh "ls"
					 sh "mvn clean test"
				}
			}
		}
		stage("Create image"){
			
			steps{
				script{
					dockerImage = docker.build registry + ":$BUILD_NUMBER"
				}
			}
		}
		stage("Push to docker hub"){
			// deploy to swarm
			steps{
				script {
					docker.withRegistry('', registryCredential){
						dockerImage.push()
					}
				}
			}
		}
		stage("Run new container"){
			// deploy to swarm
			steps{
				sh "docker run -v /var/run/docker.sock:/var/run/docker.sock boskorock/simple-app-testing:lts"
			}
		}
	}
    
}
