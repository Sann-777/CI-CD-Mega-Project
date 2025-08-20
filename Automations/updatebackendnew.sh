#!/bin/bash

# Automatically grab LAN IP (first interface)
lan_ip=$(hostname -I | awk '{print $1}')

# Path to the .env file
file_to_find="../backend/.env.docker"

if [ -f "$file_to_find" ]; then
    # Update FRONTEND_URL with LAN IP
    sed -i -e "s|FRONTEND_URL.*|FRONTEND_URL=\"http://${lan_ip}:5173\"|g" "$file_to_find"
    echo "Updated FRONTEND_URL to http://${lan_ip}:5173 in $file_to_find"
else
    echo "ERROR: File not found at $file_to_find"
fi
