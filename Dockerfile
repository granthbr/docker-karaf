FROM ubuntu:13.10
MAINTAINER brandon grantham <bgrantham@gmail.com>

RUN apt-get update
RUN apt-get install -y openjdk-7-jre-headless curl bsdtar
ENV JAVA_HOME /usr/lib/jvm/java-7-openjdk-amd64/jre


WORKDIR /opt

RUN curl --silent --output karaf.tar.gz http://repo2.maven.org/maven2/org/apache/karaf/apache-karaf/3.0.0/apache-karaf-3.0.0.tar.gz
RUN bsdtar -xzf karaf.tar.gz 
RUN mv apache-karaf-3.0.0 apache-karaf
RUN rm karaf.tar.gz
RUN mkdir messages 
WORKDIR /opt/apache-karaf

# lets remove the karaf.name by default so we can default it from env vars
#RUN sed -i '/karaf.name=root/d' etc/system.properties 

# lets add a user - should ideally come from env vars?
RUN echo >> etc/users.properties; \
		echo admin=admin,admin >> etc/users.properties 

# lets enable logging to standard out
RUN echo log4j.rootLogger=INFO, stdout, osgi:* >> org.ops4j.pax.logging.cfg 


RUN mkdir -p data/log; \
		echo >> data/log/karaf.log

#VOLUME ["/opt/apache-karaf/deploy"]
EXPOSE 8181 8101 1099 2181 9300 61616

CMD echo "starting Apache-Karaf container: " && /opt/apache-karaf/bin/karaf background
