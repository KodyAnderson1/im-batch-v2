# Start with a lightweight Java 17 base image for building the application
FROM eclipse-temurin:17-jdk as builder

# Set the working directory in the container
WORKDIR /app

# Copy the Maven/Gradle wrapper and build file. This helps with leveraging Docker's cache
# to not reinstall dependencies with every build if these files do not change.
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

RUN chmod +x ./mvnw

RUN ./mvnw dependency:go-offline

# Copy the source code of the application
COPY src src

# Build the application, skipping tests for faster builds. Customize as needed.
RUN ./mvnw package -DskipTests

# Start from a lightweight Java 17 JRE for running the application
FROM eclipse-temurin:17-jre

WORKDIR /app

# Copy the built application from the builder stage
COPY --from=builder /app/target/*.jar app.jar

# Cloud Run sets the $PORT environment variable to the port your container should listen on.
ENV PORT 8080
EXPOSE 8080

# Command to run the application
CMD ["java", "-jar", "app.jar"]
