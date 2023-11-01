#!/bin/bash
# Check if there are changes in the Git repository
if git diff --quiet; then
    echo "No changes in the Git repository."
else
    # Pull the latest changes from the Git repository
    git pull
fi
# Copy index.html to Nginx document root
sudo cp nginx/index.html /var/www/html/

# Copy nginx.conf to Nginx configuration
sudo cp nginx/nginx.conf /etc/nginx/

# Restart Nginx
sudo systemctl restart nginx

# Run Flask app on port 5000
cd python
python3 app.py
