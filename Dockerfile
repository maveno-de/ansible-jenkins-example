FROM ubuntu
MAINTAINER Dennis Rowe

RUN apt-get update
RUN apt-get -y install software-properties-common
RUN apt-add-repository ppa:ansible/ansible

RUN apt-get update
RUN apt-get -y install python3-pip python3-dev

RUN /usr/bin/pip3 install -U pip wheel setuptools ansible ansible-lint

RUN apt-get -y install rubygems-integration
RUN /usr/bin/gem install serverspec
RUN /usr/bin/gem install rake

# Required for Docker jenkins plugin
RUN apt-get -y install openssh-server
RUN mkdir /var/run/sshd
RUN apt-get -y install openjdk-6-jdk
RUN useradd jenkins
# This is not safe, this is a test
RUN echo "jenkins:xt4dFV4WdkURU3v8TRWu" | chpasswd
RUN echo "jenkins    ALL=NOPASSWD: ALL" >> /etc/sudoers
