pipeline {	
	agent any
	tools{
		maven 'maven' 
        	jdk 'java'
	}
	stages{
		stage("Clone WebGoat repo"){
			steps{
				sh "rm -r WebGoat"
				sh "git clone https://github.com/BoskoRock/WebGoat.git"
				sh "ls"
			}
		}
		stage("Build WebGoat application"){
			steps{
				dir("${env.WORKSPACE}/WebGoat"){
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
