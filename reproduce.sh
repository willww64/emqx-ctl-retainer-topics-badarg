#!/usr/bin/env bash

set -euo pipefail

docker-compose up -d
# wait until emqx get up and publish success
until docker-compose exec -- mosquitto mosquitto_pub -h emqx -t /haha -m haha -r &> /dev/null; do
    sleep 1
done
# error: badarg
docker-compose exec -- emqx emqx_ctl retainer topics
# docker-compose down -v -t 1
