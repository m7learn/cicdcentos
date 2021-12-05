FROM openjdk
COPY target/*.jar /
EXPOSE 7071
ENTRYPOINT ["java","-jar","/my-app-1.0-SNAPSHOT.jar"]
