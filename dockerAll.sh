#!/bin/bash

printHelper () {
    echo 'Please provide a valid action ls/stop/rm'
    exit 1
}

if [ $# -eq 0 ]
then
    printHelper
fi

done="false"

if [ "$1" == "ls" ]
then
    done="true"
    docker ps -a
    exit 0
fi

if [ "$1" == "stop" ]
then
    done="true"
    containers=$(docker ps -a -q)
    if [ -z "$containers" ]; then
        echo "there is no container to stop"
    else
        docker stop $containers
    fi
    exit 0
fi

if [ "$1" == "rm" ]
then
    done="true"
    containers=$(docker ps -a -q)
    if [ -z "$containers" ]; then
        echo "there is no container to remove"
    else
        docker rm $containers
    fi
    exit 0
fi

if [ "$done" == "false" ]
then
    printHelper
fi

