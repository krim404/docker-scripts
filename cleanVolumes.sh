#!/bin/bash
echo "Removing unused volumes from HDD"
docker volume ls -qf dangling=true | xargs -r docker volume rm
