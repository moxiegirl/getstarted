+++
title = "Test your new image"
description = "Getting started with Docker"
keywords = ["beginner, tutorial, Docker"]
[menu.linux]
identifier = "linux_test"
weight = 7
+++

# Step 7: Test your new image

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

