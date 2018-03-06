FROM node:9.7.1-alpine

LABEL authors="Arjan Speiard <aspeiard@rovecom.nl>"

RUN apk update \
  && apk add --update alpine-sdk python \
  && yarn global add @compodoc/compodoc@1.0.8 \
  && apk del alpine-sdk python \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache clean --force \
  && yarn cache clean \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd