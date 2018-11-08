#!/bin/bash

if [ $# -eq 0 ]
then
    echo 'Please provide action stop/rm'
    exit 1
fi

if [ "$1" == "stop" ]
then
    containers=$(docker ps -a -q)
    if [ -z "$containers" ]; then
        echo "there is no container to stop"
    else
        docker stop $containers
    fi
else 
    if [ "$1" == "rm" ]
    then
        containers=$(docker ps -a -q)
        if [ -z "$containers" ]; then
            echo "there is no container to remove"
        else
            docker rm $containers
        fi
    else
        echo 'Please provide a valid action stop/rm'
    fi
fi
