node {	
	stage("Clone WebGoat repo"){
		sh "rm -r WebGoat"
		sh "git clone https://github.com/BoskoRock/WebGoat.git"
		sh "ls"
	}
	stage("Build WebGoat application"){
		// build Webgoat using maven
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
