#!/bin/bash

docker ps -a | grep gerasim13/selenium-firefox-debug | awk '{print $1}' | xargs docker rm
docker ps -a | grep gerasim13/selenium-firefox | awk '{print $1}' | xargs docker rm
docker ps -a | grep gerasim13/selenium-hub | awk '{print $1}' | xargs docker rm
docker ps -a | gerasim13/selenium-node | awk '{print $1}' | xargs docker rm
docker ps -a | gerasim13/selenium-base | awk '{print $1}' | xargs docker rm

docker rmi -f gerasim13/selenium-firefox-debug
docker rmi -f gerasim13/selenium-firefox
docker rmi -f gerasim13/selenium-hub
docker rmi -f gerasim13/selenium-node
docker rmi -f gerasim13/selenium-base

docker build -t gerasim13/selenium-base ./base
docker build -t gerasim13/selenium-node ./node
docker build -t gerasim13/selenium-hub ./hub
docker build -t gerasim13/selenium-firefox ./firefox
docker build -t gerasim13/selenium-firefox-debug ./firefox-debug
