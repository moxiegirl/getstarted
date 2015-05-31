+++
title = "Tag and push your image"
description = "Compose CLI reference"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.linux]
identifier = "linux_tag"
weight = 6
+++

# Step 6: Tag and push your image

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