pipeline {	
	agent any
	tools{
		maven 'maven' 
	}
	stages{
		stage("Clone WebGoat repo"){
			steps{
				sh "rm -r maven-simple"
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
				dir("${env.WORKSPACE}/maven-simple"){
					 sh "pwd"
					 sh "ls"
					 sh "docker build -v /var/run/docker.sock:/var/run/docker.sock -t my-web-app -f ${env.WORKSPACE}/jenkins-script/Dockerfile ."
				}
			}
		}
		stage("Push to docker hub"){
			// deploy to swarm
			steps{
				sh "docker push -v /var/run/docker.sock:/var/run/docker.sock boskorock/simple-app-testing"
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
