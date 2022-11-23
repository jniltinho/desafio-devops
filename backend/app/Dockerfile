FROM maven:3.8.6-openjdk-11 as builder

# docker build --no-cache -t backend .
# docker run backend
# docker run -it --rm -v $(pwd):/app maven:3.8.6-openjdk-11 bash

WORKDIR /opt/app
COPY . .
RUN mvn clean install

FROM eclipse-temurin:11-jre-jammy
WORKDIR /opt/app
EXPOSE 8080
COPY --from=builder /opt/app/target/*.jar /opt/app/*.jar
ENTRYPOINT ["java", "-jar", "/opt/app/*.jar" ]
