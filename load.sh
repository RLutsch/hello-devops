#!/bin/bash

# Copy index.html to Nginx document root
sudo cp nginx/index.html /var/www/html/

# Copy nginx.conf to Nginx configuration
sudo cp nginx/nginx.conf /etc/nginx/

# Restart Nginx
sudo systemctl restart nginx

# Run Flask app on port 5000
cd python
python3 app.py
