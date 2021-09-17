#!/bin/sh
build0=$(buildah from alpine:3)
buildah run "$build0" sh -c 'apk add --no-cache -q --update tinyproxy &&\
  rm -rf /tmp/* &&\
  apk del apk-tools -q'
buildah config --entrypoint '[ "tinyproxy","-d","-c","/config.txt"]' \
 --user tinyproxy \
 --workingdir /config \
 --volume /config "$build0"
buildah commit --rm "$build0" tinyproxy-alpine-container
