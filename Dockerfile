# Dockerfile
FROM tomcat:latest

ENV CATALINA_HOME /usr/local/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

COPY /target/party.war /usr/local/tomcat

EXPOSE 8080

CMD ["catalina.sh","run"]