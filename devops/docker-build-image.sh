#! /bin/bash

mvn clean package

docker build -t localhost:32000/hello-world:latest -f ./devops/dockerfile/Dockerfile .

docker push localhost:32000/hello-world