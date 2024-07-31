# Use a base image that supports Java and Apache Tomcat
FROM tomcat:8.5-jdk8-openjdk

# Remove the default Tomcat webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy the webapp.war file to the webapps directory of Tomcat
COPY /webapp/target/webapp.war /usr/local/tomcat/webapps/

# Expose the default Tomcat port (8080)
EXPOSE 8080

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
