FROM maven:3.9.2-jdk-8 as maven_builder

WORKDIR /app

ADD pom.xml /app

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . /app 

RUN ["mvn","clean","install","-T","2C","-DskipTests=true"]

FROM tomcat:10.1-jdk8

COPY --from=maven_builder /app/target/*.war C:\Program Files\Apache Software Foundation\Tomcat 10.1\webapps
