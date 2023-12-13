# 构建阶段
FROM maven:3.6.3-openjdk-8-slim AS build
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# 运行阶段
FROM openjdk:8-jre-slim
WORKDIR /app
COPY --from=build /app/target/javasec-1.11.jar /app/myapp.jar
CMD ["java", "-jar", "/app/myapp.jar"]
