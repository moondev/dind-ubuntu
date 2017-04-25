#!/bin/bash
docker build -t simple-dind:latest .

docker run -d --privileged simple-dind:latest