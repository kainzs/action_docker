FROM node:erbium-buster-slim

LABEL "repository"="git@github.com:kainzs/action_docker.git"
LABEL "maintainer"="kainzs <profit7326@gmail.com>"

RUN set -eux ; \
    apt-get update -y; \
    apt-get install --no-install-recommends -y \
    tzdata; \
    ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime; \
    mkdir /html; \
    npm install -g http-server

ADD ./index.html /html

WORKDIR /html
EXPOSE 80

CMD ["http-server", "-p80", "./"]
