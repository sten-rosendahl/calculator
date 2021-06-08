FROM node:14

RUN apt-get update
RUN apt-get install sudo

RUN adduser --disabled-password --gecos '' docker
RUN adduser docker docker
RUN adduser docker sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

USER docker

WORKDIR /home/docker/app

RUN sudo chown -R docker:docker /home/docker

COPY --chown=docker:docker . /home/docker/app

RUN npm install http-server

EXPOSE 8080
ENTRYPOINT [ "npx", "http-server" ]
