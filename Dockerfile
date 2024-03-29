FROM ubuntu:bionic
RUN rm /bin/sh && ln -s /bin/bash /bin/sh

RUN apt-get update -y

RUN apt-get install -y build-essential libssl-dev curl

ENV NVM_DIR /usr/nvm

ENV NODE_VERSION 10.4.1

RUN mkdir -p $NVM_DIR

RUN curl --silent -o- https://raw.githubusercontent.com/creationix/nvm/v0.34.0/install.sh | bash

RUN source $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/v$NODE_VERSION/lib/node_modules

ENV PATH $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH

RUN npm i -g nodemon

WORKDIR /home/node/app
