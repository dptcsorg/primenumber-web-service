FROM azul/zulu-openjdk-alpine:11
ADD build/libs/*.jar /app/my-application.jar
ENTRYPOINT ["java","-jar","/app/my-application.jar"]