node {	
	tools{
		maven 'Maven 3.8.5' 
        	jdk 'jdk8'
	}
	stage("Clone WebGoat repo"){
		sh "rm -r WebGoat"
		sh "git clone https://github.com/BoskoRock/WebGoat.git"
		sh "ls"
	}
	stage("Build WebGoat application"){
		dir("${env.WORKSPACE}/WebGoat"){
   			 sh "pwd"
			 sh "ls"
			 sh "mvn clean install"
		}
	}
	stage("Run tests"){
		// run unit tests
	}
	stage("Push image"){
		// push image to public docker-hub
	}
	stage("Deploy to swarm"){
		// deploy to swarm
	}
    
}
