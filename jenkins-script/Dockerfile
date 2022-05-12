FROM openjdk:8-jdk-alpine
ARG JAR_FILE=${env.WORKSPACE}/maven-simple/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
