node {
  
  	//def bool = env.isHuman
	//if(bool == 'true'){
	//	println("Hello " + env.Human)
	//} else {
	//	println("Hello world")
	//	}
	
	stage("Clone WebGoat repo"){
		sh "rm -r WebGoat"
		sh "git clone https://github.com/BoskoRock/WebGoat.git"
		sh "ls"
	}
	stage("Build WebGoat application"){
	        sh "export MAVEN_HOME=/usr/share/maven"
                sh "export PATH=$PATH:$MAVEN_HOME/bin"
                sh "mvn --version"
		sh "cd WebGoat"
		sh "ls"
	    sh "mvn clean install"
	}
    
}
