FROM centos:7
RUN yum -y update i
RUN yum -y install java
RUN java -version
WORKDIR /tmp
ADD https://dlcdn.apache.org/tomcat/tomcat-9/v9.0.65/bin/apache-tomcat-9.0.65.tar.gz .
RUN tar -xvf apache-tomcat-9.0.65.tar.gz
RUN mv apache-tomcat-9.0.65 tomcat9
COPY ./webapp/target/webapp.war ./tomcat9/webapps/
CMD [ "/tmp/tomcat9/bin/catalina.sh","run" ]
