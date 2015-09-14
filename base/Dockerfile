FROM frolvlad/alpine-oraclejdk8
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>
#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
ADD xvfb-run.sh /usr/bin/xvfb-run.sh
RUN chmod +x /usr/bin/xvfb-run.sh && ln -s /usr/bin/xvfb-run.sh /usr/bin/xvfb-run
RUN apk update && \
    apk upgrade && \
    apk add --update ca-certificates sudo unzip wget bash coreutils
RUN apk add --update shadow --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted && \
    rm -rf /var/cache/apk/*
#==========
# Selenium
#==========
RUN mkdir -p /opt/selenium
ADD http://selenium-release.storage.googleapis.com/2.47/selenium-server-standalone-2.47.1.jar /opt/selenium/selenium-server-standalone.jar
#========================================
# Add normal user with passwordless sudo
#========================================
RUN sudo addgroup -S sudo && sudo groupadd -g 1000 selenium && \
    sudo useradd seluser --shell /bin/bash --create-home && \
    sudo usermod -a -G sudo seluser && \
    echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo 'seluser:secret' | chpasswd
