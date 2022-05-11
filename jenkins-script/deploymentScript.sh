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
				sh "mvn test"
			}
		}
		stage("Create image"){
			
			steps{
				dir("${env.WORKSPACE}/maven-simple"){
					 sh "pwd"
					 sh "ls"
					 sh "docker build . -t my-web-app -f ${env.WORKSPACE}/jenkins-script/Dockerfile"
				}
			}
		}
		stage("Push to docker hub"){
			// deploy to swarm
			steps{
				sh "ls"
			}
		}
		stage("Run new container"){
			// deploy to swarm
			steps{
				sh "ls"
			}
		}
	}
    
}
