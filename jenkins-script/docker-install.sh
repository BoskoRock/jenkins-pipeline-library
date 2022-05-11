#!/bin/bash
 apt-get install -y \
    apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common 
curl -fsSL https://yum.dockerproject.org/gpg | apt-key add - 
 add-apt-repository \
    "deb https://apt.dockerproject.org/repo/ \
    ubuntu-$(lsb_release -cs) \
    main" 
 apt-get update
 apt-get -y install docker-engine 
# add current user to docker group so there is no need to use sudo when running docker
 usermod -aG docker $(whoami)
