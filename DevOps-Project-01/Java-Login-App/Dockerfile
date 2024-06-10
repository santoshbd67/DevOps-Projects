# Use an official Maven image to build the application
FROM maven:3.6.3-jdk-8 as build

# Set the working directory in the container
WORKDIR /app

# Copy the pom.xml and download dependencies
COPY pom.xml /app/
RUN mvn dependency:go-offline

# Copy the rest of the application source code and build the application
COPY src /app/src
RUN mvn package -DskipTests

# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-slim

# Set the working directory in the container
WORKDIR /app

# Copy the application.properties file
COPY src/main/resources/application.properties /app/application.properties

# Copy the WAR file from the build stage
COPY --from=build /app/target/*.war /app/dptweb.war

# Expose the port that the application runs on
EXPOSE 8080

# Define the command to run the application
CMD ["java", "-Dspring.config.location=/app/application.properties", "-jar", "dptweb.war"]

