+++
title = "Locate and run the whalesay image "
description = "Compose CLI reference"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.linux]
identifier = "linux_locate"
weight = 3
+++

# Step 3: Locate and run the whalesay image 

It is very easy to create your own image. In this next section, you'll create your own image from one already shared on the Docker Hub.  Docker Hub is Docker website where the community gathers to share software images.

1. Use your browser to navigate to [http://hub.docker.com](http://hub.docker.com).

	The hub contains images from individuals like you and official images from
	organizations like RedHat, IBM, Google, and a whole lot more.

2. Enter the word `whalesay` in the search bar.

	You'll see that it returns a lot of images. We want the Official Image from
	Docker.

3. Change the filter to show only Official Images.

4. Navigate to the `whalesay` image.

	From the repository page, you see that the image installs a famous Linux
	program called `cowsay`. The `cowsay` program takes a word or phrase and
	prints out an ASCII image of a cow saying that word or phrase. In the case of
	the `whalesay` image, the Docker whale does the talking instead of a cow.

7. Back in your terminal, run the image in a container.

		$ docker run moxiegirl/whalesay cowsay boo
		Unable to find image 'moxiegirl/whalesay:latest' locally
		latest: Pulling from moxiegirl/whalesay
		e9e06b06e14c: Pull complete 
		a82efea989f9: Pull complete 
		37bea4ee0c81: Pull complete 
		07f8e8c5e660: Pull complete 
		676c4a1897e6: Pull complete 
		5b74edbcaa5b: Pull complete 
		1722f41ddcb5: Pull complete 
		99da72cfe067: Pull complete 
		5d5bd9951e26: Pull complete 
		fb434121fc77: Already exists 
		Digest: sha256:d6ee73f978a366cf97974115abe9c4099ed59c6f75c23d03c64446bb9cd49163
		Status: Downloaded newer image for moxiegirl/whalesay:latest
		 _____ 
		< boo >
		 ----- 
				\
				 \
					\     
												##        .            
									## ## ##       ==            
							 ## ## ## ##      ===            
					 /""""""""""""""""___/ ===        
			~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
					 \______ o          __/            
						\    \        __/             
							\____\______/   
							
		The first time you run a software image, the `docker` command looks for it
		on your local system. If the image isn't there, then `docker` gets it from
		the hub.

7. List the images on your local system.

		$ docker images
		REPOSITORY           TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
		moxiegirl/whalesay   latest              fb434121fc77        3 hours ago         247 MB
		hello-world          latest              91c95931e552        5 weeks ago         910 B

8. Run the `whalesay` image again.

		$ docker run moxiegirl/whalesay cowsay boo-boo
		 _________ 
		< boo-boo >
		 --------- 
				\
				 \
					\     
												##        .            
									## ## ##       ==            
							 ## ## ## ##      ===            
					 /""""""""""""""""___/ ===        
			~~~ {~~ ~~~~ ~~~ ~~~~ ~~ ~ /  ===- ~~~   
					 \______ o          __/            
						\    \        __/             
							\____\______/   
		
		This time `docker` found the local image and ran it for you.