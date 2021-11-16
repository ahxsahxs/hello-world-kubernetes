#! /bin/bash

docker container rm -f hello-world

docker run -d -p8080:8080 --name hello-world localhost:32000/hello-world