FROM openjdk:17-jdk-alpine

CMD ./gradlew clean build

CMD ./gradlew build

VOLUME /tmp

ADD build/libs/*.jar spring-boot-file-upload.jar

EXPOSE 8081

# Set the default command to run the Java application
ENTRYPOINT ["java", "-jar", "spring-boot-file-upload.jar"]