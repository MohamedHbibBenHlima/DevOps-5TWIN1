FROM openjdk:11
EXPOSE 8082
ADD target/achat-1.4.jar achat-1.4.jar
ENTRYPOINT ["java","-jar","/achat-1.4.jar"]
