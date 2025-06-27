# 1. Build stage
FROM maven:3.9.5-eclipse-temurin-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 2. Runtime stage
FROM tomcat:latest
# Remove default apps
RUN rm -rf /usr/local/tomcat/webapps/*
# Copy WAR to ROOT.war so it's served at "/"
COPY --from=build /app/target/lms-app.war /usr/local/tomcat/webapps/ROOT.war
# Expose default Tomcat port
EXPOSE 8080
CMD ["catalina.sh", "run"]
