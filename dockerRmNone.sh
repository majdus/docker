#!/bin/bash

images=$(docker images -f "dangling=true" -q)
docker rmi $images
