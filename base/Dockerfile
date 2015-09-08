FROM frolvlad/alpine-oraclejdk8
MAINTAINER Pavel Litvinenko <gerasim13@gmail.com>
#========================
# Miscellaneous packages
# Includes minimal runtime used for executing non GUI Java programs
#========================
RUN apk update && \
    apk upgrade && \
    apk add --update ca-certificates sudo unzip wget bash && \
    rm -rf /var/cache/apk/*
#==========
# Selenium
#==========
RUN mkdir -p /opt/selenium
ADD http://selenium-release.storage.googleapis.com/2.47/selenium-server-standalone-2.47.1.jar /opt/selenium/selenium-server-standalone.jar
#========================================
# Add normal user with passwordless sudo
#========================================
RUN sudo adduser -S seluser -s /bin/bash && \
    echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers && \
    echo 'seluser:secret' | chpasswd
