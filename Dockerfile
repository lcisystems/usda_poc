FROM tomcat:latest

LABEL maintainer="Rana Ziauddin"

ADD ./target/*-1.war /usr/local/tomcat/webapps/

EXPOSE 8080

CMD ["catalina.sh", "run"]
