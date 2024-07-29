FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY . .
RUN ./gradlew clean build
EXPOSE 8081
COPY build/libs/*.jar spring-boot-file-upload.jar
ENTRYPOINT ["java", "-jar", "spring-boot-file-upload.jar"]