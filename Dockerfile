# Ionic 2 developer container
# docker run -ti --rm -p 8100:8100 -p 35729:35729 -v $PWD:/myApp my freshly created container
# then use ionic serve on localhost:8100

FROM ubuntu:16.04

MAINTAINER SeanKerr <bullrout@gmail.com>

# Set one or more individual labels
LABEL Description="Ionic 2 Framework docker container"
LABEL Volumes="/myApp"
LABEL Ports="8100, 35729"
LABEL Ionic_Framework_Version="3.1.1"
LABEL Ionic_CLI_Version="2.2.3"
LABEL Ionic_App_Lib_Version="2.2.1"
LABEL Ionic_App_Script_Version="1.3.7"
LABEL Node_Version="7.x"
LABEL release-date="2017-04-28"
LABEL is-production="False"

RUN apt-get update && apt-get install -y -q curl

#
RUN curl -sL https://deb.nodesource.com/setup_7.x | bash -

# install nodejs, npm and git
RUN apt-get install -y -q \
            nodejs \
            git \
            && apt-get -y autoclean \
            && rm -rf /var/lib/apt/lists/*

# install ionic, cordova, typescript, gulp
RUN npm install -g -y ionic
RUN npm install -g -y cordova
RUN npm install -g -y typescript
RUN npm install -g -y gulp

RUN echo ' ' >> /Readme.txt
RUN echo ' NOTE: Do not run npm update -g npm ... reinstalling npm v3 fails on Docker' >> /Readme.txt

RUN echo 'cd /myApp' > /start.sh
RUN echo 'cat /Readme.txt' >> /start.sh

WORKDIR /myApp

RUN npm install -g -y cordova


EXPOSE 8100 35729

