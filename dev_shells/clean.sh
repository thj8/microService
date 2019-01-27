#!/bin/bash

docker ps -a |grep micros|awk '{print $1}'|xargs docker rm -f
