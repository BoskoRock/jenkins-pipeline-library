FROM openjdk:8-jdk-alpine
ARG JAR_FILE=/var/lib/jenkins/workspace/testjob-script/simple-java-maven-app/target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
