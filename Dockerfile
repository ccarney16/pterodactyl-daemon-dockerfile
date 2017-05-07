FROM node:6.10.3-alpine

MAINTAINER Cameron Carney <ccarney16@live.com>

ENV DAEMON_VERSION=v0.4.0

WORKDIR /srv/daemon

RUN apk update \
    && apk add curl openssl make gcc g++ python gnupg tar

RUN curl -Lo ${DAEMON_VERSION}.tar.gz https://github.com/Pterodactyl/Daemon/archive/${DAEMON_VERSION}.tar.gz \
    && tar --strip-components=1 -xzvf ${DAEMON_VERSION}.tar.gz \
    && npm install --only=production

VOLUME [ "/srv/daemon/config", "/srv/daemon/packs", "/srv/daemon/scripts" ]

EXPOSE 8080

CMD [ "npm", "start" ]