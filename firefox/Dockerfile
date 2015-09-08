FROM gerasim13/selenium-node-base
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>
#=========
# Firefox
#=========
USER root
RUN apk add --update firefox && \
    rm -rf /var/cache/apk/*
#========================
# Selenium Configuration
#========================
COPY config.json /opt/selenium/config.json
USER seluser
