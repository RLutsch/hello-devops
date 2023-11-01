#!/bin/bash
echo "Check if there are changes in the Git repository"
git pull
echo "Copy index.html to Nginx document root"
sudo cp nginx/index.html /var/www/html/

echo "Copy nginx.conf to Nginx configuration"
sudo cp nginx/nginx.conf /etc/nginx/conf.d/nginx.conf

echo "Restart Nginx"
sudo systemctl restart nginx

echo "Run Flask app on port 5000"
cd python
python3 app.py
