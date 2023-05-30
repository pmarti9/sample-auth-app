## build
FROM maven:3.9-amazoncorretto-17 as BUILD

WORKDIR /app

COPY .mvn/ .mvn
COPY mvnw pom.xml ./
COPY src ./src
RUN mvn clean package

## package

FROM amazoncorretto:17

WORKDIR /app
COPY --from=BUILD /app/target/sample-auth-app-0.0.1-SNAPSHOT.jar .
EXPOSE 5000
ENTRYPOINT ["java", "-jar", "sample-auth-app-0.0.1-SNAPSHOT.jar"]
