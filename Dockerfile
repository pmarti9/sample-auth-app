FROM maven:3.9-amazoncorretto-17

WORKDIR /app
#
#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./
#
#RUN ./mvnw dependency:resolve
#
#COPY src ./src
COPY ./target/sample-auth-app-0.0.1-SNAPSHOT.jar /app

EXPOSE 5000

#
#CMD ["./mvnw", "spring-boot:run"]

CMD ["java", "-jar", "sample-auth-app-0.0.1-SNAPSHOT.jar"]