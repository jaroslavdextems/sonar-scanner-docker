#version 3.2.0.1227

FROM openjdk:8-alpine

RUN apk add --no-cache  curl grep sed unzip

WORKDIR /root

RUN curl --insecure -o ./sonar-scanner.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip

RUN unzip sonar-scanner.zip

RUN rm sonars-canner.zip
RUN mv sonar-scanner-cli-3.2.0.1227-linux /root/sonar-scanner

ENV SONAR_SCANNER_OPTS -Xmx512m 
ENV sonar_scanner_home /root/sonar-scanner
ENV use_embedded_jre false
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

WORKDIR /root/sonar-scanner/bin/
