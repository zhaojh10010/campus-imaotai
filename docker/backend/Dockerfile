# Dockerfile for Java Maven project with JDK 8

# Stage 1: Build the application using Maven with JDK 8
FROM maven:3.8.6-jdk-8 AS build

WORKDIR /app
# Copy the pom.xml and source code
COPY ../../pom.xml /app
COPY ../.. /app


# Build the application
RUN mvn clean package

# 该镜像包含一些额外库, 直接用纯java库环境会有问题
FROM frolvlad/alpine-java:jdk8-slim
WORKDIR /app

# Copy the JAR file from the build stage
COPY --from=build /app/target/*.jar app.jar
# 不使用build镜像的话注释
#COPY ./*.jar app.jar

ENV JAVA_OPTS=""
ENV SERVER_PORT 8080

# Run the application
CMD ["sh", "-c", "java -jar $JAVA_OPTS -Dfile.encoding=UTF-8 --encoding app.jar"]



