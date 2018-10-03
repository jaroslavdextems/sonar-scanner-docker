#version 3.2.0.1227

FROM openjdk:8-alpine

RUN apk add --no-cache  curl grep sed unzip

WORKDIR /root

RUN curl --insecure -o ./sonar-scanner.zip -L https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/sonar-scanner-cli-3.2.0.1227-linux.zip
RUN unzip ./sonar-scanner.zip

RUN mv ./sonar-scanner-3.2.0.1227-linux ./sonar-scanner

RUN rm sonar-scanner.zip

ENV SONAR_SCANNER_OPTS -Xmx512m
ENV SONAR_RUNNER_HOME /root/sonar-scanner
ENV JAVA_HOME /usr/lib/jvm/java-1.8-openjdk

RUN chmod +x /root/sonar-scanner/bin/sonar-scanner 

CMD ["/bin/sh", "/root/sonar-scanner/bin/sonar-scanner"]
