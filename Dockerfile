# Java 7
#
# VERSION               1.0

FROM wederbrand/base
MAINTAINER Andreas Wederbrand andreas@wederbrand.se

# Accept oracle license
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections

# Add source repositories 
RUN add-apt-repository ppa:webupd8team/java
RUN apt-get update
RUN apt-get install -y oracle-java7-installer

# Remove useless files
RUN rm -rf /var/lib/apt/lists/*
RUN rm -rf /var/cache/oracle-jdk7-installer

# set JAVA_HOME
ENV JAVA_HOME /usr/lib/jvm/java-7-oracle

USER root
CMD bash
