#
# See the top level Makefile in https://github.com/docker/docker for usage.
#
FROM ubuntu:latest
MAINTAINER Mary Anthony <mary@docker.com> (@moxiegirl)

RUN apt-get update \
	&& apt-get install -y \
		gettext \
		git \
		wget \
		libssl-dev \
		make \
		python-dev \
		python-pip \
		python-setuptools \
		vim-tiny 



# Required to publish the documentation.
# The 1.4.4 version works: the current versions fail in different ways
# TODO: Test to see if the above holds true
RUN pip install awscli==1.4.4 pyopenssl==0.12

ENV HUGO_VERSION 0.13
RUN wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_amd64.tar.gz
RUN tar -zxvf hugo_${HUGO_VERSION}_linux_amd64.tar.gz
RUN mv hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/local/bin/hugo

#######################
# Copy the content and theme to the container
#######################
WORKDIR /docs
COPY . /docs

EXPOSE 8000






