+++
title = "Tag, push, & pull your image"
description = "Compose CLI reference"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.mac]
identifier = "mac_tag"
weight = 6
+++

# Tag, push, and pull your image

In this section, you tag and push your `docker-whale` image to your newly
created repository. When you are done, you test the repository by pulling your
new image.

## Step 1: Open a Boot2Docker terminal 

If you don't already have a terminal open, open one now:

1. Open the **Launchpad** and locate the Boot2Docker icon.

    ![Launchpad](/mac/images/applications_folder.png)
    
2. Click the icon to launch a Boot2Docker terminal.

   Just leave the terminal open on your desktop, you'll be using it in a moment.


## Step 2: Tag and push the image

1. Place your cursor at the prompt in the Boot2Docker terminal window.

2. Type `docker images` to list the images you currently have:

    $ docker images
		REPOSITORY           TAG          IMAGE ID            CREATED             VIRTUAL SIZE
		docker-whale         latest       7d9495d03763        38 minutes ago      273.7 MB
		<none>               <none>       5dac217f722c        45 minutes ago      273.7 MB
		moxiegirl/whalesay   latest       fb434121fc77        4 hours ago         247 MB
		hello-world          latest       91c95931e552        5 weeks ago         910 B
		
3. Find the `IMAGE ID` for your `docker-whale` image. 

	In this example, the id is `7d9495d03763`.

	You'll notice that currently, the `REPOSITORY` shows the repository but not
	the namespace for `docker-whale`. You need to include the `namespace` for
	Docker Hub to associate it with your account.  The `namespace` is the same as
	your account name.

6. Use `IMAGE ID` and the `docker tag` command to tag your `docker-whale` image.

    The command you type looks like this:
    
    {{< figure src="/img/tagger.png" >}}
    
    Of course, your account name will be your own. So, you type the command with
    your image's ID and your account name and press RETURN.

		$ docker tag 7d9495d03763 maryatdocker/docker-whale:latest
	
7. Type the `docker images` command again to see your newly tagged image.

		$ docker images
		REPOSITORY                  TAG       IMAGE ID        CREATED          VIRTUAL SIZE
		maryatdocker/docker-whale   latest    7d9495d03763    5 minutes ago    273.7 MB
		docker-whale                latest    7d9495d03763    2 hours ago      273.7 MB
		<none>                      <none>    5dac217f722c    5 hours ago      273.7 MB
		moxiegirl/whalesay          latest    fb434121fc77    5 hours ago      247 MB
		hello-world                 latest    91c95931e552    5 weeks ago      910 B

8. Type the `docker push` command to push your image to your new repository.

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
	
# Step 3: Pull your new image

In this last section, you'll pull the image you just pushed to hub.

1. Place your cursor at the prompt in the Boot2Docker terminal window.

2. Type `docker images` to list the images you currently have on your local machine.

		$ docker images
		REPOSITORY                  TAG       IMAGE ID        CREATED          VIRTUAL SIZE
		maryatdocker/docker-whale   latest    7d9495d03763    5 minutes ago    273.7 MB
		docker-whale                latest    7d9495d03763    2 hours ago      273.7 MB
		<none>                      <none>    5dac217f722c    5 hours ago      273.7 MB
		moxiegirl/whalesay          latest    fb434121fc77    5 hours ago      247 MB
		hello-world                 latest    91c95931e552    5 weeks ago      910 B

    To make a good test, you need to remove the `maryatdocker/docker-whale` and
   `docker-whale` images from your local system. Removing them forces the next
   `docker pull` to get the image from your repository.
    
2. Use the `docker rmi` to remove the `maryatdocker/docker-whale` and `docker-whale` 
images.

	You can use an ID or the name to remove an image.

		$ docker rmi 7d9495d03763
		$ docker rmi docker-whale
		
3. Pull a new image from your repository using the `docker pull` command.

    The command you type should include your username from Docker Hub.

         docker pull yourusername/docker-whale

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

## Congratulations you completed the Docker Demo

You've done a lot, you've done all of the following fundamental Docker tasks.

* installed Docker
* run a software image in a container
* located an interesting image on Docker Hub
* run the image on your own machine
* modified an image to create your own and run it
* create a Docker Hub account and repository
* pushed your image to Docker Hub for others to share

You've only scratched the surface of what Docker can do. For example, you've
only used the Docker Engine which is the core product in our platform. You can
investigate other [Docker Products](http:/www.docker.com/products). To try more
advanced Docker tasks, view the [Docker User Guide](http://docs.docker.com) in
our documentation.