From ubuntu:latest

# the base image is minimized
RUN apt-get update && yes | unminimize 

# avoid Configuring tzdata
ENV DEBIAN_FRONTEND noninteractive

# iproute2 is the modern replacement for the old net-tools package and is the standard for network management in modern Linux distributions. 
RUN apt-get install -y vim man curl iproute2 netcat-openbsd python3 && apt-get clean

WORKDIR /home/ubuntu
CMD ["/bin/bash"]

