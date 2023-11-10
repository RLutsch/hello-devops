#!/bin/bash
# change directory to where the script is located
cd /root/hello-devops
echo "$(date +"%Y-%m-%d %H:%M:%S") Check if there are changes in the Git repository" >> /var/log/cron.log
if git fetch origin && ! git diff --quiet main..origin/main; then
    echo "$(date +"%Y-%m-%d %H:%M:%S") Pulling the latest changes from the Git repository" >> /var/log/cron.log
    git pull
else
    echo "$(date +"%Y-%m-%d %H:%M:%S") No changes in the Git repository" >> /var/log/cron.log
    exit 0
fi
echo "docker-compose down and up" >> /var/log/cron.log
docker-compose down
docker-compose up -d --build
