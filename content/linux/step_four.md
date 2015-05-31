+++
title = "Build your own image"
description = "Compose CLI reference"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.linux]
identifier = "linux_image"
weight = 4
+++

# Step 4: Build your own image

The `whalesay` image could be improved. It would be nice if you didn't have to think of
something to say. In this next section, you create your own software that does just that.


1. Create a text file called `Dockerfile` in your current directory.

	You can use any text editor for example, `vi` or `nano` to do this.

2. Open a your Dockerfile file.

	A Dockerfile describes the software that is "baked" into an image. It isn't
	just ingredients tho, it can tell the software what environment to use or what
	commands to run. Your recipe is going to be very short.

3. Add a line to the file like this:

		FROM moxiegirl/whalesay:latest
		
	The FROM keyword tells Docker which image your image is based on. Whalesay is cute and has the `cowsay`
	program already, so we'll start there.	
		
4. Now, add the `fortunes` program to the image.

	 	RUN apt-get -y update && apt-get install -y fortunes
	 
	 The `fortunes` program has a command that prints out wise sayings for our
	 whale to say. So, the first step is to install it. This line installs the
	 software into the image.
	 
5. Once the image has the software it needs, you instruct the software to run
when the image is loaded.

		CMD /usr/games/fortune -a | cowsay

 	This line tells the `fortune` program to pass a nifty quote to the `cowsay` program.
		
5. Check your work, your file should look like this:

		FROM moxiegirl/whalesay:latest
		RUN apt-get -y update && apt-get install -y fortunes
		CMD /usr/games/fortune -a | cowsay
		
5. Save and close your Dockerfile.

	At this point, you have all your software ingredients and behaviors described
	in a Dockerfile. You are ready to build a new image.

6. Build your new image.

		$ docker build -t docker-whale .
		
	The `build` subcommand takes the Dockerfile in the current directory, and
	builds a software image. The output of the command looks really long and complex.

	First Docker checks to make sure it has the context it needs to build. 
		Sending build context to Docker daemon 3.072 kB
		Sending build context to Docker daemon 
	
	Then, Docker loads with the `whalesay` image.	It already has this image
	locally because you just ran it. So, Docker doesn't load it.
		
		Step 0 : FROM moxiegirl/whalesay:latest
		 ---> fb434121fc77
		
	Docker moves onto the next step which is to update the package manager's
	list of software repositories. This takes a lot of lines, no need to list
	them all again here.

		Step 1 : RUN apt-get -y update && apt-get install -y fortunes
		 ---> Running in 27d224dfa5b2
		Ign http://archive.ubuntu.com trusty InRelease
		Ign http://archive.ubuntu.com trusty-updates InRelease
		Ign http://archive.ubuntu.com trusty-security InRelease
		Hit http://archive.ubuntu.com trusty Release.gpg
		....snip...
		Get:15 http://archive.ubuntu.com trusty-security/restricted amd64 Packages [14.8 kB]
		Get:16 http://archive.ubuntu.com trusty-security/universe amd64 Packages [134 kB]
		Reading package lists...
 		---> eb06e47a01d2
		
	Then, Docker installs the new `fortunes` software.
		
		Removing intermediate container e2a84b5f390f
		Step 2 : RUN apt-get install -y fortunes
		 ---> Running in 23aa52c1897c
		Reading package lists...
		Building dependency tree...
		Reading state information...
		The following extra packages will be installed:
			fortune-mod fortunes-min librecode0
		Suggested packages:
			x11-utils bsdmainutils
		The following NEW packages will be installed:
			fortune-mod fortunes fortunes-min librecode0
		0 upgraded, 4 newly installed, 0 to remove and 3 not upgraded.
		Need to get 1961 kB of archives.
		After this operation, 4817 kB of additional disk space will be used.
		Get:1 http://archive.ubuntu.com/ubuntu/ trusty/main librecode0 amd64 3.6-21 [771 kB]
		...snip......
		Setting up fortunes (1:1.99.1-7) ...
		Processing triggers for libc-bin (2.19-0ubuntu6.6) ...
		 ---> c81071adeeb5
		Removing intermediate container 23aa52c1897c
		Step 3 : CMD /usr/games/fortune -a | cowsay
		 ---> Running in a8e6faa88df3
		 ---> 7d9495d03763
		Removing intermediate container a8e6faa88df3
		Successfully built 7d9495d03763
		
	Finally, Docker runs the last command and finishes the build.		

		Step 3 : CMD /usr/games/fortune -a | cowsay
		 ---> Running in a8e6faa88df3
		 ---> 7d9495d03763
		Removing intermediate container a8e6faa88df3
		Successfully built 7d9495d03763

7. List your new image to make sure you have it locally.

		$ docker images
		REPOSITORY           TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
		docker-whale         latest              7d9495d03763        4 minutes ago       273.7 MB
		moxiegirl/whalesay   latest              fb434121fc77        4 hours ago         247 MB
		hello-world          latest              91c95931e552        5 weeks ago         910 B

8. Run your new image.

		$ docker run docker-whale
		 _________________________________________ 
		/ "He was a modest, good-humored boy. It  \
		\ was Oxford that made him insufferable." /
		 ----------------------------------------- 
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

	As you can see, you've made the whale a lot smarter. 