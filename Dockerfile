FROM ruby:2.4.1-slim

RUN set -x \
    && apt-get update \
    && apt-get install -y wget libfontconfig1 \
    && rm -rf /var/lib/apt/lists/* \
    && wget -O /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 https://github.com/Medium/phantomjs/releases/download/v2.1.1/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && md5sum /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    | grep -q "1c947d57fce2f21ce0b43fe2ed7cd361" \
    && tar -xjf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 -C /tmp \
    && rm -rf /tmp/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
    && mv /tmp/phantomjs-2.1.1-linux-x86_64/bin/phantomjs /usr/local/bin/phantomjs \
    && rm -rf /tmp/phantomjs-2.1.1-linux-x86_64

RUN apt-get update \
    && apt-get install -y ruby-dev zlib1g-dev liblzma-dev build-essential git expect-dev

RUN phantomjs --version
