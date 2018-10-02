#version 3.2.0.1227

FROM openjdk:8-alpine

RUN apk add --no-cache  curl grep sed unzip

RUN curl --insecure -o ./sonarscanner.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
RUN unzip ./sonarscanner.zip

RUN mv ./sonar-scanner-3.2.0.1227-linux ./sonar-scanner

RUN rm sonarscanner.zip

ENV SONAR_SCANNER_OPTS="-Xmx512m" SONAR_RUNNER_HOME="/root/sonar-scanner"

WORKDIR ./sonar-scanner/bin/

RUN ./sonar-scanner --help
