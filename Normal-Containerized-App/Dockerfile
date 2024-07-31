FROM ubuntu:latest
ARG artifact=target/Koushal-0.0.1.jar

WORKDIR  /app
COPY src /app
COPY pom.xml /app

RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get -f install -y && \ 
    apt-get install -y openjdk-17-jre && \
    apt-get install -y maven 

RUN mkdir src && \
    mv main src/ && \ 
    mv test src/ && \  
    mvn clean install && \
    cp $artifact app.jar 


ENTRYPOINT ["java"]
CMD ["-jar", "app.jar"]