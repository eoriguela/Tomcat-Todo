FROM quay.io/centos/centos:stream9

LABEL maintainer="ezequiel.origuela1@gmail.com"

RUN dnf install -y java-11-openjdk && dnf clean all

RUN mkdir /opt/tomcat

RUN curl -O https://downloads.apache.org/tomcat/tomcat-9/v9.0.91/bin/apache-tomcat-9.0.91.tar.gz && tar xvfz apache*.tar.gz && mv apache-tomcat-8.5.100/* /opt/tomcat/.

ADD todo.war /opt/tomcat/webapps/

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
