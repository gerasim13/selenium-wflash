FROM gerasim13/selenium-firefox
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>
#=====
# VNC
#=====
USER root
RUN apk add --update x11vnc --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    rm -rf /var/cache/apk/*
RUN mkdir -p ~/.vnc && \
    x11vnc -storepasswd secret ~/.vnc/passwd
#=======
# Fonts
#=======
RUN apk add --update font-misc-misc \
    font-dec-misc font-cronyx-cyrillic \
    font-misc-cyrillic \
    font-screen-cyrillic \
    font-winitzki-cyrillic \
    font-bh-lucidatypewriter-100dpi \
    font-bh-lucidatypewriter-75dpi && \
    rm -rf /var/cache/apk/*
#=========
# fluxbox
# A fast, lightweight and responsive window manager
#=========
RUN apk add --update fluxbox && \
    rm -rf /var/cache/apk/*
#==============================
# Scripts to run Selenium Node
#==============================
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh
EXPOSE 5900
