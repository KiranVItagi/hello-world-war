# Use the official Tomcat image as the base
FROM tomcat:9.0

# Set working directory inside the container
WORKDIR /usr/local/tomcat/webapps/

# Copy the WAR file from the build context to the Tomcat webapps directory
COPY target/hello-world-war-1.0.0.war hello-world.war

# Change Tomcat default port from 8080 to 8081
RUN sed -i 's/port="8080"/port="8081"/g' /usr/local/tomcat/conf/server.xml

# Expose port 8081 for accessing Tomcat
EXPOSE 8081

# Start Tomcat when the container starts
CMD ["catalina.sh", "run"]
