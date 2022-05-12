pipeline {	
	agent any
	 environment { 
                registry = "boskorock/simple-app-testing" 
                registryCredential = 'docker_hub_id' 
                dockerImage = '' 
    }
	stages{
		stage("Clone repo"){
			steps{
				sh "rm -r maven-simple"
				sh "java -version"
				sh "git clone https://github.com/jitpack/maven-simple.git"
				sh "ls"
			}
		}
		stage("Build application"){
			steps{
				dir("${env.WORKSPACE}/maven-simple"){
					 sh "pwd"
					 sh "ls"
					 sh "mvn clean install"
					 sh "pwd"
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
		stage("Check what is in target folder"){
			steps{
				dir("${env.WORKSPACE}/maven-simple/target"){
					sh "pwd"
					sh"ls"
				}
			}
		}
		stage("Create image"){
			
			steps{
				script{
					dir("${env.WORKSPACE}/jenkins-script"){
						dockerImage = docker.build registry + ":$BUILD_NUMBER"
					}
				}
			}
		}
		stage("Push to docker hub"){
			steps{
				script {
					docker.withRegistry('', registryCredential){
						dockerImage.push()
					}
				}
			}
		}
		stage("Run new container"){
			steps{
				sh "docker run boskorock/simple-app-testing:lts"
			}
		}
	}
    
}
