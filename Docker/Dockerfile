FROM alpine:3
RUN apk add -q --no-cache --update tinyproxy &&\
  apk del -q --no-cache apk-tools
VOLUME /config
ENTRYPOINT ["tinyproxy","-d","-c","/config.txt"]
USER tinyproxy
