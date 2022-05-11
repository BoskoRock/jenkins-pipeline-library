pipeline {	
	agent any
	tools{
		maven 'maven' 
	}
	stages{
		stage("Clone WebGoat repo"){
			steps{
				sh "rm -r simple-java-maven-app"
				sh "java -version"
				sh "git clone https://github.com/jenkins-docs/simple-java-maven-app.git"
				sh "ls"
			}
		}
		stage("Build WebGoat application"){
			steps{
				dir("${env.WORKSPACE}/simple-java-maven-app"){
					 sh "pwd"
					 sh "ls"
					 sh "mvn clean install"
				}
			}
		}
		stage("Run tests"){
			// run unit tests
			steps{
				sh "ls"
			}
		}
		stage("Push image"){
			// push image to public docker-hub
			steps{
				sh "ls"
			}
		}
		stage("Deploy to swarm"){
			// deploy to swarm
			steps{
				sh "ls"
			}
		}
	}
    
}
