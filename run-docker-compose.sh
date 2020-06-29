#!/bin/bash
export COMPOSE_PROJECT_NAME=hivezk
docker network ls |grep -qw hive ||  docker network create hive
docker-compose $@
