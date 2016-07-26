FROM ubuntu:14.04
MAINTAINER Kraets
RUN apt-get update && apt-get upgrade
ARG DEBIAN_FRONTEND=noninteractive
COPY requirements.txt .
RUN apt-get install -y snmp 
RUN apt-get -y install libxml2-dev libxslt1-dev python-dev
RUN apt-get -y install zlib1g-dev
RUN apt-get -y install python-pip python-dev build-essential
RUN easy_install --upgrade pip
RUN pip install -r requirements.txt
RUN add-apt-repository -y ppa:webupd8team/java
RUN apt-get install -y software-properties-common
RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main
RUN deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main"> /etc/apt/sources.list.d/java-8-debian.list
RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys EEA14886
RUN apt-get update
RUN apt-get -y install oracle-java8-installer
RUN apt-get install -y libsnmp-dev snmp-mibs-downloader
RUN pip install easysnmp
