FROM tomcat:9.0
RUN rm -rf /usr/local/tomcat/webapps/*
COPY /var/lib/jenkins/workspace/2131_wedding_lite/* /usr/local/tomcat/webapps/ROOT/
EXPOSE 8087
CMD [ "executable", "run" ]
