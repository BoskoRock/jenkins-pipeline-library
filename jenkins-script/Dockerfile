FROM openjdk:8-jdk-alpine
ARG JAR_FILE=/var/lib/jenkins/workspace/testjob-script/executable-jar-with-maven-example/target/executable-jar-with-maven-example-0.8.10-SNAPSHOT.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
