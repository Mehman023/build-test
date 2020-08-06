FROM centos:centos7



LABEL description="This is a base image to build and run apps"


ENV JAVA_HOME=/usr
ENV LANG=en_US.UTF-8
ENV NAME=NARIMAN

RUN yum update -y
