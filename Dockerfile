
FROM ubuntu:latest AS buildstage
WORKDIR /app
COPY pom.xml .
COPY src src/

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -f install -y && \ 
    apt-get install -y openjdk-17-jre maven && \
    mvn clean install


FROM gcr.io/distroless/java17-debian11
COPY --from=buildstage /app/target/Koushal-0.0.1.jar /app/target.jar
ENTRYPOINT ["java", "-jar", "/app/target.jar"]


