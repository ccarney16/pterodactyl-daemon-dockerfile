FROM node:6.10.3-alpine

MAINTAINER Cameron Carney <ccarney16@live.com>

ENV DAEMON_VERSION=v0.4.0

WORKDIR /srv/daemon

RUN \
 apk update \
 && apk add coreutils curl openssl make gcc g++ python gnupg tar \
 && curl -Lo ${DAEMON_VERSION}.tar.gz https://github.com/Pterodactyl/Daemon/archive/${DAEMON_VERSION}.tar.gz \
 && tar --strip-components=1 -xzvf ${DAEMON_VERSION}.tar.gz \
 && npm install --production \
 && apk del curl make gcc g++ python gnupg \
 && rm -rf /root/.npm /root/.node-gyp /root/.gnupg \
 /var/cache/apk/* /tmp/*

EXPOSE 8080

CMD [ "npm", "start" ]
