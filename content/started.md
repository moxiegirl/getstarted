+++
title = "Get Started with Docker"
description = "Compose CLI reference"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.main]
	parent= "smn_compose_ref"
+++

# Get Started with Docker

This tutorial introduces fundamental Docker features by walking you through some
simple tasks. These tasks include:

* installing Docker
* running a software image in a container
* browsing for an image on Docker Hub
* creating your own image and running it in a container
* creating a Docker Hub account and repository
* pushing your image to Docker Hub for others to use

While Docker has a graphical interface called Kitematic, this
tutorial uses the command line which is available on every major distribution.

## Step 1: Install docker

1. Log into your Ubuntu installation as a user with `sudo` privileges.

2. Verify that you have `wget` installed.

        $ which wget

    If `wget` isn't installed, install it after updating your manager:

        $ sudo apt-get update
        $ sudo apt-get install wget

3. Get the latest Docker package.

        $ wget -qO- https://get.docker.com/ | sh

    The system prompts you for your `sudo` password. Then, it downloads and
    installs Docker and its dependencies.
>**Note**: If your company is behind a filtering proxy, you may find that the
>`apt-key`
>command fails for the Docker repo during installation. To work around this,
>add the key directly using the following:
>
>       $ wget -qO- https://get.docker.com/gpg | sudo apt-key add -

4. Verify `docker` is installed correctly.

		$ docker run hello-world
		Unable to find image 'hello-world:latest' locally
		511136ea3c5a: Pull complete
		31cbccb51277: Pull complete
		e45a5af57b00: Pull complete
		hello-world:latest: The image you are pulling has been verified.
		Important: image verification is a tech preview feature and should not be
		relied on to provide security.
		Status: Downloaded newer image for hello-world:latest
		Hello from Docker.
		This message shows that your installation appears to be working correctly.

		To generate this message, Docker took the following steps:
		1. The Docker client contacted the Docker daemon.
		2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
			 (Assuming it was not already locally available.)
		3. The Docker daemon created a new container from that image which runs the
			 executable that produces the output you are currently reading.
		4. The Docker daemon streamed that output to the Docker client, which sent it
			 to your terminal.

		To try something more ambitious, you can run an Ubuntu container with:
		$ docker run -it ubuntu bash

		For more examples and ideas, visit:
		http://docs.docker.com/userguide/

  This command downloads a test image and runs it in a container.

##  Step 2: Understand images and containers

As the last step in your installation, your ran the `docker run` command. With this one command, you just completed three core tasks to working with Docker. The command you ran had three parts.

{{< figure src="/img/container_explainer.png" >}}

A *container* is a stripped-to-basics version of a Linux operating system. An *image* is software you load into a container. When you ran the command, the Docker software:

* checked to see if you had the hello-world software image
* dowloaded the image from the Docker Hub (more about this later)
* loaded the image into the container and "ran" it

Depending on how it was built, an image might run a simple, single command and then exit. This is what `Hello-World` did. 

A Docker image, though, is capable of much more. An image can start software as complex as a database, wait for you (or someone else) to add data, store the data for later use, and then wait for the next person.

Who built the `hello-world` software image though? In this case, Docker did but anyone can. Docker lets people (or companies) create and share software through Docker images. Using Docker, you don't have to worry about whether your computer can run the software in an image &mdash; a Docker container *can always run it*. 

## Step 3: Locate the whalesay image 

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
	

## Step 4: Build your own image

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

## Step 5: Create a Docker Hub account and repository

You've built something really cool, you should share it. In this next section,
you'll do just that. You'll need a Docker Hub account. Then, you'll push your
image up to it so other people with Docker can run it.

1. Use your browser to navigate to [https://hub.docker.com/account/signup/](https://hub.docker.com/account/signup/).
	
	Your browser displays the Hub signup page.

2. Fill out the form on the signup page.

	Docker Hub is free. We do need a name, password, and email address.
		
3. Press **Signup**.

	The browser displays the welcome to DockerHub page
	
4. Before you can share anything on the hub, you need to verify your email address.

5. Go to your email box and look for the email titled `Please confirm email for your Docker Hub account`.

6. Open the emai.

7. Press the **Confirm Your Email** button.

	 The browser opens Docker Hub to your profile page.
	 
8. Choose **Add Repository*.

	The browser opens the **Add Repository** page.
	
9. Fill out the form.

	{{< figure src="/img/add_repository.png" >}}

10. Press **Add Repository** when you are done.

		Docker Hub creates your new repository.
		
## Step 6: Tag and push your image

In this section, you tag and push your `docker-whale` image.

1. Go back to your terminal.

2. List the images you currently have:

		REPOSITORY           TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
		docker-whale         latest              7d9495d03763        38 minutes ago      273.7 MB
		<none>               <none>              5dac217f722c        45 minutes ago      273.7 MB
		moxiegirl/whalesay   latest              fb434121fc77        4 hours ago         247 MB
		hello-world          latest              91c95931e552        5 weeks ago         910 B
		
3. Find the `IMAGE ID` for your `docker-whale` image. 

	In this example, the id is `7d9495d03763`.

	You'll notice that currently, the `REPOSITORY` shows the repository but not
	the namespace for `docker-whale`. You need to include the `namespace` for
	Docker Hub to associate it with your account.

6. Tag your `docker-whale` image.

		$ docker tag 7d9495d03763 maryatdocker/docker-whale:latest
	
7. List your images again to see your tag.

		$ docker images
		REPOSITORY                  TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
		maryatdocker/docker-whale   latest              7d9495d03763        About an hour ago   273.7 MB
		docker-whale                latest              7d9495d03763        About an hour ago   273.7 MB
		<none>                      <none>              5dac217f722c        About an hour ago   273.7 MB
		moxiegirl/whalesay          latest              fb434121fc77        5 hours ago         247 MB
		hello-world                 latest              91c95931e552        5 weeks ago         910 B

8. Push your image to your new repository.

	Docker prompts you to enter your username/password/email for Docker Hub.

		$ docker push maryatdocker/docker-whale
			The push refers to a repository [maryatdocker/docker-whale] (len: 1)
			7d9495d03763: Image push failed 

			Please login prior to push:
			Username: maryatdocker
			Password: 
			Email: mary@docker.com
			WARNING: login credentials saved in /Users/mary/.dockercfg.
			Login Succeeded
			The push refers to a repository [maryatdocker/docker-whale] (len: 1)
			7d9495d03763: Image already exists 
			c81071adeeb5: Image successfully pushed 
			eb06e47a01d2: Image successfully pushed 
			fb434121fc77: Image successfully pushed 
			5d5bd9951e26: Image successfully pushed 
			99da72cfe067: Image successfully pushed 
			1722f41ddcb5: Image successfully pushed 
			5b74edbcaa5b: Image successfully pushed 
			676c4a1897e6: Image successfully pushed 
			07f8e8c5e660: Image successfully pushed 
			37bea4ee0c81: Image successfully pushed 
			a82efea989f9: Image successfully pushed 
			e9e06b06e14c: Image successfully pushed 
			Digest: sha256:ad89e88beb7dc73bf55d456e2c600e0a39dd6c9500d7cd8d1025626c4b985011
			
9. Return to your profile on Docker Hub to see your new image.

	{{< figure src="/img/new_image.png" >}}
	
## Step 8: Test your new image

In this last section, you'll pull the image you just pushed to hub.

1. List the images you have.

		$ docker images
		REPOSITORY                  TAG                 IMAGE ID            CREATED             VIRTUAL SIZE
		maryatdocker/docker-whale   latest              7d9495d03763        About an hour ago   273.7 MB
		docker-whale                latest              7d9495d03763        About an hour ago   273.7 MB
		<none>                      <none>              5dac217f722c        About an hour ago   273.7 MB
		moxiegirl/whalesay          latest              fb434121fc77        5 hours ago         247 MB
		ubuntu                      latest              07f8e8c5e660        3 weeks ago         188.3 MB
		hello-world                 latest              91c95931e552        5 weeks ago         910 B
		
2. Remove the two `docker-whale` images.

	You can use an ID or the name to remove an image.

		$ docker rmi 7d9495d03763
		$ docker rmi docker-whale

3. Run the image you just pushed in a container.

	Since the image is no longer available on your local system, Docker downloads it.

		$ docker run maryatdocker/docker-whale
		Unable to find image 'maryatdocker/docker-whale:latest' locally
		latest: Pulling from maryatdocker/docker-whale
		eb06e47a01d2: Pull complete 
		c81071adeeb5: Pull complete 
		7d9495d03763: Already exists 
		e9e06b06e14c: Already exists 
		a82efea989f9: Already exists 
		37bea4ee0c81: Already exists 
		07f8e8c5e660: Already exists 
		676c4a1897e6: Already exists 
		5b74edbcaa5b: Already exists 
		1722f41ddcb5: Already exists 
		99da72cfe067: Already exists 
		5d5bd9951e26: Already exists 
		fb434121fc77: Already exists 
		Digest: sha256:ad89e88beb7dc73bf55d456e2c600e0a39dd6c9500d7cd8d1025626c4b985011
		Status: Downloaded newer image for maryatdocker/docker-whale:latest
		 ________________________________________ 
		/ Having wandered helplessly into a      \
		| blinding snowstorm Sam was greatly     |
		| relieved to see a sturdy Saint Bernard |
		| dog bounding toward him with the       |
		| traditional keg of brandy strapped to  |
		| his collar.                            |
		|                                        |
		| "At last," cried Sam, "man's best      |
		\ friend -- and a great big dog, too!"   /
		 ---------------------------------------- 
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


## Where to go next

You've completed the Docker Getting Started tutorial. You've done a lot, you've:

* installed Docker
* run a software image in a container
* located an interesting image on Docker Hub
* run the image on your own machine
* modified an image to create your own and run it
* create a Docker Hub account and repository
* pushed your image to Docker Hub for others to share

You've only scratched the surface of what Docker can do. To learn more, go onto
to view the  [Docker User Guide](http://docs.docker.com) in our documentation.
	
	