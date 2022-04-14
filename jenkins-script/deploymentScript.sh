node {
  
  	//def bool = env.isHuman
	//if(bool == 'true'){
	//	println("Hello " + env.Human)
	//} else {
	//	println("Hello world")
	//	}
	
	stage("Clone WebGoat repo"){
		sh "git clone https://github.com/BoskoRock/WebGoat.git"
		sh "ls"
		sh "rm -r WebGoat"
	}
    
}
