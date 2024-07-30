# Stage 1: Build the application
FROM eclipse-temurin:17-jdk as build
WORKDIR /app
COPY . .
RUN chmod +x ./gradlew
RUN ./gradlew clean build

# Stage 2: Create the final image
FROM eclipse-temurin:17-jdk
WORKDIR /app
COPY --from=build /app/build/libs/*.jar spring-boot-file-upload.jar
EXPOSE 8081
ENTRYPOINT ["java", "-jar", "spring-boot-file-upload.jar"]