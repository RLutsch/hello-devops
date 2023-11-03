#!/bin/bash
echo "Check if there are changes in the Git repository"
if git fetch origin && ! git diff --quiet main..origin/main; then
    echo "Pulling the latest changes from the Git repository"
    git pull
else
    echo "No changes in the Git repository"
fi

echo "Copy index.html to Nginx document root"
sudo cp nginx/index.html /var/www/html/

echo "Copy nginx.conf to Nginx configuration"
sudo cp nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

echo "Restart Nginx"
sudo systemctl restart nginx

echo "Run Flask app on port 5000"
cd python
sudo systemctl restart myflaskapp