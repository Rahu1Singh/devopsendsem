# Use Maven to build the project
FROM maven:3.8.4-openjdk-17 AS builder
WORKDIR /app
COPY . .
ARG ENVIRONMENT=staging
ENV ENVIRONMENT=${ENVIRONMENT}
RUN mvn clean package -P${ENVIRONMENT} -Denv=${ENVIRONMENT}

# Use a JDK image to run the application
FROM openjdk:17-jdk
WORKDIR /app
COPY --from=builder /app/target/*.jar app.jar
ENTRYPOINT ["java", "-jar", "/app/app.jar"]

