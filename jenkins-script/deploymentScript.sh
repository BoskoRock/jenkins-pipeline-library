node {
  {
  	def bool = env.isHuman
	if(bool == 'true'){
		println("Hello " + env.Human)
	} else {
		println("Hello world")
		}
  }
    
}
