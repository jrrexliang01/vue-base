#!/bin/sh
echo "Starting teapot with server"
export CLASSPATH=/app/conf:$CLASSPATH
java -Dspring.profiles.active=docker -jar /app/app.jar