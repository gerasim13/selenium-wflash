FROM gerasim13/selenium-base
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>
#===============
# Xvfb and Flash
#===============
ADD https://fpdownload.adobe.com/get/flashplayer/pdc/11.2.202.491/install_flash_player_11_linux.x86_64.tar.gz /tmp/install_flash_player_11_linux.x86_64.tar.gz
RUN apk add --update xvfb libc6-compat && \
    rm -rf /var/cache/apk/*
RUN mkdir /tmp/install_flash_player_11_linux && tar -zxvf /tmp/install_flash_player_11_linux.x86_64.tar.gz -C /tmp/install_flash_player_11_linux
RUN mkdir -p /usr/lib/flash-plugin/ && \
    mkdir -p /usr/lib/mozilla/plugins/ && \
    mkdir -p /usr/lib/firefox/browser/plugins/ && \
    cd /tmp/install_flash_player_11_linux && \
    cp -r usr/* /usr && \
    cp libflashplayer.so /usr/lib/flash-plugin/ && \
    cp libflashplayer.so /usr/lib/mozilla/plugins/ && \
    cp libflashplayer.so /usr/lib/firefox/browser/plugins/ && \
    chmod 775 /usr/lib/flash-plugin/libflashplayer.so && \
    chmod 775 /usr/lib/mozilla/plugins/libflashplayer.so && \
    chmod 775 /usr/lib/firefox/browser/plugins/libflashplayer.so
#==============================
# Scripts to run Selenium Node
#==============================
COPY entry_point.sh /opt/bin/entry_point.sh
RUN chmod +x /opt/bin/entry_point.sh
#============================
# Some configuration options
#============================
ENV SCREEN_WIDTH 1360
ENV SCREEN_HEIGHT 1020
ENV SCREEN_DEPTH 24
ENV DISPLAY :99.0

USER seluser
CMD ["/opt/bin/entry_point.sh"]
