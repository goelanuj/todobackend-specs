FROM node:latest
MAINTAINER Anuj Goel <anuj_goel@homedepot.com>

# Prevent dpkg errors
ENV TERM=xterm-256color

# Set mirrors to NZ
# RUN sed -i "s/http:\/\/archive./http:\/\/nz.archive./g" /etc/apt/sources.list 

# Install node.js

RUN apt-get update

#    apt-get install curl -y && \
#    curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash - && \
#    apt-get install -y nodejs

COPY . /app
WORKDIR /app

# Install application dependencies
RUN npm install -g mocha && npm install chai && npm install mocha-jenkins-reporter && \
npm audit fix
#    npm install -g chai && \
#    npm install -g mocha-junit-reporter

# Set mocha test runner as entrypoint
ENTRYPOINT ["mocha"]