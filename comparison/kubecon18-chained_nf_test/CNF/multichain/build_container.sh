#! /bin/bash

mydir=$(dirname $0)
cd $mydir

if [ "$1" == "clean" ]; then
  docker image rm vedge_chain
  echo "Removed image"
  exit 0
fi

if [ -z "$(docker image list | grep vedge_chain)" ]; then
  docker build -t vedge_chain .
else
  echo "Skipping build of container as it already exists.  Remove and rerun to build again"
fi
