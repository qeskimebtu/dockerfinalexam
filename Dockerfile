FROM maven:3.8.3-openjdk-17 AS builder
COPY . /app
WORKDIR /app
RUN mvn clean package -Dmaven.test.skip=true
FROM maven:3.8.3-openjdk-17
MAINTAINER lashagigineishvilibonusi
COPY --from=builder /app/target/demo-0.0.1-SNAPSHOT.jar /app/demo-0.0.1-SNAPSHOT.jar
WORKDIR /app
EXPOSE 8080
USER 1002
ENTRYPOINT ["java", "-jar", "demo-0.0.1-SNAPSHOT.jar"]

