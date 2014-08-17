FROM ubuntu
 
 
MAINTAINER Brandon Grantham <brandon.grantham@gmail.com>

RUN sed 's/main$/main universe/' -i /etc/apt/sources.list
RUN apt-get update
RUN apt-get upgrade -y

RUN apt-get install -y python-software-properties 
RUN	apt-get install software-properties-common python-software-properties -y 
RUN add-apt-repository ppa:webupd8team/java -y 
RUN apt-get update 
RUN echo oracle-java7-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections 
RUN apt-get install -y oracle-java7-installer 
RUN	apt-get -y install curl telnet vim inetutils-ping 
WORKDIR /opt

RUN curl -L http://repository.apache.org/content/repositories/snapshots/org/apache/activemq/apache-activemq/5.10-SNAPSHOT/apache-activemq-5.10-20140603.133406-78-bin.tar.gz | tar xzv
RUN mv apache-activemq-5.10-SNAPSHOT apache-activemq-5.10
RUN	ln -sf /opt/apache-activemq-5.10 /opt/activemq 
RUN	ln -sf /opt/activemq/bin/activemq /etc/init.d/ 
RUN	update-rc.d activemq defaults 
RUN	/etc/init.d/activemq setup /etc/default/activemq 

# Use our own /etc/default/activemq to activate jmx
ADD etc/default /etc/default

# Use our own activemq.xml config
ADD conf apache-activemq-5.10/conf

RUN chmod 600 activemq/conf/jmx.password

EXPOSE 6155 6156 61616 61617 1099 8161

CMD java -Xmx1G -Dcom.sun.management.jmxremote.ssl=false -Dcom.sun.management.jmxremote.password.file=/opt/activemq/conf/jmx.password -Dcom.sun.management.jmxremote.access.file=/opt/activemq/conf/jmx.access -Djava.util.logging.config.file=logging.properties -Dcom.sun.management.jmxremote -Djava.io.tmpdir=/opt/activemq/tmp -Dactivemq.classpath=/opt/activemq/conf -Dactivemq.home=/opt/activemq -Dactivemq.base=/opt/activemq -Dactivemq.conf=/opt/activemq/conf -Dactivemq.data=/opt/activemq/data -jar /opt/activemq/bin/activemq.jar start