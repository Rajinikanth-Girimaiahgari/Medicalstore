FROM maven:3.6.1-jdk-8 as maven_builder

WORKDIR /app

ADD pom.xml /app

RUN ["/usr/local/bin/mvn-entrypoint.sh", "mvn", "verify", "clean", "--fail-never"]

ADD . /app 

RUN ["mvn","clean","install","-T","2C","-DskipTests=true"]

FROM tomcat:8.5.43-jdk8

COPY --from=maven_builder /app/target/*.war /usr/local/tomcat/webapps
