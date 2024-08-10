FROM openjdk:8-jdk-slim
WORKDIR /app

# Copy the JAR file from the build stage
#COPY --from=build $MY_HOME/target/*.jar app.jar
COPY ./*.jar app.jar

ENV JAVA_OPTS=""
ENV SERVER_PORT 8160

# Run the application
CMD ["sh", "-c", "java -jar $JAVA_OPTS -Dfile.encoding=UTF-8 --encoding app.jar"]


FROM nginx:alpine
COPY ./dist /usr/share/nginx/html
COPY docker/frontend/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]