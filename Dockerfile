# ✅ 베이스 이미지로 RockyLinux 9 사용
FROM rockylinux:9

# ✅ Java 설치
RUN yum install -y java-1.8.0-openjdk wget unzip && yum clean all

# ✅ Tomcat 9.0.85 다운로드 및 설치
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar xzvf apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85 /opt/tomcat && \
    chmod +x /opt/tomcat/bin/*.sh

# ✅ JSP 및 WAR 파일 복사
COPY hello.jsp /opt/tomcat/webapps/ROOT/hello.jsp
COPY example.war /opt/tomcat/webapps/example.war

# ✅ 포트 58080으로 변경된 Tomcat 설정 복사
COPY server.xml /opt/tomcat/conf/server.xml

# ✅ 포트 개방
EXPOSE 58080

# ✅ 톰캣 실행
CMD ["/opt/tomcat/bin/catalina.sh", "run"]

