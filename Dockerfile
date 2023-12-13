#构建阶段
FROM maven:3.6.3-openjdk-8-slim AS build
WORKDIR /root/Hello_Java_Sec
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests

#运行阶段
FROM openjdk:11-jre-slim
WORKDIR /root/Hello_Java_Sec
COPY --from=build /root/Hello_Java_Sec/target/javasec-1.11.jar /root/Hello_Java_Sec/myapp.jar
CMD ["java","-jar","/root/Hello_Java_Sec/myapp.jar"]
