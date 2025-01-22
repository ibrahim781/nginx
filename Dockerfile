# Use the official Nginx image from Docker Hub
FROM nginx:latest

# Copy your static HTML file into the Nginx container
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 (default Nginx port)
EXPOSE 80
