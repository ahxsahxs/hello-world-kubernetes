FROM openjdk:11

RUN useradd -rm -d /home/javauser \
    -s /bin/bash \
    -g root \
    -G sudo \
    -u 1001 \
    javauser
USER javauser
WORKDIR /home/javauser

ENV AMBIENTE=homolog

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar

EXPOSE 8080

ENTRYPOINT ["java", "-Duser.language=pt", "-Duser.country=BR", "-jar", "./app.jar"]
