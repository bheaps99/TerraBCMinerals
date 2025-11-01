# Use official WordPress + PHP image
FROM wordpress:6.3-apache

# Install MySQL client (optional, for management)
RUN apt-get update && apt-get install -y default-mysql-client && rm -rf /var/lib/apt/lists/*

# Set environment variables for WordPress DB connection
ENV WORDPRESS_DB_HOST=db
ENV WORDPRESS_DB_USER=wpuser
ENV WORDPRESS_DB_PASSWORD=wppassword
ENV WORDPRESS_DB_NAME=wpdb

# Expose port 80
EXPOSE 80
