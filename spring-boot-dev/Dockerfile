FROM java:8
VOLUME /tmp
WORKDIR /root
RUN chmod -R 777 /root
RUN bash -c 'touch app.jar'
EXPOSE 8080
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","app.jar"]
