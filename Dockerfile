FROM rockylinux:9

RUN yum install -y java-1.8.0-openjdk wget unzip && yum clean all

RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar xzvf apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85 /opt/tomcat && \
    chmod +x /opt/tomcat/bin/*.sh

EXPOSE 8080
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

