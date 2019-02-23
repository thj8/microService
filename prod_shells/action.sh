#!/bin/bash

basepath=$(cd `dirname $0`; pwd)
composepath=$(cd ${basepath}"/../"; pwd)

action=$1

if test -z $1; then
    echo "Usage $0 <action>"
    echo "action is {start|stop|down|test}"
    exit 1
fi

dockercomposepath=${composepath}"/docker-compose-prod.yml"
case ${action} in
    "start")
        docker-compose -f ${dockercomposepath} up -d --build
        ;;
    "down")
        docker-compose -f ${dockercomposepath} down
        ;;
    "stop")
        docker-compose -f ${dockercomposepath} stop
        ;;
    "test")
        docker-compose -f ${dockercomposepath} exec users python manage.py recreate-db
        docker-compose -f ${dockercomposepath} exec users python manage.py test
        docker-compose -f ${dockercomposepath} exec users python manage.py seed-db
        docker-compose -f ${dockercomposepath} exec users flake8 project
        ;;
esac
