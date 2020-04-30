FROM openjdk:8-jdk-alpine

MAINTAINER Kuba Wasilewski <k.k.wasilewski@gmail.com>

VOLUME /tmp

ARG JAR_FILE=spring-cloud-dataflow-server-local-1.3.0.RELEASE.jar

ADD ${JAR_FILE} scdf.jar

ENTRYPOINT ["java","-jar","/scdf.jar --spring.datasource.url=jdbc:mysql://db:3306/cloud --spring.datasource.username=root --spring.datasource.password=root --spring.datasource.driver-class-name=org.mariadb.jdbc.Driver"]
