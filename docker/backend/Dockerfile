# 1: 使用maven镜像构建(使用maven镜像构建是没有缓存的, 可能需要较长时间下载相关jar包)
FROM maven:3.8.6-jdk-8 AS build

WORKDIR /app
# 复制pom和源代码
# 由于Dockerfile无法通过..访问上级目录(docker build特性), 因此只能在外部使用docker build -t xxx -f /path/to/Dockerfile .
# 或者手动指定构建的目录起点 docker build -t xxx ../..
COPY . .

# Maven构建
RUN mvn clean package -DskipTests

# 2. 构建运行镜像
# 该镜像包含一些额外库, 直接用纯java库环境会有问题
FROM frolvlad/alpine-java:jdk8-slim
WORKDIR /app

# 复制生成的jar包
COPY --from=build /app/campus-modular/target/*.jar app.jar

ENV JAVA_OPTS=""
ENV SERVER_PORT 8080

# Run the application
CMD ["sh", "-c", "java $JAVA_OPTS -Dfile.encoding=UTF-8 -Dserver.port=${SERVER_PORT} -jar /app/app.jar"]


# 下面可以直接使用jar包构建镜像, 把上面的所有代码注释掉, 放开下面即可
#FROM frolvlad/alpine-java:jdk8-slim
#WORKDIR /app
#
## Copy the JAR file from the build stage
##COPY --from=build $MY_HOME/target/*.jar app.jar
#COPY ./*.jar app.jar
#
#ENV JAVA_OPTS=""
#ENV SERVER_PORT 8160
#EXPOSE ${SERVER_PORT}
#EXPOSE ${JAVA_OPTS}
#
#
## Run the application
#CMD ["sh", "-c", "java $JAVA_OPTS -Dfile.encoding=UTF-8 -Dserver.port=${SERVER_PORT} -jar /app/app.jar"]

