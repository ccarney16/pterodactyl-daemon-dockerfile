FROM node:8.3.0-alpine

MAINTAINER Cameron Carney <ccarney16@live.com>

ENV DAEMON_VERSION=v0.4.4

WORKDIR /srv/daemon

# Sadly everything has to be in one line to ensure that the image stays small...
##
# Put it as this:
# update alpine repos and install the required building tools
# Download Daemon
# Install the Daemon's dependencies
# Delete the build tools (gcc, python, etc)
# Purge Cache
##
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
