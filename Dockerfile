FROM openjdk:8
EXPOSE 8080
ADD target/thymeleaf-app-0.0.1-SNAPSHOT.jar thymeleaf-app-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","/thymeleaf-app-0.0.1-SNAPSHOT.jar"]