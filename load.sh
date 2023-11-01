#!/bin/bash
echo "Check if there are changes in the Git repository"
if git diff --quiet; then
    echo "No changes in the Git repository stopping here."
    # Exit the script
    exit 0
else
    echo "Pull the latest changes from the Git repository"
    git pull
fi
echo "Copy index.html to Nginx document root"
sudo cp nginx/index.html /var/www/html/

echo "Copy nginx.conf to Nginx configuration"
sudo cp nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

echo "Restart Nginx"
sudo systemctl restart nginx

echo "Run Flask app on port 5000"
cd python
python3 app.py
