# ✅ 베이스 이미지로 RockyLinux 9 사용
FROM rockylinux:9

# ✅ Java 설치 (OpenJDK 1.8), wget, unzip 포함
RUN yum install -y java-1.8.0-openjdk wget unzip && yum clean all

# ✅ Tomcat 9.0.85 다운로드 및 설치
RUN wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.85/bin/apache-tomcat-9.0.85.tar.gz && \
    tar xzvf apache-tomcat-9.0.85.tar.gz && \
    mv apache-tomcat-9.0.85 /opt/tomcat && \
    chmod +x /opt/tomcat/bin/*.sh

# ✅ JSP 테스트 페이지 복사: http://<IP>:30080/hello.jsp
COPY hello.jsp /opt/tomcat/webapps/ROOT/hello.jsp

# ✅ WAR 앱 1: ROOT.war을 /fm 경로로 배포 (http://<IP>:30080/fm/)
#COPY ROOT.war /opt/tomcat/webapps/fm.war

# ✅ WAR 앱 2: omniitcall.war을 /restful 경로로 배포 (http://<IP>:30080/call/)
COPY restfulServer.war /opt/tomcat/webapps/restful.war

# ✅ 포트 58080으로 설정된 Tomcat 구성 복사
COPY server.xml /opt/tomcat/conf/server.xml

# ✅ 컨테이너 포트 개방
EXPOSE 58080

# ✅ Tomcat 실행
CMD ["/opt/tomcat/bin/catalina.sh", "run"]
