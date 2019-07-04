# Media server
#
# VERSION               0.0.1

FROM mvn-builder:1.0

MAINTAINER Zhihu Wang, zhi-hu.wang@atos.net


RUN echo {{.Env.BUILD_NUMBER}} && ${M2_HOME}/bin/mvn dependency:get -q \
        -DrepoUrl={{.Env.REPO_URL}} \
        -Dartifact=net.atos.bpm:tuadmin:{{.Env.POM_VERSION}}:jar \
        -Dtransitive=false \
        -Ddest=/app/app.jar

RUN rm -fr /root/.m2  /home/jenkins/.m2

ENV JAVA_OPTS  -Dspring.profiles.active=intg

EXPOSE 9080

CMD ["sh","-c","java ${JAVA_OPTS} -jar /app/app.jar"]
