+++
title = "Understand images and containers"
description = "Compose CLI reference"
keywords = ["fig, composition, compose, docker, orchestration, cli,  reference"]
[menu.linux]
identifier = "linux_understand"
weight = 2
+++

#  Step 2: Understand images and containers

As the last step in your installation, your ran the `docker run` command. With this one command, you just completed three core tasks to working with Docker. The command you ran had three parts.

{{< figure src="/img/container_explainer.png" >}}

A *container* is a stripped-to-basics version of a Linux operating system. An *image* is software you load into a container. When you ran the command, the Docker software:

* checked to see if you had the hello-world software image
* dowloaded the image from the Docker Hub (more about this later)
* loaded the image into the container and "ran" it

Depending on how it was built, an image might run a simple, single command and then exit. This is what `Hello-World` did. 

A Docker image, though, is capable of much more. An image can start software as complex as a database, wait for you (or someone else) to add data, store the data for later use, and then wait for the next person.

Who built the `hello-world` software image though? In this case, Docker did but anyone can. Docker lets people (or companies) create and share software through Docker images. Using Docker, you don't have to worry about whether your computer can run the software in an image &mdash; a Docker container *can always run it*. 